import 'package:decimal/decimal.dart';

const FIXED_DECIMAL = 2;

String parseAmount(Decimal num) {
  final isNegative = num.isNegative;
  final str = num.toStringAsFixed(FIXED_DECIMAL);
  return isNegative ? str : "+" + str;
}
