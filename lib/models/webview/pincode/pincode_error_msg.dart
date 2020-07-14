import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tw_wallet_ui/models/serializer.dart';

part 'pincode_error_msg.g.dart';

abstract class WebviewPincodeErrorMsg
    implements Built<WebviewPincodeErrorMsg, WebviewPincodeErrorMsgBuilder> {
  static Serializer<WebviewPincodeErrorMsg> get serializer =>
      _$webviewPincodeErrorMsgSerializer;

  String get color;
  double get size;

  static WebviewPincodeErrorMsg fromJson(dynamic serialized) {
    try {
      return serializers.deserialize(serialized,
              specifiedType: const FullType(WebviewPincodeErrorMsg))
          as WebviewPincodeErrorMsg;
    } catch (error) {
      throw Exception('webview sign transaction deserialize error, $error');
    }
  }

  factory WebviewPincodeErrorMsg(
          [Function(WebviewPincodeErrorMsgBuilder) updates]) =
      _$WebviewPincodeErrorMsg;
  WebviewPincodeErrorMsg._();
}
