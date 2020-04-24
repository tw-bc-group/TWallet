import 'package:decimal/decimal.dart';

String formatDecimal(Decimal decimal, int precision) {
  assert(precision >= 0);
  final decimalStr = decimal.toString();
  final length = decimalStr.length;
  final indexOfDot = decimalStr.indexOf('.');
  final appendLength =
      indexOfDot < 0 ? precision : precision - (length - indexOfDot - 1);

  if (appendLength >= 0) {
    return decimal.toStringAsFixed(precision);
  } else {
    return decimalStr.substring(0, length + appendLength);
  }
}
