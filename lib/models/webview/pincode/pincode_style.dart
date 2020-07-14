import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tw_wallet_ui/models/serializer.dart';
import 'package:tw_wallet_ui/models/webview/pincode/pincode_close.dart';
import 'package:tw_wallet_ui/models/webview/pincode/pincode_error_msg.dart';
import 'package:tw_wallet_ui/models/webview/pincode/pincode_hint.dart';
import 'package:tw_wallet_ui/models/webview/pincode/pincode_input.dart';
import 'package:tw_wallet_ui/models/webview/pincode/pincode_title.dart';

part 'pincode_style.g.dart';

abstract class WebviewPincodeStyle
    implements Built<WebviewPincodeStyle, WebviewPincodeStyleBuilder> {
  static Serializer<WebviewPincodeStyle> get serializer =>
      _$webviewPincodeStyleSerializer;

  WebviewPincodeClose get pincodeClose;
  WebviewPincodeErrorMsg get pincodeErrorMsg;
  WebviewPincodeHint get pincodeHint;
  WebviewPincodeInput get pincodeInput;
  WebviewPincodeTitle get pincodeTitle;

  static WebviewPincodeStyle fromJson(dynamic serialized) {
    try {
      return serializers.deserialize(serialized,
              specifiedType: const FullType(WebviewPincodeStyle))
          as WebviewPincodeStyle;
    } catch (error) {
      throw Exception('webview sign transaction deserialize error, $error');
    }
  }

  factory WebviewPincodeStyle([Function(WebviewPincodeStyleBuilder) updates]) =
      _$WebviewPincodeStyle;
  WebviewPincodeStyle._();
}
