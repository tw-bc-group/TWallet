import 'package:decimal/decimal.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tw_wallet_ui/global/common/get_it.dart';
import 'package:tw_wallet_ui/models/amount.dart';
import 'package:tw_wallet_ui/models/tw_balance.dart';

void main() {
  getItInit(isTest: true);

  group('TW Balance', () {
    test('Value should be 10000.00', () {
      final balance = TwBalance.fromJson({
        "balance": "10000000000000000000000",
        "twpoint": {"name": "TWPointERC20Token", "symbol": "TWP", "decimal": 18}
      });

      expect(balance.amount, isA<Amount>());
      expect(balance.amount.value, Decimal.parse('10000'));
      expect(balance.humanReadable, '10000.00');
    });

    test('Value should be 10000.12', () {
      final balance = TwBalance.fromJson({
        "balance": "10000126000000000000000",
        "twpoint": {"name": "TWPointERC20Token", "symbol": "TWP", "decimal": 18}
      });

      expect(balance.amount, isA<Amount>());
      expect(balance.amount.value, Decimal.parse('10000.126'));
      expect(balance.humanReadable, '10000.12');
    });

    test('Value should be 0.00', () {
      final balance = TwBalance.fromJson({
        "balance": "0",
        "twpoint": {"name": "TWPointERC20Token", "symbol": "TWP", "decimal": 18}
      });

      expect(balance.amount, isA<Amount>());
      expect(balance.amount.value, Decimal.parse('0'));
      expect(balance.humanReadable, '0.00');
    });
  });
}
