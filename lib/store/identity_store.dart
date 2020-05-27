import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:json_store/json_store.dart';
import 'package:mobx/mobx.dart';
import 'package:optional/optional_internal.dart';
import 'package:tw_wallet_ui/models/amount.dart';
import 'package:tw_wallet_ui/models/identity.dart';
import 'package:tw_wallet_ui/models/tw_balance.dart';

part 'identity_store.g.dart';

const IDENTITIES_STORAGE_NAME = 'identities';
const IDENTITIES_NAME_KEY = 'name';
const SELECTED_INDEX_KEY = 'selected_index';
const DID_HEALTH_CERT_SELECT_INDEX_KEY = 'did_health_cert_select_index';

enum AssetsType { point, token }

class IdentityStore = IdentityStoreBase with _$IdentityStore;

String _itemKey(String name) {
  return '$IDENTITIES_NAME_KEY: $name';
}

abstract class IdentityStoreBase with Store {
  static final _db = JsonStore(dbName: IDENTITIES_STORAGE_NAME);

  IdentityStoreBase(
      this.identities, int _selectedIndex, int didHealthSelectIndex) {
    searchName = '';
    _streamController = StreamController();
    fetchBalanceFutureStream = ObservableStream(_streamController.stream,
        initialValue: ObservableFuture(Future.value(null)));
    _identitiesSort();
    selectIdentity(index: _selectedIndex);
    healthCertLastSelectIndex = didHealthSelectIndex;
  }

  static Future<IdentityStore> fromJsonStore() async {
    int selectedIndex = await _db.getItem(SELECTED_INDEX_KEY).then((savedItem) {
      return savedItem != null ? savedItem[SELECTED_INDEX_KEY] : 0;
    });

    int didHealthSelectIndex =
        await _db.getItem(DID_HEALTH_CERT_SELECT_INDEX_KEY).then((savedItem) {
      return savedItem != null
          ? savedItem[DID_HEALTH_CERT_SELECT_INDEX_KEY]
          : 0;
    });

    List<Identity> identities =
        Optional.ofNullable(await _db.getListLike('$IDENTITIES_NAME_KEY: %'))
            .map((listItems) => listItems.map((item) {
                  var identity = Identity.fromJson(item);
                  return identity.setSelected(false);
                }).toList())
            .orElse([]);

    return IdentityStore(
        ObservableList.of(identities), selectedIndex, didHealthSelectIndex);
  }

  Identity getIdentityById(String id) {
    return identities.firstWhere((e) => e.id == id);
  }

  @observable
  int selectedIndex;

  @observable
  int healthCertLastSelectIndex;

  @observable
  ObservableList<Identity> identities = ObservableList<Identity>();

  @observable
  String searchName;

  StreamController<ObservableFuture<TwBalance>> _streamController;

  ObservableStream<ObservableFuture<TwBalance>> fetchBalanceFutureStream;

  @computed
  Optional<Identity> get selectedIdentity => Optional.of(identities.toList())
      .flatMap((identities) => identities.isEmpty
          ? Optional.empty()
          : Optional.of(identities[selectedIndex ?? 0]));

  @computed
  String get myName =>
      selectedIdentity.map((identity) => identity.name).orElse('');

  @computed
  String get myAddress =>
      selectedIdentity.map((identity) => identity.address).orElse('');

  @computed
  Amount get myBalance =>
      selectedIdentity.map((identity) => identity.balance).orElse(Amount.zero);

  @computed
  List<Identity> get selectedFirstIdentities {
    var ids = identities.toList();
    Identity selectedIdentity = ids.removeAt(selectedIndex ?? 0);
    return [selectedIdentity] + ids;
  }

  void _identitiesSort() {
    identities.sort(
        (identity1, identity2) => identity1.name.compareTo(identity2.name));
  }

  void dispose() async {
    await _streamController.close();
  }

  @action
  void updateSearchName(String name) {
    searchName = name;
  }

  @action
  Future<void> clear() async {
    await _db.clearDataBase();
    selectedIndex = 0;
    healthCertLastSelectIndex = 0;
    identities.clear();
  }

  @action
  Future<void> selectIdentity({@required int index}) async {
    if (index >= 0 && index < identities.length) {
      await _db
          .setItem(SELECTED_INDEX_KEY, {SELECTED_INDEX_KEY: index}).then((_) {
        updateIdentityIsSelected(index);
        return fetchLatestPoint();
      });
    }
  }

  @action
  void setIdentityIsSelected(int index, bool value) {
    identities[index] =
        identities[index].rebuild((id) => id..isSelected = value);
  }

  @action
  void updateIdentityIsSelected(int nexIndex) {
    var _lastSelectedIndex = selectedIndex ?? nexIndex;
    setIdentityIsSelected(_lastSelectedIndex, false);
    setIdentityIsSelected(nexIndex, true);
    selectedIndex = nexIndex;
  }

  @action
  Future<void> addIdentity({@required Identity identity}) async {
    _db.setItem(_itemKey(identity.name), identity.toJson()).then((_) {
      identities.add(identity.setSelected(false));
      _identitiesSort();
      if (identities.length == 1) {
        selectIdentity(index: 0);
      }
    });
  }

  @action
  void updateSelectedIdentity(Identity identity) {
    int index = identities.indexWhere((other) => other.name == identity.name);
    if (index >= 0) {
      identities[index] = identity;
      updateIdentityIsSelected(index);
    } else {
      throw Exception('Identity updated not exist.');
    }
  }

  @action
  Future<void> updateIdentity(Identity identity) async {
    int index = identities.indexWhere((other) => other.name == identity.name);
    if (index >= 0) {
      identities[index] = identity;
      await _db.setItem(_itemKey(identities[index].name), identity.toJson());
    } else {
      throw Exception('Identity updated not exist.');
    }
  }

  @action
  Future<void> deleteIdentity({@required int index}) async {
    if (index != selectedIndex) {
      assert(index >= 0 && index < identities.length);
      await _db.deleteItem(_itemKey(identities[index].name));
    }
  }

  @action
  void fetchLatestPoint() {
    _streamController.add(ObservableFuture(
        Future.value(selectedIdentity).then((selectedIdentity) async {
      if (selectedIdentity.isPresent) {
        return await TwBalance.fetchBalance(
                address: selectedIdentity.value.address)
            .then((twBalance) {
          updateSelectedIdentity(selectedIdentity.value
              .rebuild((identity) => identity..balance = twBalance.amount));
          return twBalance;
        });
      }
      return null;
    })));
  }

  @action
  Future updateHealthCertLastSelected(Identity identity) async {
    int index = identities.indexWhere((e) => e.id == identity.id);
    if (index >= 0) {
      healthCertLastSelectIndex = index;
    } else {
      throw Exception('Identity updateHealthCertSelectedIdentity not exist.');
    }

    final key = DID_HEALTH_CERT_SELECT_INDEX_KEY;
    await _db.setItem(key, {key: index});
  }
}
