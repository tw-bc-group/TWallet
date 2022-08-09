import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/models/serializer.dart';

part 'pincode_dialog_close.g.dart';

abstract class WebviewPincodeDialogClose
    implements
        Built<WebviewPincodeDialogClose, WebviewPincodeDialogCloseBuilder> {
  static Serializer<WebviewPincodeDialogClose> get serializer =>
      _$webviewPincodeDialogCloseSerializer;

  static void _initializeBuilder(
    WebviewPincodeDialogCloseBuilder webviewPincodeDialogCloseBuilder,
  ) =>
      webviewPincodeDialogCloseBuilder
        ..color = WalletColor.PRIMARY
        ..size = 20;

  String get color;
  double get size;

  static WebviewPincodeDialogClose fromJson(dynamic serialized) {
    try {
      return serializers.deserialize(
        serialized,
        specifiedType: const FullType(WebviewPincodeDialogClose),
      ) as WebviewPincodeDialogClose;
    } catch (error) {
      throw Exception('webview sign transaction deserialize error, $error');
    }
  }

  factory WebviewPincodeDialogClose([
    Function(WebviewPincodeDialogCloseBuilder) updates,
  ]) = _$WebviewPincodeDialogClose;
  WebviewPincodeDialogClose._();
}
