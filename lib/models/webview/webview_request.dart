import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tw_wallet_ui/models/serializer.dart';
import 'package:tw_wallet_ui/models/webview/webview_request_method.dart';

part 'webview_request.g.dart';

abstract class WebviewRequest
    implements Built<WebviewRequest, WebviewRequestBuilder> {
  static Serializer<WebviewRequest> get serializer =>
      _$webviewRequestSerializer;

  String get id;
  WebviewRequestMethod get method;

  static WebviewRequest fromJson(dynamic serialized) {
    try {
      return serializers.deserialize(serialized,
          specifiedType: const FullType(WebviewRequest)) as WebviewRequest;
    } catch (error) {
      throw Exception('webview request deserialize error, $error');
    }
  }

  factory WebviewRequest([Function(WebviewRequestBuilder) updates]) =
      _$WebviewRequest;
  WebviewRequest._();
}
