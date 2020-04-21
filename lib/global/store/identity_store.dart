import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:json_store/json_store.dart';
import 'package:mobx/mobx.dart';
import 'package:optional/optional_internal.dart';
import 'package:tw_wallet_ui/models/identity.dart';
import 'package:tw_wallet_ui/models/tw_point.dart';

part 'identity_store.g.dart';

const IDENTITIES_STORAGE_NAME = 'identities';
const IDENTITIES_NAME_KEY = 'name';
const SELECTED_NAME_KEY = 'selected_name';

enum AssetsType { point, token }

class IdentityStore = IdentityStoreBase with _$IdentityStore;

String _itemKey(String name) {
  return '$IDENTITIES_NAME_KEY: $name';
}

abstract class IdentityStoreBase with Store {
  static final _db = JsonStore(dbName: IDENTITIES_STORAGE_NAME);

  IdentityStoreBase(String selectedName, List<Identity> identities) {
    searchName = '';
    _streamController = StreamController();
    futureStream = ObservableStream(_streamController.stream);
    this.identities = identities;
    _identitiesSort();
    selectIdentity(name: selectedName);
  }

  static Future<IdentityStore> fromJsonStore() async {
    String selectedName = await _db.getItem(SELECTED_NAME_KEY).then((item) {
      return item != null ? item[SELECTED_NAME_KEY] : '';
    });

    List<Identity> identities =
        (await _db.getListLike('$IDENTITIES_NAME_KEY: %') ?? []).map((item) {
      return Identity.fromJson(item);
    }).toList();

    return IdentityStore(selectedName, identities);
  }

  @observable
  String selectedName;

  @observable
  List<Identity> identities;

  @observable
  String searchName;

  StreamController<ObservableFuture<Optional<TwPoint>>> _streamController;

  ObservableStream<ObservableFuture<Optional<TwPoint>>> futureStream;

  @computed
  Optional<Identity> get selectedIdentity => Optional.ofNullable(
      identities.firstWhere((identity) => identity.name == selectedName,
          orElse: () => null));

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
  }

  @action
  Future<void> selectIdentity({@required String name}) async {
    if (identities.any((identity) => identity.name == name)) {
      await _db.setItem(SELECTED_NAME_KEY, {SELECTED_NAME_KEY: name}).then((_) {
        selectedName = name;
        return fetchLatestPoint();
      });
    }
  }

  @action
  Future<void> addIdentity({@required Identity identity}) async {
    _db.setItem(_itemKey(identity.name), identity.toJson()).then((_) {
      identities.add(identity);
      _identitiesSort();
      if (identities.length == 1) {
        selectIdentity(name: identity.name);
      }
    });
  }

  @action
  Future<void> deleteIdentity({@required String name}) async {
    if (name != selectedName) {
      int index = identities.indexWhere((identity) => identity.name == name);
      if (index != -1) {
        await _db.deleteItem(_itemKey(name));
      }
    }
  }

  @action
  void fetchLatestPoint() {
    _streamController.add(ObservableFuture(
        Future.value(selectedIdentity).then((selectedIdentity) async {
      if (selectedIdentity.isPresent) {
        Optional<TwPoint> fetchRes =
            await TwPoint.fetchPoint(address: selectedIdentity.value.address);
        selectedIdentity.ifPresent((identity) =>
            fetchRes.ifPresent((twPoint) => identity.twPoint = twPoint.value));
        return fetchRes;
      }
      return Optional.empty();
    })));
  }
}
