import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:decimal/decimal.dart';
import 'package:tw_wallet_ui/global/common/get_it.dart';
import 'package:tw_wallet_ui/global/service/api_provider.dart';
import 'package:tw_wallet_ui/models/amount.dart';
import 'package:tw_wallet_ui/models/serializer.dart';

part 'tw_balance.g.dart';

abstract class TwPoint extends Object
    implements Built<TwPoint, TwPointBuilder> {
  static Serializer<TwPoint> get serializer => _$twPointSerializer;

  int get decimal;
  String get name;

  factory TwPoint([void Function(TwPointBuilder) updates]) = _$TwPoint;
  TwPoint._();
}

abstract class TwBalance extends Object
    implements Built<TwBalance, TwBalanceBuilder> {
  static Serializer<TwBalance> get serializer => _$twBalanceSerializer;

  String get balance;
  @BuiltValueField(wireName: 'twpoint')
  TwPoint get twPoint;

  @memoized
  Decimal get realBalance => Amount.parse(balance, twPoint.decimal);

  @memoized
  String get humanBalance => Amount.readableAmount(realBalance);

  factory TwBalance([void Function(TwBalanceBuilder) updates]) = _$TwBalance;
  TwBalance._();

  static Future<TwBalance> fetchBalance({String address}) async {
    ApiProvider apiProvider = getIt<ApiProvider>();
    print('fetchPoint, address: $address');
    return apiProvider.fetchPointV1(address: address);
  }

  factory TwBalance.fromJson(dynamic serialized) {
    return serializers.deserialize(serialized,
        specifiedType: const FullType(TwBalance));
  }
}
