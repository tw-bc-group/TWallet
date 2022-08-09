import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/models/serializer.dart';

part 'pincode_dialog_error_msg.g.dart';

abstract class WebviewPincodeDialogErrorMsg
    implements
        Built<WebviewPincodeDialogErrorMsg,
            WebviewPincodeDialogErrorMsgBuilder> {
  static Serializer<WebviewPincodeDialogErrorMsg> get serializer =>
      _$webviewPincodeDialogErrorMsgSerializer;

  static void _initializeBuilder(
    WebviewPincodeDialogErrorMsgBuilder webviewPincodeDialogCloseBuilder,
  ) =>
      webviewPincodeDialogCloseBuilder
        ..text = 'PIN码错误，请重新输入'
        ..color = WalletColor.ACCENT
        ..fontSize = 12;

  String get text;
  String get color;
  double get fontSize;

  static WebviewPincodeDialogErrorMsg fromJson(dynamic serialized) {
    try {
      return serializers.deserialize(
        serialized,
        specifiedType: const FullType(WebviewPincodeDialogErrorMsg),
      )! as WebviewPincodeDialogErrorMsg;
    } catch (error) {
      throw Exception('webview sign transaction deserialize error, $error');
    }
  }

  factory WebviewPincodeDialogErrorMsg([
    Function(WebviewPincodeDialogErrorMsgBuilder) updates,
  ]) = _$WebviewPincodeDialogErrorMsg;
  WebviewPincodeDialogErrorMsg._();
}
