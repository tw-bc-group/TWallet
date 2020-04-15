import 'package:decimal/decimal.dart';
import 'package:optional/optional_internal.dart';
import 'package:tw_wallet_ui/global/common/get_it.dart';
import 'package:tw_wallet_ui/global/service/api_provider.dart';

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

  static Future<Optional<TwPoint>> fetchPoint({String address}) async {
    ApiProvider apiProvider = getIt<ApiProvider>();
    return await apiProvider.fetchPointV1(address: address).then((response) =>
        Optional.ofNullable(response.statusCode == 200
            ? TwPoint.fromJson(response.data)
            : null));
  }
}
