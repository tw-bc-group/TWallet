import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:decimal/decimal.dart';
import 'package:tw_wallet_ui/global/common/get_it.dart';
import 'package:tw_wallet_ui/global/service/api_provider.dart';
import 'package:tw_wallet_ui/models/amount.dart';
import 'package:tw_wallet_ui/models/serializer.dart';

part 'tw_balance.g.dart';

abstract class TwBalance extends Object
    implements Built<TwBalance, TwBalanceBuilder> {
  static Serializer<TwBalance> get serializer => _$twBalanceSerializer;

  @BuiltValueField(wireName: 'balance')
  Amount get amount;

  @memoized
  Decimal get original => amount.original;

  @memoized
  String get humanReadable => amount.humanReadable;

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
