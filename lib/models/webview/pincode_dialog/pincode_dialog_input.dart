import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/models/serializer.dart';

part 'pincode_dialog_input.g.dart';

abstract class WebviewPincodeDialogInput
    implements
        Built<WebviewPincodeDialogInput, WebviewPincodeDialogInputBuilder> {
  static Serializer<WebviewPincodeDialogInput> get serializer =>
      _$webviewPincodeDialogInputSerializer;

  static void _initializeBuilder(
          WebviewPincodeDialogInputBuilder webviewPincodeDialogCloseBuilder) =>
      webviewPincodeDialogCloseBuilder
        ..borderWidth = 1
        ..borderRadius = 4
        ..size = 40
        ..textSize = 10
        ..textColor = WalletColor.BLACK
        ..borderColor = WalletColor.BLACK
        ..activeBorderColor = WalletColor.PRIMARY
        ..selectedBorderColor = WalletColor.PRIMARY
        ..filledColor = WalletColor.WHITE
        ..activeFillColor = WalletColor.WHITE
        ..selectedFillColor = WalletColor.PRIMARY;

  double get borderWidth;
  double get borderRadius;
  double get size;
  double get textSize;
  String get textColor;
  String get borderColor;
  String get activeBorderColor;
  String get selectedBorderColor;
  String get filledColor;
  String get activeFillColor;
  String get selectedFillColor;

  static WebviewPincodeDialogInput fromJson(dynamic serialized) {
    try {
      return serializers.deserialize(serialized,
              specifiedType: const FullType(WebviewPincodeDialogInput))
          as WebviewPincodeDialogInput;
    } catch (error) {
      throw Exception('webview sign transaction deserialize error, $error');
    }
  }

  factory WebviewPincodeDialogInput(
          [Function(WebviewPincodeDialogInputBuilder) updates]) =
      _$WebviewPincodeDialogInput;
  WebviewPincodeDialogInput._();
}
