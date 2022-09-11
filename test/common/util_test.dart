import 'package:collection/collection.dart';
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

  group('List enhancements', () {
    test('should be able to zip a List<List>', () {
      final List<List> lists = [
        ['papa', 'mama'], // name
        [30, 26], // age
        ['male', 'female'],
        [
          BigInt.from(1),
          BigInt.from(2),
        ], // rank
        [null, null], // more information
      ];
      final zipped = Util.zip(lists);
      expect(
        const DeepCollectionEquality().equals(zipped, [
          [
            'papa',
            30,
            'male',
            BigInt.from(1),
            null,
          ],
          [
            'mama',
            26,
            'female',
            BigInt.from(2),
            null,
          ]
        ]),
        true,
      );
    });
    test('should be able zip over unstructured List<List>', () {
      final List<List> unequalLengthLists = [
        ['papa', 'mama'], // name
        [30, 26], // age
        [
          'male',
        ],
        [
          BigInt.from(1),
          BigInt.from(2),
        ], // rank
        [], // missing [null, null]
      ];
      final zipped = Util.zip(Util.expand(unequalLengthLists));

      expect(
        const DeepCollectionEquality().equals(zipped, [
          [
            'papa',
            30,
            'male',
            BigInt.from(1),
            null,
          ],
          [
            'mama',
            26,
            null,
            BigInt.from(2),
            null,
          ]
        ]),
        true,
      );
    });

    test('should be able to expand over empty List<List>', () {
      final expanded = Util.expand([]);
      expect(expanded, []);
    });

    test('should be able to zip over empty List<List>', () {
      final zipped = Util.zip([]);
      expect(zipped, []);
    });

    test('should be able to zip over an empty list of List<List>', () {
      final zipped = Util.zip([[]]);
      final zippedMore = Util.zip([[], []]);
      expect(zipped, []);
      expect(zippedMore, []);
    });
  });
}
