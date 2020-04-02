import 'package:decimal/decimal.dart';

class TwPoint {
  int decimal;
  Decimal balance;

  TwPoint({this.decimal, this.balance});

  factory TwPoint.fromJson(Map<String, dynamic> json) {
    var result = json['result'];
    return TwPoint(
        decimal: result['twpoint']['decimal'],
        balance: Decimal.parse(result['balance']));
  }

  Decimal get value {
    return balance / Decimal.fromInt(10).pow(decimal);
  }

  String get strValue {
    return value.toStringAsFixed(2);
  }
}
