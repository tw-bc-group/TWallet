import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tw_wallet_ui/models/serializer.dart';

part 'pincode_close.g.dart';

abstract class WebviewPincodeClose
    implements Built<WebviewPincodeClose, WebviewPincodeCloseBuilder> {
  static Serializer<WebviewPincodeClose> get serializer =>
      _$webviewPincodeCloseSerializer;

  String get color;
  double get size;

  static WebviewPincodeClose fromJson(dynamic serialized) {
    try {
      return serializers.deserialize(serialized,
              specifiedType: const FullType(WebviewPincodeClose))
          as WebviewPincodeClose;
    } catch (error) {
      throw Exception('webview sign transaction deserialize error, $error');
    }
  }

  factory WebviewPincodeClose([Function(WebviewPincodeCloseBuilder) updates]) =
      _$WebviewPincodeClose;
  WebviewPincodeClose._();
}
