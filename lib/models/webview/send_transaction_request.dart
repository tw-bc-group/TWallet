import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tw_wallet_ui/models/serializer.dart';

part 'send_transaction_request.g.dart';

abstract class SendTransactionRequest
    implements Built<SendTransactionRequest, SendTransactionRequestBuilder> {
  static Serializer<SendTransactionRequest> get serializer =>
      _$sendTransactionRequestSerializer;

  String get fromAddress;
  String get fromPublicKey;
  String get signedTransactionRawData;

  static SendTransactionRequest fromJson(dynamic serialized) {
    try {
      return serializers.deserialize(
        serialized,
        specifiedType: const FullType(SendTransactionRequest),
      ) as SendTransactionRequest;
    } catch (error) {
      throw Exception('webview request deserialize error, $error');
    }
  }

  factory SendTransactionRequest([
    Function(SendTransactionRequestBuilder) updates,
  ]) = _$SendTransactionRequest;
  SendTransactionRequest._();
}
