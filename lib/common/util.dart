import 'package:decimal/decimal.dart';

final RegExp _regexValidPhone = RegExp(
    r'^(?:\+?86)?1(?:3\d{3}|5[^4\D]\d{2}|8\d{3}|7(?:[235-8]\d{2}|4(?:0\d|1[0-2]|9\d))|9[0135-9]\d{2}|66\d{2})\d{6}$');

class Util {
  static String formatDecimal(Decimal decimal, int precision) {
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

  static bool isValidPhone(String phone) {
    return _regexValidPhone.hasMatch(phone);
  }
}
