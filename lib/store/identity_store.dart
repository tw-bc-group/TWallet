import 'dart:async';
import 'dart:math';

import 'package:get/get.dart';
import 'package:json_store/json_store.dart';
import 'package:mobx/mobx.dart';
import 'package:more/tuple.dart';
import 'package:optional/optional_internal.dart';
import 'package:tw_wallet_ui/common/util.dart';
import 'package:tw_wallet_ui/models/amount.dart';
import 'package:tw_wallet_ui/models/identity/decentralized_identity.dart';
import 'package:tw_wallet_ui/models/tw_balance.dart';
import 'package:tw_wallet_ui/service/blockchain.dart';
import 'package:tw_wallet_ui/service/contract.dart';
import 'package:tw_wallet_ui/store/mnemonics.dart';
import 'package:uuid/uuid.dart';

part 'identity_store.g.dart';

const identityStorageName = 'identities';
const identityNameKey = 'name';
const selectedIndexKey = 'selected_index';
const didHealthCertSelectIndexKey = 'did_health_cert_select_index';

enum AssetsType { point, token }

class IdentityStore extends IdentityStoreBase with _$IdentityStore {
  IdentityStore(
    ObservableList<DecentralizedIdentity> identities,
    int didHealthSelectIndex,
    String? lastSelectedIdentityId,
    JsonStore db,
  ) : super(
          identities: identities,
          healthCertLastSelectIndex: didHealthSelectIndex,
          lastSelectedIdentityId: lastSelectedIdentityId,
          db: db,
        );

  static Future<IdentityStore> init() async {
    final int didHealthSelectIndex =
        await identityDb.getItem(didHealthCertSelectIndexKey).then((savedItem) {
      return savedItem != null
          ? (savedItem[didHealthCertSelectIndexKey] as int?)!
          : 0;
    });

    final List<DecentralizedIdentity> identities = Optional.ofNullable(
      await identityDb.getListLike('$identityNameKey: %'),
    )
        .map(
      (listItems) => listItems.map(
        (item) {
          return DecentralizedIdentity.fromJson(item);
        },
      ).toList(),
    )
        .orElse([]);

    final Map<String, dynamic>? lastSelectedIdentityIdItem =
        await identityDb.getItem('lastSelectedIdentityId');
    final lastSelectedIdentityId = (lastSelectedIdentityIdItem != null
        ? lastSelectedIdentityIdItem['id']
        : '') as String?;

    return IdentityStore(
      ObservableList.of(identities),
      didHealthSelectIndex,
      lastSelectedIdentityId,
      identityDb,
    );
  }

  static JsonStore get identityDb =>
      Get.find<JsonStore>(tag: identityStorageName);
}

abstract class IdentityStoreBase with Store {
  JsonStore db;

  IdentityStoreBase({
    required this.identities,
    required this.healthCertLastSelectIndex,
    String? lastSelectedIdentityId,
    required this.db,
  }) {
    _streamController = StreamController();
    _selectStreamController = StreamController();

    fetchBalanceFutureStream = ObservableStream(
      _streamController.stream,
      initialValue: ObservableFuture(Future.value(TwBalance.zero)),
    );

    selectedIdentityStream = ObservableStream(_selectStreamController.stream);

    _identitiesSort();
    selectedIdentity = getIdentityById(lastSelectedIdentityId);
    if (selectedIdentity != null && selectedIdentity!.id.isNotEmpty) {
      _selectStreamController.add(selectedIdentity!);
    }
  }

  DecentralizedIdentity? getIdentityById(String? id) {
    return identities.firstWhereOrNull(
      (e) => e.id == id,
    );
  }

  @observable
  int healthCertLastSelectIndex = 0;

  @observable
  ObservableList<DecentralizedIdentity> identities =
      ObservableList<DecentralizedIdentity>();

  @computed
  List<DecentralizedIdentity> get identitiesWithoutDapp =>
      identities.where((element) => element.dappId.isEmpty).toList();

  @computed
  List<DecentralizedIdentity> get identitiesWithDapp =>
      identities.where((element) => element.dappId.isNotEmpty).toList();

  @observable
  String searchName = '';

  late StreamController<ObservableFuture<TwBalance>> _streamController;

  ObservableStream<ObservableFuture<TwBalance>>? fetchBalanceFutureStream;

  late StreamController<DecentralizedIdentity> _selectStreamController;
  ObservableStream<DecentralizedIdentity>? selectedIdentityStream;

  @observable
  DecentralizedIdentity? selectedIdentity;

  @computed
  String get selectedIdentityName => selectedIdentity?.profileInfo.name ?? '';

  @computed
  String get selectedIdentityAddress => selectedIdentity?.address ?? '';

  @computed
  String get selectedIdentityDid => selectedIdentity?.did.toString() ?? '';

  @computed
  Amount get selectedIdentityBalance =>
      selectedIdentity?.accountInfo.balance ?? Amount.zero;

  @computed
  List<DecentralizedIdentity> get identitiesExceptSelected {
    final List<DecentralizedIdentity> ids =
        identities.where((e) => e.dappId.isEmpty).toList();
    if (selectedIdentity != null) {
      ids.removeWhere((it) => it.id == selectedIdentity!.id);
      return [selectedIdentity!] + ids;
    }
    return ids;
  }

  @computed
  List<DecentralizedIdentity> get selectedFirstIdentitiesInHealthDApp {
    final List<DecentralizedIdentity> ids =
        identities.where((identity) => identity.dappId.isEmpty).toList();
    final DecentralizedIdentity selectedIdentity =
        ids.removeAt(healthCertLastSelectIndex);
    return [selectedIdentity] + ids;
  }

  void _identitiesSort() {
    identities.sort(
      (identity1, identity2) =>
          identity1.profileInfo.name.compareTo(identity2.profileInfo.name),
    );
  }

  Future<void> dispose() async {
    await _streamController.close();
    await _selectStreamController.close();
  }

  Future<int> restore() async {
    final MnemonicsStore mnemonicsStore = Get.find<MnemonicsStore>();
    final List<dynamic> queryResult = await Get.find<ContractService>()
        .identitiesContract!
        .callFunction(mnemonicsStore.firstPublicKey, 'identityOf', null);
    if (queryResult.isNotEmpty) {
      await clear();
      return restoreIdentities(queryResult);
    }
    return -1;
  }

  Future<int> restoreIdentities(
    List<dynamic> queryResult,
  ) async {
    final MnemonicsStore mnemonicsStore = Get.find<MnemonicsStore>();
    final identities = Util.assemble(queryResult);
    final ids = identities.map((e) {
      final Tuple2<String, String> keypair = mnemonicsStore.indexKeys(e.index);
      return DecentralizedIdentity(
        (identity) => identity
          ..id = const Uuid().v1()
          ..profileInfo.name = e.name
          ..accountInfo.pubKey = keypair.first
          ..accountInfo.priKey = keypair.second
          ..accountInfo.index = e.index
          ..accountInfo.address =
              BlockChainService.publicKeyToAddress(keypair.first)
          ..dappId = e.dappId
          ..extra = e.extraInfo,
      );
    });

    await Future.wait(ids.map((id) => addIdentity(identity: id)));

    return identities.map((e) => e.index).reduce(max);
  }

  @action
  Future<void> clear() async {
    await db.clearDataBase();
    healthCertLastSelectIndex = 0;
    identities.clear();
  }

  @action
  Future<DecentralizedIdentity> addIdentity({
    required DecentralizedIdentity identity,
  }) async {
    return db
        .setItem(_itemKey(identity.profileInfo.name), identity.toJson())
        .then((_) {
      final isFirstIdentity = identities
              .where((identity) => identity.dappId.isEmpty)
              .toList()
              .isEmpty &&
          identity.dappId.isEmpty;
      identities.add(identity);
      _identitiesSort();
      if (isFirstIdentity) {
        selectIdentity(identity);
      }
      return identity;
    });
  }

  @action
  Future<void> selectIdentity(DecentralizedIdentity identity) async {
    final int index = identities.indexWhere(
      (it) => it.id == identity.id,
    );

    final lastSelectedIdentity = selectedIdentity;

    if (index >= 0) {
      selectedIdentity = identities[index];
      await db.setItem(
        'lastSelectedIdentityId',
        selectedIdentity!.toJson(),
      );
    } else {
      throw Exception('Identity selected not exist.');
    }

    if (lastSelectedIdentity != selectedIdentity) {
      _selectStreamController.add(selectedIdentity!);
    }
  }

  @action
  Future<void> updateIdentity(DecentralizedIdentity identity) async {
    final int index = identities.indexWhere((it) => it.id == identity.id);
    if (index >= 0) {
      await db
          .setItem(
            _itemKey(identities[index].profileInfo.name),
            identity.toJson(),
          )
          .then((_) => identities[index] = identity);
    } else {
      throw Exception('Identity updated not exist.');
    }
  }

  @action
  void fetchLatestPoint({bool? withLoading}) {
    final identity = selectedIdentity;
    if (identity != null) {
      TwBalance.fetchBalance(
        address: identity.address,
        withLoading: withLoading!,
      ).then((res) {
        res.ifPresent((balance) {
          selectedIdentity = identity.rebuild(
            (builder) => builder.accountInfo.balance = balance.amount,
          );
          updateIdentity(identity);
          _streamController.add(ObservableFuture(Future.value(balance)));
        });
      });
    }
  }

  @action
  Future updateHealthCertLastSelected(DecentralizedIdentity identity) async {
    final int index = identities.indexWhere((e) => e.id == identity.id);
    if (index >= 0) {
      healthCertLastSelectIndex = index;
    } else {
      throw Exception('Identity updateHealthCertSelectedIdentity not exist.');
    }

    const key = didHealthCertSelectIndexKey;
    await db.setItem(key, {key: index});
  }

  String _itemKey(String name) {
    return '$identityNameKey: $name';
  }
}
