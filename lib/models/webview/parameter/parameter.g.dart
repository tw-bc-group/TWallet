// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parameter.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const WebviewParameterType _$string = const WebviewParameterType._('string');
const WebviewParameterType _$ethAddress =
    const WebviewParameterType._('ethAddress');
const WebviewParameterType _$bigInt = const WebviewParameterType._('bigInt');
const WebviewParameterType _$_amount = const WebviewParameterType._('_amount');
const WebviewParameterType _$_merchantAddress =
    const WebviewParameterType._('_merchantAddress');

WebviewParameterType _$valueOf(String name) {
  switch (name) {
    case 'string':
      return _$string;
    case 'ethAddress':
      return _$ethAddress;
    case 'bigInt':
      return _$bigInt;
    case '_amount':
      return _$_amount;
    case '_merchantAddress':
      return _$_merchantAddress;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<WebviewParameterType> _$values =
    new BuiltSet<WebviewParameterType>(const <WebviewParameterType>[
  _$string,
  _$ethAddress,
  _$bigInt,
  _$_amount,
  _$_merchantAddress,
]);

Serializer<WebviewParameterType> _$webviewParameterTypeSerializer =
    new _$WebviewParameterTypeSerializer();
Serializer<WebviewParameter> _$webviewParameterSerializer =
    new _$WebviewParameterSerializer();

class _$WebviewParameterTypeSerializer
    implements PrimitiveSerializer<WebviewParameterType> {
  @override
  final Iterable<Type> types = const <Type>[WebviewParameterType];
  @override
  final String wireName = 'WebviewParameterType';

  @override
  Object serialize(Serializers serializers, WebviewParameterType object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  WebviewParameterType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      WebviewParameterType.valueOf(serialized as String);
}

class _$WebviewParameterSerializer
    implements StructuredSerializer<WebviewParameter> {
  @override
  final Iterable<Type> types = const [WebviewParameter, _$WebviewParameter];
  @override
  final String wireName = 'WebviewParameter';

  @override
  Iterable<Object> serialize(Serializers serializers, WebviewParameter object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(WebviewParameterType)),
      'value',
      serializers.serialize(object.value,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  WebviewParameter deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WebviewParameterBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'type':
          result.type = serializers.deserialize(value,
                  specifiedType: const FullType(WebviewParameterType))
              as WebviewParameterType;
          break;
        case 'value':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$WebviewParameter extends WebviewParameter {
  @override
  final WebviewParameterType type;
  @override
  final String value;

  factory _$WebviewParameter(
          [void Function(WebviewParameterBuilder) updates]) =>
      (new WebviewParameterBuilder()..update(updates)).build();

  _$WebviewParameter._({this.type, this.value}) : super._() {
    if (type == null) {
      throw new BuiltValueNullFieldError('WebviewParameter', 'type');
    }
    if (value == null) {
      throw new BuiltValueNullFieldError('WebviewParameter', 'value');
    }
  }

  @override
  WebviewParameter rebuild(void Function(WebviewParameterBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WebviewParameterBuilder toBuilder() =>
      new WebviewParameterBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WebviewParameter &&
        type == other.type &&
        value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, type.hashCode), value.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('WebviewParameter')
          ..add('type', type)
          ..add('value', value))
        .toString();
  }
}

class WebviewParameterBuilder
    implements Builder<WebviewParameter, WebviewParameterBuilder> {
  _$WebviewParameter _$v;

  WebviewParameterType _type;
  WebviewParameterType get type => _$this._type;
  set type(WebviewParameterType type) => _$this._type = type;

  String _value;
  String get value => _$this._value;
  set value(String value) => _$this._value = value;

  WebviewParameterBuilder();

  WebviewParameterBuilder get _$this {
    if (_$v != null) {
      _type = _$v.type;
      _value = _$v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WebviewParameter other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$WebviewParameter;
  }

  @override
  void update(void Function(WebviewParameterBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$WebviewParameter build() {
    final _$result = _$v ?? new _$WebviewParameter._(type: type, value: value);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
