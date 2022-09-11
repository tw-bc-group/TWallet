import 'dart:math';

import 'package:decimal/decimal.dart';

final RegExp _regexValidPhone = RegExp(
  r'^(?:\+?86)?1(?:3\d{3}|5[^4\D]\d{2}|8\d{3}|7(?:[235-8]\d{2}|4(?:0\d|1[0-2]|9\d))|9[0135-9]\d{2}|66\d{2})\d{6}$',
);

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

  /// Example:
  /// ```
  /// final lists =  [['a', 'b', 'c'], [1, 2, 3], [null, null, null]];
  /// final zipped = zip(lists);
  /// => [['a', 1, null], ['b', 2, null], ['c', 3, null]]
  static List<List> zip(List<List> ls) {
    if (ls.isEmpty) return [];
    if (ls.first.isEmpty) return [];
    return [
      ls.fold<List>([], (pre, next) => pre..add(next.first)),
      ...zip(ls.map((e) => e.skip(1).toList()).toList())
    ];
  }

  /// Example:
  /// ```
  /// final lists = [['a', 'b', 'c'], [1, 2, 3], []];
  /// final expanded = expand(lists);
  /// => [['a', 'b', 'c'], [1, 2, 3], [null, null, null]]
  static List<List> expand(List<List> list) {
    if (list.isEmpty) return [];
    final int maxLength = list.map((e) => e.length).reduce(max);
    return [
      for (final coll in list)
        if (coll.length < maxLength)
          _padding(coll, maxLength - coll.length)
        else
          coll
    ];
  }

  static List _padding(List ls, int len) {
    return [...ls, ...List.filled(len, null)];
  }
}
