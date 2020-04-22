import 'package:decimal/decimal.dart';

const FIXED_DECIMAL = 2;

String parseAmount(Decimal num, {flag: true}) {
  final isNegative = num.isNegative;
  final str = num.toStringAsFixed(FIXED_DECIMAL);
  if (!flag) return str;
  return isNegative ? str : "+" + str;
}
