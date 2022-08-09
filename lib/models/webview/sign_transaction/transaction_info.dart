import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tw_wallet_ui/models/serializer.dart';
import 'package:tw_wallet_ui/models/webview/sign_transaction/parameter.dart';

part 'transaction_info.g.dart';

abstract class WebviewTransactionInfo
    implements Built<WebviewTransactionInfo, WebviewTransactionInfoBuilder> {
  static Serializer<WebviewTransactionInfo> get serializer =>
      _$webviewTransactionInfoSerializer;

  String get accountId;
  String get rpcUrl;
  String get contractName;
  String get contractAddress;
  String get contractAbi;
  String get functionName;
  BigInt get gasPrice;
  int get maxGas;
  BuiltList<WebviewParameter> get parameters;

  static WebviewTransactionInfo fromJson(dynamic serialized) {
    try {
      return serializers.deserialize(
        serialized,
        specifiedType: const FullType(WebviewTransactionInfo),
      ) as WebviewTransactionInfo;
    } catch (error) {
      throw Exception('webview sign transaction deserialize error, $error');
    }
  }

  factory WebviewTransactionInfo([
    Function(WebviewTransactionInfoBuilder) updates,
  ]) = _$WebviewTransactionInfo;
  WebviewTransactionInfo._();
}
