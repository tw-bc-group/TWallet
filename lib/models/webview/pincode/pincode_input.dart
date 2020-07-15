import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tw_wallet_ui/models/serializer.dart';

part 'pincode_input.g.dart';

abstract class WebviewPincodeInput
    implements Built<WebviewPincodeInput, WebviewPincodeInputBuilder> {
  static Serializer<WebviewPincodeInput> get serializer =>
      _$webviewPincodeInputSerializer;

  @nullable
  double get borderWidth;
  @nullable
  double get borderRadius;
  @nullable
  double get size;
  @nullable
  String get textColor;
  @nullable
  String get borderColor;
  @nullable
  String get activeBorderColor;
  @nullable
  String get selectedBorderColor;
  @nullable
  String get filledColor;
  @nullable
  String get activeFillColor;
  @nullable
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
