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
  final List<DecentralizedIdentity> list = savedDecentralizedIdentites();

  final MockJsonStore jsonStore = mockJsonStore(list);

  final store = IdentityStore(mobx.ObservableList.of(list), 1, null, jsonStore);
  test('should select none when selectedIdentity is not given', () async {
    expect(store.selectedIdentity, Optional.ofNullable(null));
  });
  test('should select identity', () async {
    final last = list.last;

    store.selectIdentity(last);

    verify(jsonStore.setItem('lastSelectedIdentityId', last.toJson()))
        .called(1);

    expect(store.selectedIdentity!.value, last);
  });

  test('should update identity', () async {
    final DecentralizedIdentity updateIdentity = updatedIdentity();

    store.updateIdentity(updateIdentity);

    verify(jsonStore.setItem('name: 1', updateIdentity.toJson())).called(1);
  });
}

DecentralizedIdentity updatedIdentity() {
  final updateIdentity = DecentralizedIdentity(
    (identity) => identity
      ..id = '1'
      ..profileInfo.name = '1'
      ..profileInfo.email = '1@1.com'
      ..accountInfo.index = 1
      ..accountInfo.pubKey = '1'
      ..accountInfo.priKey = '1'
      ..accountInfo.address = '1',
  );
  return updateIdentity;
}

MockJsonStore mockJsonStore(List<DecentralizedIdentity> list) {
  final jsonStore = MockJsonStore();
  Get.put<JsonStore>(
    jsonStore,
    tag: identityStorageName,
  );
  // mokito
  //     .when(jsonStore.getItem('1'))
  //     .thenAnswer((_) => Future.value(list.first.toJson()));

  // mokito
  //     .when(jsonStore.getItem('2'))
  //     .thenAnswer((_) => Future.value(list.last.toJson()));
  return jsonStore;
}

List<DecentralizedIdentity> savedDecentralizedIdentites() {
  final List<DecentralizedIdentity> list = [];
  list.add(
    DecentralizedIdentity(
      (identity) => identity
        ..id = '1'
        ..profileInfo.name = '1'
        ..accountInfo.index = 1
        ..accountInfo.pubKey = '1'
        ..accountInfo.priKey = '1'
        ..accountInfo.address = '1',
    ),
  );
  list.add(
    DecentralizedIdentity(
      (identity) => identity
        ..id = '2'
        ..profileInfo.name = '2'
        ..accountInfo.index = 2
        ..accountInfo.pubKey = '2'
        ..accountInfo.priKey = '2'
        ..accountInfo.address = '2',
    ),
  );
  return list;
}
