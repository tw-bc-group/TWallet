import 'package:flutter_test/flutter_test.dart';
import 'package:tw_wallet_ui/common/get_it.dart';
import 'package:tw_wallet_ui/models/contract.dart';

void main() {
  getItInit(isTest: true);
  group('Contract', () {
    test('Contract deserialize should be successful', () {
      final Map<String, dynamic> _serialized = {
        'address': 'address',
        'name': 'name',
        'abi': 'abi'
      };
      expect(Contract.fromJson(_serialized), isA<Contract>());
    });
  });
}
