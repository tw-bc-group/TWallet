import 'package:flutter_test/flutter_test.dart';
import 'package:get/instance_manager.dart';
import 'package:json_store/json_store.dart';
import 'package:mobx/mobx.dart' as mobx;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:optional/optional.dart';
import 'package:tw_wallet_ui/models/identity/decentralized_identity.dart';
import 'package:tw_wallet_ui/store/identity_store.dart';

import 'identity_store_test.mocks.dart';

@GenerateMocks([JsonStore])
void main() {
  final MockJsonStore jsonStore = mockJsonStore();
  final List<DecentralizedIdentity> list = savedDecentralizedIdentites();
  final store = IdentityStore(mobx.ObservableList.of(list), 1, null, jsonStore);

  test('should select none when selectedIdentity is not given', () async {
    expect(store.selectedIdentity, const Optional.empty());
  });

  test('should select identity', () async {
    final last = list.last;

    store.selectIdentity(last);

    verify(jsonStore.setItem('lastSelectedIdentityId', last.toJson()))
        .called(1);

    expect(store.selectedIdentity!.value, last);
  });

  test('should update identity', () async {
    final originalIdentity = list.first;
    final DecentralizedIdentity tobeIdentity =
        updateIdentityByEmail(originalIdentity, 'jack1@gmail.com');

    await store.updateIdentity(tobeIdentity);

    verify(
      jsonStore.setItem(
        'name: ${originalIdentity.profileInfo.name}',
        tobeIdentity.toJson(),
      ),
    ).called(1);
    expect(store.getIdentityById(originalIdentity.id), tobeIdentity);
  });
}

DecentralizedIdentity updateIdentityByEmail(
  DecentralizedIdentity originalIdentity,
  String email,
) {
  final updateIdentity = DecentralizedIdentity(
    (identity) => identity
      ..id = originalIdentity.id
      ..profileInfo.name = originalIdentity.profileInfo.name
      ..profileInfo.email = email
      ..accountInfo.index = originalIdentity.accountInfo.index
      ..accountInfo.pubKey = originalIdentity.accountInfo.pubKey
      ..accountInfo.priKey = originalIdentity.accountInfo.priKey
      ..accountInfo.address = originalIdentity.accountInfo.address,
  );
  return updateIdentity;
}

MockJsonStore mockJsonStore() {
  final jsonStore = MockJsonStore();
  Get.put<JsonStore>(
    jsonStore,
    tag: identityStorageName,
  );
  return jsonStore;
}

List<DecentralizedIdentity> savedDecentralizedIdentites() {
  return [
    DecentralizedIdentity(
      (identity) => identity
        ..id = '1'
        ..profileInfo.name = 'Jack1'
        ..accountInfo.index = 1
        ..accountInfo.pubKey = '1'
        ..accountInfo.priKey = '1'
        ..accountInfo.address = '1',
    ),
    DecentralizedIdentity(
      (identity) => identity
        ..id = '2'
        ..profileInfo.name = 'Jack2'
        ..accountInfo.index = 2
        ..accountInfo.pubKey = '2'
        ..accountInfo.priKey = '2'
        ..accountInfo.address = '2',
    ),
  ];
}
