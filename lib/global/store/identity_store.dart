import 'package:flutter/cupertino.dart';
import 'package:json_store/json_store.dart';
import 'package:mobx/mobx.dart';
import 'package:optional/optional_internal.dart';
import 'package:tw_wallet_ui/models/identity.dart';

part 'identity_store.g.dart';

const IDENTITIES_STORAGE_NAME = 'identities';
const IDENTITIES_NAME_KEY = 'name';
const SELECTED_NAME_KEY = 'selected_name';

class IdentityStore = _IdentityStore with _$IdentityStore;

String _itemKey(String name) {
  return '$IDENTITIES_NAME_KEY: $name';
}

abstract class _IdentityStore with Store {
  final _db = JsonStore(dbName: IDENTITIES_STORAGE_NAME);

  Future<void> loadFromStorage() async {
    identities = (await _db.getListLike('name: %') ?? []).map((item) {
      return Identity.fromJson(item);
    }).toList();

    await _db.getItem(SELECTED_NAME_KEY).then((item) {
      selectedName = item != null ? item[SELECTED_NAME_KEY] : null;
    });
  }

  @observable
  String selectedName;

  @observable
  List<Identity> identities;

  @computed
  Optional<Identity> get currentIdentity => Optional.ofNullable(
      identities.firstWhere((identity) => identity.name == selectedName,
          orElse: () => null));

  @action
  Future<void> clear() async {
    await _db.clearDataBase();
  }

  @action
  Future<void> selectIdentity({@required String name}) async {
    assert(identities.any((identity) => identity.name == name));
    await _db.setItem(SELECTED_NAME_KEY, {SELECTED_NAME_KEY: name});
  }

  @action
  Future<void> addIdentity({@required Identity identity}) async {
    await _db.setItem(_itemKey(identity.name), identity.toJson()).then((_) {
      identities.add(identity);
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
}
