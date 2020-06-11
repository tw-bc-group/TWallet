import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tw_wallet_ui/models/serializer.dart';
import 'package:tw_wallet_ui/models/webview/parameter/parameter.dart';

part 'sign_transaction.g.dart';

abstract class WebviewSignTransaction
    implements Built<WebviewSignTransaction, WebviewSignTransactionBuilder> {
  static Serializer<WebviewSignTransaction> get serializer =>
      _$webviewSignTransactionSerializer;

  String get accountId;
  String get rpcUrl;
  String get contractName;
  String get contractAddress;
  String get contractAbi;
  String get functionName;
  BigInt get gasPrice;
  int get maxGas;
  BuiltList<WebviewParameter> get parameters;

  static WebviewSignTransaction fromJson(dynamic serialized) {
    try {
      return serializers.deserialize(serialized,
              specifiedType: const FullType(WebviewSignTransaction))
          as WebviewSignTransaction;
    } catch (error) {
      throw Exception('webview sign transaction deserialize error, $error');
    }
  }

  factory WebviewSignTransaction(
          [Function(WebviewSignTransactionBuilder) updates]) =
      _$WebviewSignTransaction;
  WebviewSignTransaction._();
}
