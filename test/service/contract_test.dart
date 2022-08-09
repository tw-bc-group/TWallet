import 'package:flutter_test/flutter_test.dart';
import 'package:tw_wallet_ui/models/contract.dart';

void main() {
  group('Contract', () {
    test('Contract deserialize should be successful', () {
      final Map<String, dynamic> serialized = {
        'address': 'address',
        'name': 'name',
        'abi': 'abi'
      };
      expect(Contract.fromJson(serialized), isA<Contract>());
    });
  });
}
