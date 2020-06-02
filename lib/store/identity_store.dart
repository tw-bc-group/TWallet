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

  IdentityStoreBase(this.identities, this.healthCertLastSelectIndex) {
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
                  return Identity.fromJson(item);
                }).toList())
            .orElse([]);

    return IdentityStore(ObservableList.of(identities), didHealthSelectIndex);
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
    return Optional.ofNullable(
        identities.firstWhere((e) => e.isSelected == true, orElse: () => null));
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
    return _streamController.close();
  }

  @action
  Future<void> clear() async {
    await _db.clearDataBase();
    healthCertLastSelectIndex = 0;
    identities.clear();
  }

  @action
  Future<void> updateIdentityIsSelected(int selectedIndex) async {
    Identity selectedIdentity;
    Identity lastSelectedIdentity;

    final List<Identity> newIdentities = identities
        .asMap()
        .map((index, identity) {
          if (selectedIndex == index) {
            selectedIdentity = identity.setSelected();
            return MapEntry(index, selectedIdentity);
          } else {
            if (identity.isSelected) {
              lastSelectedIdentity = identity.setUnSelected();
            }
            return MapEntry(index, identity.setUnSelected());
          }
        })
        .values
        .toList();

    if (null != lastSelectedIdentity) {
      await _db.setItem(
          _itemKey(lastSelectedIdentity.name), lastSelectedIdentity.toJson());
    }

    if (null != selectedIdentity) {
      await _db
          .setItem(_itemKey(selectedIdentity.name), selectedIdentity.toJson())
          .then((_) => identities = ObservableList.of(newIdentities));
    }
  }

  @action
  Future<void> addIdentity({@required Identity identity}) async {
    final Identity newIdentity =
        identities.isEmpty ? identity.setSelected() : identity.setUnSelected();

    return _db
        .setItem(_itemKey(newIdentity.name), newIdentity.toJson())
        .then((_) {
      identities.add(newIdentity);
      _identitiesSort();
    });
  }

  @action
  void updateSelectedIdentity(Identity identity) {
    final int index = identities.indexWhere((identity) => identity.isSelected);
    if (index >= 0) {
      identities[index] = identity;
    } else {
      throw Exception('Identity updated not exist.');
    }
  }

  @action
  void selectIdentity(String name) {
    final int index = identities.indexWhere(
      (identity) => identity.name == name,
    );

    if (index >= 0) {
      updateIdentityIsSelected(index);
    } else {
      throw Exception('Identity selected not exist.');
    }
  }

  @action
  Future<void> updateIdentity(Identity identity) async {
    final int index =
        identities.indexWhere((other) => other.name == identity.name);
    if (index >= 0) {
      await _db
          .setItem(_itemKey(identities[index].name), identity.toJson())
          .then((_) => identities[index] = identity);
    } else {
      throw Exception('Identity updated not exist.');
    }
  }

  @action
  void fetchLatestPoint() {
    selectedIdentity.ifPresent((identity) {
      TwBalance.fetchBalance(address: selectedIdentity.value.address)
          .then((res) {
        res.ifPresent((balance) {
          updateSelectedIdentity(selectedIdentity.value
              .rebuild((identity) => identity..balance = balance.amount));
          _streamController.add(ObservableFuture(Future.value(balance)));
        });
      });
    });
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
