import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tw_wallet_ui/models/serializer.dart';

part 'pincode_input.g.dart';

abstract class WebviewPincodeInput
    implements Built<WebviewPincodeInput, WebviewPincodeInputBuilder> {
  static Serializer<WebviewPincodeInput> get serializer =>
      _$webviewPincodeInputSerializer;

  double get borderWidth;
  double get borderRadius;
  double get size;
  String get textColor;
  String get borderColor;
  String get activeBorderColor;
  String get selectedBorderColor;
  String get filledColor;
  String get activeFillColor;
  String get selectedFillColor;

  static WebviewPincodeInput fromJson(dynamic serialized) {
    try {
      return serializers.deserialize(serialized,
              specifiedType: const FullType(WebviewPincodeInput))
          as WebviewPincodeInput;
    } catch (error) {
      throw Exception('webview sign transaction deserialize error, $error');
    }
  }

  factory WebviewPincodeInput([Function(WebviewPincodeInputBuilder) updates]) =
      _$WebviewPincodeInput;
  WebviewPincodeInput._();
}
