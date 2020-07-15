import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tw_wallet_ui/models/serializer.dart';
import 'package:tw_wallet_ui/models/webview/pincode_dialog/pincode_dialog_close.dart';
import 'package:tw_wallet_ui/models/webview/pincode_dialog/pincode_dialog_error_msg.dart';
import 'package:tw_wallet_ui/models/webview/pincode_dialog/pincode_dialog_hint.dart';
import 'package:tw_wallet_ui/models/webview/pincode_dialog/pincode_dialog_input.dart';
import 'package:tw_wallet_ui/models/webview/pincode_dialog/pincode_dialog_title.dart';

part 'pincode_dialog_style.g.dart';

abstract class WebviewPincodeDialogStyle
    implements
        Built<WebviewPincodeDialogStyle, WebviewPincodeDialogStyleBuilder> {
  static Serializer<WebviewPincodeDialogStyle> get serializer =>
      _$webviewPincodeDialogStyleSerializer;

  WebviewPincodeDialogClose get closeIcon;
  WebviewPincodeDialogErrorMsg get errorMsg;
  WebviewPincodeDialogHint get hintMsg;
  WebviewPincodeDialogInput get inputFields;
  WebviewPincodeDialogTitle get title;

  static WebviewPincodeDialogStyle fromJson(dynamic serialized) {
    try {
      return serializers.deserialize(serialized,
              specifiedType: const FullType(WebviewPincodeDialogStyle))
          as WebviewPincodeDialogStyle;
    } catch (error) {
      throw Exception('webview sign transaction deserialize error, $error');
    }
  }

  factory WebviewPincodeDialogStyle(
          [Function(WebviewPincodeDialogStyleBuilder) updates]) =
      _$WebviewPincodeDialogStyle;
  WebviewPincodeDialogStyle._();
}
