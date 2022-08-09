import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tw_wallet_ui/models/serializer.dart';

part 'send_transaction_response.g.dart';

abstract class SendTransactionResponse extends Object
    implements Built<SendTransactionResponse, SendTransactionResponseBuilder> {
  static Serializer<SendTransactionResponse> get serializer =>
      _$sendTransactionResponseSerializer;

  String get hash;

  Map<String, dynamic> toJson() {
    return serializers.serialize(this)! as Map<String, dynamic>;
  }

  factory SendTransactionResponse([
    void Function(SendTransactionResponseBuilder) updates,
  ]) = _$SendTransactionResponse;

  factory SendTransactionResponse.fromJson(dynamic serialized) {
    return serializers.deserialize(
      serialized,
      specifiedType: const FullType(SendTransactionResponse),
    )! as SendTransactionResponse;
  }

  SendTransactionResponse._();
}
