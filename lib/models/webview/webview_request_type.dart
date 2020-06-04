import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'webview_request_type.g.dart';

class WebviewRequestType extends EnumClass {
  static Serializer<WebviewRequestType> get serializer => _$webviewRequestTypeSerializer;

  @BuiltValueEnumConst(wireName: 'WebviewRequestType')
  static const WebviewRequestType quitApp = _$quitApp;
  static const WebviewRequestType createAccount = _$createAccount;
  static const WebviewRequestType qrCode = _$qrCode;
  static const WebviewRequestType signTransaction = _$signTransaction;

  const WebviewRequestType._(String name) : super(name);

  static BuiltSet<WebviewRequestType> get values => _$values;
  static WebviewRequestType valueOf(String name) => _$valueOf(name);
}
