// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pincode_hint.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WebviewPincodeHint> _$webviewPincodeHintSerializer =
    new _$WebviewPincodeHintSerializer();

class _$WebviewPincodeHintSerializer
    implements StructuredSerializer<WebviewPincodeHint> {
  @override
  final Iterable<Type> types = const [WebviewPincodeHint, _$WebviewPincodeHint];
  @override
  final String wireName = 'WebviewPincodeHint';

  @override
  Iterable<Object> serialize(Serializers serializers, WebviewPincodeHint object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.text != null) {
      result
        ..add('text')
        ..add(serializers.serialize(object.text,
            specifiedType: const FullType(String)));
    }
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
  WebviewPincodeHint deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WebviewPincodeHintBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
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

class _$WebviewPincodeHint extends WebviewPincodeHint {
  @override
  final String text;
  @override
  final String color;
  @override
  final double fontSize;

  factory _$WebviewPincodeHint(
          [void Function(WebviewPincodeHintBuilder) updates]) =>
      (new WebviewPincodeHintBuilder()..update(updates)).build();

  _$WebviewPincodeHint._({this.text, this.color, this.fontSize}) : super._();

  @override
  WebviewPincodeHint rebuild(
          void Function(WebviewPincodeHintBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WebviewPincodeHintBuilder toBuilder() =>
      new WebviewPincodeHintBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WebviewPincodeHint &&
        text == other.text &&
        color == other.color &&
        fontSize == other.fontSize;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, text.hashCode), color.hashCode), fontSize.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('WebviewPincodeHint')
          ..add('text', text)
          ..add('color', color)
          ..add('fontSize', fontSize))
        .toString();
  }
}

class WebviewPincodeHintBuilder
    implements Builder<WebviewPincodeHint, WebviewPincodeHintBuilder> {
  _$WebviewPincodeHint _$v;

  String _text;
  String get text => _$this._text;
  set text(String text) => _$this._text = text;

  String _color;
  String get color => _$this._color;
  set color(String color) => _$this._color = color;

  double _fontSize;
  double get fontSize => _$this._fontSize;
  set fontSize(double fontSize) => _$this._fontSize = fontSize;

  WebviewPincodeHintBuilder();

  WebviewPincodeHintBuilder get _$this {
    if (_$v != null) {
      _text = _$v.text;
      _color = _$v.color;
      _fontSize = _$v.fontSize;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WebviewPincodeHint other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$WebviewPincodeHint;
  }

  @override
  void update(void Function(WebviewPincodeHintBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$WebviewPincodeHint build() {
    final _$result = _$v ??
        new _$WebviewPincodeHint._(
            text: text, color: color, fontSize: fontSize);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
