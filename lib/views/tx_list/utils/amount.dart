import 'package:decimal/decimal.dart';
import 'package:tw_wallet_ui/models/amount.dart';

String parseAmount(Decimal num, {flag: true}) {
  final isNegative = num.isNegative;
  final str = Amount.readableAmount(num);
  if (!flag) return str;
  return isNegative ? str : "+" + str;
}
