import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/models/serializer.dart';

part 'pincode_dialog_title.g.dart';

abstract class WebviewPincodeDialogTitle
    implements
        Built<WebviewPincodeDialogTitle, WebviewPincodeDialogTitleBuilder> {
  static Serializer<WebviewPincodeDialogTitle> get serializer =>
      _$webviewPincodeDialogTitleSerializer;

  static void _initializeBuilder(
    WebviewPincodeDialogTitleBuilder webviewPincodeDialogCloseBuilder,
  ) =>
      webviewPincodeDialogCloseBuilder
        ..text = 'PIN CODE'
        ..color = WalletColor.BLACK
        ..fontSize = 16;

  String get text;
  String get color;
  double get fontSize;

  static WebviewPincodeDialogTitle fromJson(dynamic serialized) {
    try {
      return serializers.deserialize(
        serialized,
        specifiedType: const FullType(WebviewPincodeDialogTitle),
      ) as WebviewPincodeDialogTitle;
    } catch (error) {
      throw Exception('webview sign transaction deserialize error, $error');
    }
  }

  factory WebviewPincodeDialogTitle([
    Function(WebviewPincodeDialogTitleBuilder) updates,
  ]) = _$WebviewPincodeDialogTitle;
  WebviewPincodeDialogTitle._();
}
