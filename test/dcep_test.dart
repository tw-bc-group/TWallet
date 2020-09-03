import 'package:flutter_test/flutter_test.dart';
import 'package:tw_wallet_ui/models/dcep/dcep.dart';

void main() {
  test('when given a serialized dcep data, should return correct dcep model',
      () {
    final serialized = {
      'serial_number': 'CB_100_00_1001680270800496497664',
      'owner': '0xEba985C90b31892b4b5Bc9AfC68A945EF8903507',
      'signature':
          '01d584f6f47615af9156d79db02995e0949059cc21e3c54ef4cd2db4ebcfca103f390aad702019cbdcf8924e9111a8f738122d2700807dfbbdf5ef6d71deb142b3',
      'money_type': '100_00',
      'create_time': '2020-09-03 07:27:50'
    };

    expect(Dcep.fromJson(serialized), isA<Dcep>());
  });
}
