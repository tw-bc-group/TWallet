import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:decimal/decimal.dart';
import 'package:tw_wallet_ui/common/get_it.dart';
import 'package:tw_wallet_ui/models/amount.dart';
import 'package:tw_wallet_ui/models/serializer.dart';
import 'package:tw_wallet_ui/service/api_provider.dart';

part 'tw_balance.g.dart';

abstract class TwBalance extends Object
    implements Built<TwBalance, TwBalanceBuilder> {
  static Serializer<TwBalance> get serializer => _$twBalanceSerializer;

  @BuiltValueField(wireName: 'balance')
  Amount get amount;

  @memoized
  Decimal get original => amount.original;

  factory TwBalance([void Function(TwBalanceBuilder) updates]) = _$TwBalance;
  TwBalance._();

  factory TwBalance.fromJson(dynamic serialized) {
    return serializers.deserialize(serialized,
        specifiedType: const FullType(TwBalance));
  }

  static Future<TwBalance> fetchBalance({String address}) async {
    return getIt<ApiProvider>().fetchPointV1(address: address);
  }

  static TwBalance zero = TwBalance((builder) => builder.amount = Amount.zero);
}
