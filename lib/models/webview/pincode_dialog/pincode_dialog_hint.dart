import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/models/serializer.dart';

part 'pincode_dialog_hint.g.dart';

abstract class WebviewPincodeDialogHint
    implements
        Built<WebviewPincodeDialogHint, WebviewPincodeDialogHintBuilder> {
  static Serializer<WebviewPincodeDialogHint> get serializer =>
      _$webviewPincodeDialogHintSerializer;

  static void _initializeBuilder(
          WebviewPincodeDialogHintBuilder webviewPincodeDialogCloseBuilder) =>
      webviewPincodeDialogCloseBuilder
        ..text = 'Please input PIN code to confirm transaction'
        ..color = WalletColor.GREY
        ..fontSize = 12;

  String get text;
  String get color;
  double get fontSize;

  static WebviewPincodeDialogHint fromJson(dynamic serialized) {
    try {
      return serializers.deserialize(serialized,
              specifiedType: const FullType(WebviewPincodeDialogHint))
          as WebviewPincodeDialogHint;
    } catch (error) {
      throw Exception('webview sign transaction deserialize error, $error');
    }
  }

  factory WebviewPincodeDialogHint(
          [Function(WebviewPincodeDialogHintBuilder) updates]) =
      _$WebviewPincodeDialogHint;
  WebviewPincodeDialogHint._();
}
