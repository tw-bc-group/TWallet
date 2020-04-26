import 'package:flutter_test/flutter_test.dart';
import 'package:tw_wallet_ui/models/amount.dart';

void main() {
  group('Amount', () {
    test('Amount human readable should be 1.00', () {
      expect(Amount.parse('1000000000000000000').humanReadable, '1.00');
    });

    test('Amount human readable should be -1.00', () {
      expect(Amount.parse('-1000000000000000000').humanReadable, '-1.00');
    });

    test('Amount human readable with flag should be +1.00', () {
      expect(
          Amount.parse('1000000000000000000').humanReadableWithFlag, '+1.00');
    });

    test('Amount human readable with flag should be -1.00', () {
      expect(
          Amount.parse('-1000000000000000000').humanReadableWithFlag, '-1.00');
    });
  });
}
