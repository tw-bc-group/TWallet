import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tw_wallet_ui/models/serializer.dart';

part 'pincode_title.g.dart';

abstract class WebviewPincodeTitle
    implements Built<WebviewPincodeTitle, WebviewPincodeTitleBuilder> {
  static Serializer<WebviewPincodeTitle> get serializer =>
      _$webviewPincodeTitleSerializer;

  String get text;
  String get color;
  double get fontSize;

  static WebviewPincodeTitle fromJson(dynamic serialized) {
    try {
      return serializers.deserialize(serialized,
              specifiedType: const FullType(WebviewPincodeTitle))
          as WebviewPincodeTitle;
    } catch (error) {
      throw Exception('webview sign transaction deserialize error, $error');
    }
  }

  factory WebviewPincodeTitle([Function(WebviewPincodeTitleBuilder) updates]) =
      _$WebviewPincodeTitle;
  WebviewPincodeTitle._();
}
