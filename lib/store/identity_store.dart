import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:json_store/json_store.dart';
import 'package:mobx/mobx.dart';
import 'package:more/tuple.dart';
import 'package:optional/optional_internal.dart';
import 'package:tw_wallet_ui/models/amount.dart';
import 'package:tw_wallet_ui/models/identity/decentralized_identity.dart';
import 'package:tw_wallet_ui/models/tw_balance.dart';
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
  IdentityStore(ObservableList<DecentralizedIdentity> identities,
      int didHealthSelectIndex, String lastSelectedIdentityId)
      : super(identities, didHealthSelectIndex, lastSelectedIdentityId);

  static Future<IdentityStore> init() async {
    final int didHealthSelectIndex = await IdentityStoreBase._db
        .getItem(didHealthCertSelectIndexKey)
        .then((savedItem) {
      return savedItem != null
          ? savedItem[didHealthCertSelectIndexKey] as int
          : 0;
    });

    final List<DecentralizedIdentity> identities = Optional.ofNullable(
      await IdentityStoreBase._db.getListLike('$identityNameKey: %'),
    )
        .map(
      (listItems) => listItems.map((item) {
        return DecentralizedIdentity.fromJson(item);
      }).toList(),
    )
        .orElse([]);

    final Map<String, dynamic>? lastSelectedIdentityIdItem =
        await IdentityStoreBase._db.getItem('lastSelectedIdentityId');
    final lastSelectedIdentityId = (lastSelectedIdentityIdItem != null
        ? lastSelectedIdentityIdItem['id']
        : '') as String;

    return IdentityStore(
      ObservableList.of(identities),
      didHealthSelectIndex,
      lastSelectedIdentityId,
    );
  }
}

String _itemKey(String name) {
  return '$identityNameKey: $name';
}

abstract class IdentityStoreBase with Store {
  static final _db = JsonStore(dbName: identityStorageName);

  IdentityStoreBase(
    this.identities,
    this.healthCertLastSelectIndex,
    String lastSelectedIdentityId,
  ) {
    _streamController = StreamController();
    _selectStreamController = StreamController();

    fetchBalanceFutureStream = ObservableStream(
      _streamController.stream,
      initialValue: ObservableFuture(Future.value()),
    );

    selectedIdentityStream = ObservableStream(_selectStreamController.stream);

    _identitiesSort();
    selectedIdentity =
        Optional.ofNullable(getIdentityById(lastSelectedIdentityId))
          ..ifPresent((identity) {
            if (identity.id.isNotEmpty) {
              _selectStreamController.add(identity);
            }
          });
  }

  DecentralizedIdentity? getIdentityById(String id) {
    return identities.firstWhere(
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

  late ObservableStream<ObservableFuture<TwBalance>> fetchBalanceFutureStream;

  late StreamController<DecentralizedIdentity> _selectStreamController;
  late ObservableStream<DecentralizedIdentity> selectedIdentityStream;

  @observable
  Optional<DecentralizedIdentity> selectedIdentity = Optional.empty();

  @computed
  String get selectedIdentityName =>
      selectedIdentity.map((identity) => identity.profileInfo.name).orElse('');

  @computed
  String get selectedIdentityAddress =>
      selectedIdentity.map((identity) => identity.address).orElse('');

  @computed
  String get selectedIdentityDid =>
      selectedIdentity.map((identity) => identity.did.toString()).orElse('');

  @computed
  Amount get selectedIdentityBalance => selectedIdentity
      .map((identity) => identity.accountInfo.balance ?? Amount.zero)
      .value;

  @computed
  List<DecentralizedIdentity> get identitiesExceptSelected {
    final List<DecentralizedIdentity> ids =
        identities.where((e) => e.dappId.isEmpty).toList();
    if (selectedIdentity.isPresent) {
      ids.removeWhere((ele) => ele.id == selectedIdentity.first.id);
      return [selectedIdentity.first] + ids;
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
    int maxIndex = -1;

    final MnemonicsStore _mnemonicsStore = Get.find<MnemonicsStore>();
    final List<dynamic> queryResult =
        await Get.find<ContractService>().identitiesContract?.callFunction(
                  _mnemonicsStore.firstPublicKey,
                  'identityOf',
                  null,
                ) ??
            List.empty();

    if (queryResult.isNotEmpty) {
      await clear();

      for (int i = 0; i < (queryResult[0] as List<dynamic>).length; i++) {
        final int index = (queryResult[3][i] as BigInt).toInt();
        final Tuple2<String, String> keys = _mnemonicsStore.indexKeys(index);
        final DecentralizedIdentity identity = DecentralizedIdentity(
          (identity) => identity
            ..id = const Uuid().v1()
            ..profileInfo.name = queryResult[0][i] as String
            ..accountInfo.pubKey = keys.first
            ..accountInfo.priKey = keys.second
            ..dappId = queryResult[2][i] as String
            ..accountInfo.index = index
            ..extra = queryResult[4][i] as String,
        );
        await addIdentity(identity: identity);
        if (index > maxIndex) {
          maxIndex = index;
        }
      }
    }
    return maxIndex;
  }

  @action
  Future<void> clear() async {
    await _db.clearDataBase();
    healthCertLastSelectIndex = 0;
    identities.clear();
  }

  @action
  Future<DecentralizedIdentity> addIdentity({
    required DecentralizedIdentity identity,
  }) async {
    return _db
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
      (_identity) => _identity.id == identity.id,
    );

    final lastSelectedIdentity = selectedIdentity;

    if (index >= 0) {
      selectedIdentity = Optional.ofNullable(identities[index]);
      await _db.setItem(
        'lastSelectedIdentityId',
        selectedIdentity.value.toJson(),
      );
    } else {
      throw Exception('Identity selected not exist.');
    }

    if (lastSelectedIdentity != selectedIdentity) {
      selectedIdentity
          .ifPresent((identity) => _selectStreamController.add(identity));
    }
  }

  @action
  Future<void> updateIdentity(DecentralizedIdentity identity) async {
    final int index =
        identities.indexWhere((_identity) => _identity.id == identity.id);
    if (index >= 0) {
      await _db
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
  void fetchLatestPoint({required bool withLoading}) {
    selectedIdentity.ifPresent((identity) {
      TwBalance.fetchBalance(
        address: identity.address,
        withLoading: withLoading,
      ).then((res) {
        res.ifPresent((balance) {
          selectedIdentity = Optional.of(
            identity.rebuild(
              (builder) => builder.accountInfo.balance = balance.amount,
            ),
          );
          updateIdentity(selectedIdentity.value);
          _streamController.add(ObservableFuture(Future.value(balance)));
        });
      });
    });
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
    await _db.setItem(key, {key: index});
  }
}
