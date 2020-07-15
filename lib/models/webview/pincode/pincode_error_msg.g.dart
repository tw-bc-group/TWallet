// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pincode_error_msg.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WebviewPincodeErrorMsg> _$webviewPincodeErrorMsgSerializer =
    new _$WebviewPincodeErrorMsgSerializer();

class _$WebviewPincodeErrorMsgSerializer
    implements StructuredSerializer<WebviewPincodeErrorMsg> {
  @override
  final Iterable<Type> types = const [
    WebviewPincodeErrorMsg,
    _$WebviewPincodeErrorMsg
  ];
  @override
  final String wireName = 'WebviewPincodeErrorMsg';

  @override
  Iterable<Object> serialize(
      Serializers serializers, WebviewPincodeErrorMsg object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.color != null) {
      result
        ..add('color')
        ..add(serializers.serialize(object.color,
            specifiedType: const FullType(String)));
    }
    if (object.fontSize != null) {
      result
        ..add('fontSize')
        ..add(serializers.serialize(object.fontSize,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  WebviewPincodeErrorMsg deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WebviewPincodeErrorMsgBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'color':
          result.color = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'fontSize':
          result.fontSize = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
      }
    }

    return result.build();
  }
}

class _$WebviewPincodeErrorMsg extends WebviewPincodeErrorMsg {
  @override
  final String color;
  @override
  final double fontSize;

  factory _$WebviewPincodeErrorMsg(
          [void Function(WebviewPincodeErrorMsgBuilder) updates]) =>
      (new WebviewPincodeErrorMsgBuilder()..update(updates)).build();

  _$WebviewPincodeErrorMsg._({this.color, this.fontSize}) : super._();

  @override
  WebviewPincodeErrorMsg rebuild(
          void Function(WebviewPincodeErrorMsgBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WebviewPincodeErrorMsgBuilder toBuilder() =>
      new WebviewPincodeErrorMsgBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WebviewPincodeErrorMsg &&
        color == other.color &&
        fontSize == other.fontSize;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, color.hashCode), fontSize.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('WebviewPincodeErrorMsg')
          ..add('color', color)
          ..add('fontSize', fontSize))
        .toString();
  }
}

class WebviewPincodeErrorMsgBuilder
    implements Builder<WebviewPincodeErrorMsg, WebviewPincodeErrorMsgBuilder> {
  _$WebviewPincodeErrorMsg _$v;

  String _color;
  String get color => _$this._color;
  set color(String color) => _$this._color = color;

  double _fontSize;
  double get fontSize => _$this._fontSize;
  set fontSize(double fontSize) => _$this._fontSize = fontSize;

  WebviewPincodeErrorMsgBuilder();

  WebviewPincodeErrorMsgBuilder get _$this {
    if (_$v != null) {
      _color = _$v.color;
      _fontSize = _$v.fontSize;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WebviewPincodeErrorMsg other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$WebviewPincodeErrorMsg;
  }

  @override
  void update(void Function(WebviewPincodeErrorMsgBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$WebviewPincodeErrorMsg build() {
    final _$result =
        _$v ?? new _$WebviewPincodeErrorMsg._(color: color, fontSize: fontSize);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
