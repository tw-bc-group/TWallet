import 'package:decimal/decimal.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tw_wallet_ui/common/util.dart';

void main() {
  group('Decimal Format', () {
    test('format string should be 0', () {
      expect(Util.formatDecimal(Decimal.fromInt(0), 0), '0');
    });

    test('format string should be 0.0', () {
      expect(Util.formatDecimal(Decimal.fromInt(0), 1), '0.0');
    });

    test('format string should be 0.00', () {
      expect(Util.formatDecimal(Decimal.fromInt(0), 2), '0.00');
    });

    test('format string should be 0.000', () {
      expect(Util.formatDecimal(Decimal.parse('0.0000'), 3), '0.000');
    });

    test('format string should be 0.90', () {
      expect(Util.formatDecimal(Decimal.parse('0.9'), 2), '0.90');
    });

    test('format string should be 0.99', () {
      expect(Util.formatDecimal(Decimal.parse('0.995'), 2), '0.99');
    });

    test('format string should be 99.99', () {
      expect(Util.formatDecimal(Decimal.parse('99.99999999'), 2), '99.99');
    });

    test('format string should be 9999.99', () {
      expect(Util.formatDecimal(Decimal.parse('9999.99999999'), 2), '9999.99');
    });

    test('format string should be 9999.00', () {
      expect(Util.formatDecimal(Decimal.parse('9999'), 2), '9999.00');
    });
  });
}
