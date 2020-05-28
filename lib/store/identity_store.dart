import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:json_store/json_store.dart';
import 'package:mobx/mobx.dart';
import 'package:optional/optional_internal.dart';
import 'package:tw_wallet_ui/models/amount.dart';
import 'package:tw_wallet_ui/models/identity.dart';
import 'package:tw_wallet_ui/models/tw_balance.dart';

part 'identity_store.g.dart';

const identityStorageName = 'identities';
const identityNameKey = 'name';
const selectedIndexKey = 'selected_index';
const didHealthCertSelectIndexKey = 'did_health_cert_select_index';

enum AssetsType { point, token }

class IdentityStore = IdentityStoreBase with _$IdentityStore;

String _itemKey(String name) {
  return '$identityNameKey: $name';
}

abstract class IdentityStoreBase with Store {
  static final _db = JsonStore(dbName: identityStorageName);

  IdentityStoreBase(
      this.identities, this.healthCertLastSelectIndex) {
    _streamController = StreamController();
    fetchBalanceFutureStream = ObservableStream(_streamController.stream,
        initialValue: ObservableFuture(Future.value(null)));
    _identitiesSort();
  }

  static Future<IdentityStore> fromJsonStore() async {
    final int didHealthSelectIndex =
        await _db.getItem(didHealthCertSelectIndexKey).then((savedItem) {
      return savedItem != null
          ? savedItem[didHealthCertSelectIndexKey] as int
          : 0;
    });

    final List<Identity> identities =
        Optional.ofNullable(await _db.getListLike('$identityNameKey: %'))
            .map((listItems) => listItems.map((item) {
                  final Identity identity = Identity.fromJson(item);
                  return identity.setUnSelected();
                }).toList())
            .orElse([]);

    return IdentityStore(
        ObservableList.of(identities), didHealthSelectIndex);
  }

  Identity getIdentityById(String id) {
    return identities.firstWhere((e) => e.id == id);
  }

  @observable
  int healthCertLastSelectIndex;

  @observable
  ObservableList<Identity> identities = ObservableList<Identity>();

  @observable
  String searchName = '';

  StreamController<ObservableFuture<TwBalance>> _streamController;

  ObservableStream<ObservableFuture<TwBalance>> fetchBalanceFutureStream;

  @computed
  Optional<Identity> get selectedIdentity {
    try {
      return Optional.of(identities.firstWhere((e) => e.isSelected == true));
    } catch (StateError) {
      return const Optional.empty();
    }
  }

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
    final List<Identity> ids = identities.toList();
    if (selectedIdentity.isPresent) {
      ids.removeWhere((ele) => ele.id == selectedIdentity.first.id);
      return [selectedIdentity.first] + ids;
    }
    return ids;
  }

  @computed
  List<Identity> get selectedFirstIdentitiesInHealthDApp {
    final List<Identity> ids = identities.toList();
    final Identity selectedIdentity =
        ids.removeAt(healthCertLastSelectIndex ?? 0);
    return [selectedIdentity] + ids;
  }

  void _identitiesSort() {
    identities.sort(
        (identity1, identity2) => identity1.name.compareTo(identity2.name));
  }

  Future<void> dispose() async {
    _streamController.close();
  }

  @action
  Future<void> clear() async {
    await _db.clearDataBase();
    healthCertLastSelectIndex = 0;
    identities.clear();
  }

  @action
  Future<void> selectIdentity({@required int index}) async {
    if (index >= 0 && index < identities.length) {
      await _db.setItem(selectedIndexKey, {selectedIndexKey: index}).then((_) {
        updateIdentityIsSelected(index);
        fetchLatestPoint();
      });
    }
  }

  @action
  void setIdentityIsSelected(int index, {bool isSelected}) {
    identities[index] =
        identities[index].rebuild((id) => id..isSelected = isSelected);
  }

  @action
  void updateIdentityIsSelected(int nexIndex) {
    identities = ObservableList.of(
        identities.map((element) => element.setSelected()).toList());
    setIdentityIsSelected(nexIndex);
  }

  @action
  Future<void> addIdentity({@required Identity identity}) async {
    _db.setItem(_itemKey(identity.name), identity.toJson()).then((_) {
      identities.add(identity.setUnSelected());
      _identitiesSort();
      if (identities.length == 1) {
        selectIdentity(index: 0);
      }
    });
  }

  @action
  void updateSelectedIdentity(Identity identity) {
    final int index =
        identities.indexWhere((other) => other.name == identity.name);
    if (index >= 0) {
      identities[index] = identity;
      updateIdentityIsSelected(index);
    } else {
      throw Exception('Identity updated not exist.');
    }
  }

  @action
  Future<void> updateIdentity(Identity identity) async {
    final int index =
        identities.indexWhere((other) => other.name == identity.name);
    if (index >= 0) {
      identities[index] = identity;
      await _db.setItem(_itemKey(identities[index].name), identity.toJson());
    } else {
      throw Exception('Identity updated not exist.');
    }
  }

  @action
  void fetchLatestPoint() {
    _streamController.add(ObservableFuture(
        Future.value(selectedIdentity).then((selectedIdentity) async {
      if (selectedIdentity.isPresent) {
        return TwBalance.fetchBalance(address: selectedIdentity.value.address)
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
