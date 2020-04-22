import 'package:flutter_test/flutter_test.dart';
import 'package:tw_wallet_ui/models/Address.dart';

void main() {
  group('Address Test', () {
    test('should not pass when length is less than 42', () {
      var address = '0x11111111';
      expect(Address.validateFormat(address), false);
    });

    test('should not pass when not started with 0x', () {
      var address = '111111111111111111111111111111111111111122';
      expect(Address.validateFormat(address), false);
    });

    test('should not pass when length is more then 42', () {
      var address = '1111111111111111111111111111111111111111220000';
      expect(Address.validateFormat(address), false);
    });

    test('should pass when length is 42 and started with 0x', () {
      var address = '0x1111111111111111111111111111111111111111';
      expect(Address.validateFormat(address), true);
    });
  });
}