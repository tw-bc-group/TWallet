import 'package:decimal/decimal.dart';
import 'package:tw_wallet_ui/global/common/util.dart';

class Amount {
  static Decimal parse(String num, int precision) {
    return Decimal.parse(num) / Decimal.fromInt(10).pow(precision);
  }

  static Decimal original(Decimal num, int precision) {
    return num * Decimal.fromInt(10).pow(precision);
  }

  static String readableAmount(Decimal num) {
    return formatDecimal(num, 2);
  }
}
