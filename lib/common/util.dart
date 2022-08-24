import 'package:decimal/decimal.dart';
import 'package:tw_wallet_ui/service/identity.dart';

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

  static List<Identity> assemble(List<dynamic> callResult) {
    final List<Identity> identities = [];
    for (int i = 0; i < (callResult[0] as List<dynamic>).length; i++) {
      final identity = Identity(
        name: callResult[0][i] as String,
        did: callResult[1][i] as String,
        dappId: _extract(callResult[2], i),
        index: (callResult[3][i] as BigInt).toInt(),
        extraInfo: _extract(callResult[4], i),
        publicKey: callResult[5][i] as String,
      );
      identities.add(identity);
    }

    return identities;
  }

  static String? _extract(dynamic list, int index) {
    final ls = list as List<dynamic>;
    return (index < ls.length) ? ls[index] as String? : null;
  }
}
