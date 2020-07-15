import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tw_wallet_ui/models/serializer.dart';

part 'pincode_hint.g.dart';

abstract class WebviewPincodeHint
    implements Built<WebviewPincodeHint, WebviewPincodeHintBuilder> {
  static Serializer<WebviewPincodeHint> get serializer =>
      _$webviewPincodeHintSerializer;

  @nullable
  String get text;
  @nullable
  String get color;
  @nullable
  double get fontSize;

  static WebviewPincodeHint fromJson(dynamic serialized) {
    try {
      return serializers.deserialize(serialized,
              specifiedType: const FullType(WebviewPincodeHint))
          as WebviewPincodeHint;
    } catch (error) {
      throw Exception('webview sign transaction deserialize error, $error');
    }
  }

  factory WebviewPincodeHint([Function(WebviewPincodeHintBuilder) updates]) =
      _$WebviewPincodeHint;
  WebviewPincodeHint._();
}
