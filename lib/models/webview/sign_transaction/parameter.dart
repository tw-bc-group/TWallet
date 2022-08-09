import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tw_wallet_ui/models/serializer.dart';
import 'package:web3dart/web3dart.dart';

part 'parameter.g.dart';

class WebviewParameterType extends EnumClass {
  static Serializer<WebviewParameterType> get serializer =>
      _$webviewParameterTypeSerializer;

  static const WebviewParameterType string = _$string;
  static const WebviewParameterType ethAddress = _$ethAddress;
  static const WebviewParameterType bigInt = _$bigInt;

  const WebviewParameterType._(String name) : super(name);

  static BuiltSet<WebviewParameterType> get values => _$values;
  static WebviewParameterType valueOf(String name) => _$valueOf(name);
}

abstract class WebviewParameter
    implements Built<WebviewParameter, WebviewParameterBuilder> {
  static Serializer<WebviewParameter> get serializer =>
      _$webviewParameterSerializer;

  WebviewParameterType get type;
  String get value;

  static WebviewParameter fromJson(dynamic serialized) {
    try {
      return serializers.deserialize(
        serialized,
        specifiedType: const FullType(WebviewParameter),
      )! as WebviewParameter;
    } catch (error) {
      throw Exception('webview parameter deserialize error, $error');
    }
  }

  dynamic realType() {
    switch (type) {
      case WebviewParameterType.string:
        return value;
      case WebviewParameterType.ethAddress:
        return EthereumAddress.fromHex(value);
      case WebviewParameterType.bigInt:
        return BigInt.parse(value);
    }
  }

  factory WebviewParameter([Function(WebviewParameterBuilder) updates]) =
      _$WebviewParameter;
  WebviewParameter._();
}
