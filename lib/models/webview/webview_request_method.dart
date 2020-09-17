import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'webview_request_method.g.dart';

class WebviewRequestMethod extends EnumClass {
  static Serializer<WebviewRequestMethod> get serializer =>
      _$webviewRequestMethodSerializer;

  static const WebviewRequestMethod quitApp = _$quitApp;
  static const WebviewRequestMethod createAccount = _$createAccount;
  static const WebviewRequestMethod qrCode = _$qrCode;
  static const WebviewRequestMethod signTransaction = _$signTransaction;
  static const WebviewRequestMethod sendTransaction = _$sendTransaction;
  static const WebviewRequestMethod getRootKey = _$getRootKey;
  static const WebviewRequestMethod setStatusBarMode = _$setStatusBarMode;
  static const WebviewRequestMethod setStatusBarBackgroundColor =
      _$setStatusBarBackgroundColor;
  static const WebviewRequestMethod peekAccount = _$peekAccount;
  static const WebviewRequestMethod getAccounts = _$getAccounts;
  static const WebviewRequestMethod getAccountById = _$getAccountById;
  static const WebviewRequestMethod getAccountByIds = _$getAccountByIds;
  static const WebviewRequestMethod validatePin = _$validatePin;

  const WebviewRequestMethod._(String name) : super(name);

  static BuiltSet<WebviewRequestMethod> get values => _$values;
  static WebviewRequestMethod valueOf(String name) => _$valueOf(name);
}
