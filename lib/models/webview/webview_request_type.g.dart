// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'webview_request_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const WebviewRequestType _$quitApp = const WebviewRequestType._('quitApp');
const WebviewRequestType _$createAccount =
    const WebviewRequestType._('createAccount');
const WebviewRequestType _$qrCode = const WebviewRequestType._('qrCode');
const WebviewRequestType _$signTransaction =
    const WebviewRequestType._('signTransaction');

WebviewRequestType _$valueOf(String name) {
  switch (name) {
    case 'quitApp':
      return _$quitApp;
    case 'createAccount':
      return _$createAccount;
    case 'qrCode':
      return _$qrCode;
    case 'signTransaction':
      return _$signTransaction;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<WebviewRequestType> _$values =
    new BuiltSet<WebviewRequestType>(const <WebviewRequestType>[
  _$quitApp,
  _$createAccount,
  _$qrCode,
  _$signTransaction,
]);

Serializer<WebviewRequestType> _$webviewRequestTypeSerializer =
    new _$WebviewRequestTypeSerializer();

class _$WebviewRequestTypeSerializer
    implements PrimitiveSerializer<WebviewRequestType> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'quitApp': 'WebviewRequestType',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'WebviewRequestType': 'quitApp',
  };

  @override
  final Iterable<Type> types = const <Type>[WebviewRequestType];
  @override
  final String wireName = 'WebviewRequestType';

  @override
  Object serialize(Serializers serializers, WebviewRequestType object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  WebviewRequestType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      WebviewRequestType.valueOf(_fromWire[serialized] ?? serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
