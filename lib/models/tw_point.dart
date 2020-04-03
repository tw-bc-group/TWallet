import 'package:decimal/decimal.dart';
import 'package:dio/dio.dart';
import 'package:tw_wallet_ui/service/api_provider.dart';

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

Future<TwPoint> fetchPoint({Dio dio, String address}) async {
  final response = await ApiProvider(dio: dio).fetchPointV1(address: address);

  if (response.statusCode == 200) {
    return TwPoint.fromJson(response.data);
  } else {
    throw Exception('Failed to fetch point.');
  }
}
