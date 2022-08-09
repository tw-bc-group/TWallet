import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:decimal/decimal.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/util.dart';

class Amount {
  const Amount(this.value);
  final Decimal value;

  Decimal get original =>
      value * Decimal.fromInt(10).pow(Application.globalEnv.tokenPrecision);
  String get humanReadable => Util.formatDecimal(
        value,
        Application.globalEnv.tokenHumanReadablePrecision,
      );

  String get humanReadableWithSymbol =>
      '${Application.globalEnv.tokenSymbol}$humanReadable';

  String get humanReadableWithSign {
    if (value < Decimal.zero) {
      return '-${Application.globalEnv.tokenSymbol}${humanReadable.substring(1)}';
    }
    return '+${Application.globalEnv.tokenSymbol}$humanReadable';
  }

  @override
  String toString() {
    return humanReadable;
  }

  factory Amount.parse(dynamic value) {
    return Amount(
      (Decimal.parse(value as String) /
              Decimal.fromInt(10).pow(Application.globalEnv.tokenPrecision))
          .toDecimal(),
    );
  }

  static Amount zero = Amount(Decimal.zero);
}

class AmountSerializer implements PrimitiveSerializer<Amount> {
  @override
  Amount deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return Amount.parse(serialized);
  }

  @override
  Object serialize(
    Serializers serializers,
    Amount amount, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return amount.toString();
  }

  @override
  Iterable<Type> get types => BuiltList<Type>([Amount]);

  @override
  String get wireName => 'Amount';
}
