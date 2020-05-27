import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:decimal/decimal.dart';
import 'package:tw_wallet_ui/common/util.dart';
import 'package:tw_wallet_ui/store/env_store.dart';

class Amount {
  const Amount(this.value);
  final Decimal value;

  Decimal get original =>
      value * Decimal.fromInt(10).pow(globalEnv().tokenPrecision);
  String get humanReadable =>
      Util.formatDecimal(value, globalEnv().tokenHumanReadablePrecision);

  String get humanReadableWithSymbol =>
      '${globalEnv().tokenSymbol}$humanReadable';

  String get humanReadableWithSign {
    if (!value.isNegative) {
      return '+${globalEnv().tokenSymbol}$humanReadable';
    }
    return humanReadableWithSymbol;
  }

  @override
  String toString() {
    return humanReadable;
  }

  factory Amount.parse(String value) {
    return Amount(Decimal.parse(value) /
        Decimal.fromInt(10).pow(globalEnv().tokenPrecision));
  }

  static Amount zero = Amount(Decimal.zero);
}

class AmountSerializer implements PrimitiveSerializer<Amount> {
  @override
  Amount deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return Amount.parse(serialized as String);
  }

  @override
  Object serialize(Serializers serializers, Amount amount,
      {FullType specifiedType = FullType.unspecified}) {
    return amount.toString();
  }

  @override
  Iterable<Type> get types => BuiltList<Type>([Amount]);

  @override
  String get wireName => 'Amount';
}
