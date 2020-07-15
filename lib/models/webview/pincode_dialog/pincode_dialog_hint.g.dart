// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pincode_dialog_hint.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WebviewPincodeDialogHint> _$webviewPincodeDialogHintSerializer =
    new _$WebviewPincodeDialogHintSerializer();

class _$WebviewPincodeDialogHintSerializer
    implements StructuredSerializer<WebviewPincodeDialogHint> {
  @override
  final Iterable<Type> types = const [
    WebviewPincodeDialogHint,
    _$WebviewPincodeDialogHint
  ];
  @override
  final String wireName = 'WebviewPincodeDialogHint';

  @override
  Iterable<Object> serialize(
      Serializers serializers, WebviewPincodeDialogHint object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'text',
      serializers.serialize(object.text, specifiedType: const FullType(String)),
      'color',
      serializers.serialize(object.color,
          specifiedType: const FullType(String)),
      'fontSize',
      serializers.serialize(object.fontSize,
          specifiedType: const FullType(double)),
    ];

    return result;
  }

  @override
  WebviewPincodeDialogHint deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WebviewPincodeDialogHintBuilder();

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

class _$WebviewPincodeDialogHint extends WebviewPincodeDialogHint {
  @override
  final String text;
  @override
  final String color;
  @override
  final double fontSize;

  factory _$WebviewPincodeDialogHint(
          [void Function(WebviewPincodeDialogHintBuilder) updates]) =>
      (new WebviewPincodeDialogHintBuilder()..update(updates)).build();

  _$WebviewPincodeDialogHint._({this.text, this.color, this.fontSize})
      : super._() {
    if (text == null) {
      throw new BuiltValueNullFieldError('WebviewPincodeDialogHint', 'text');
    }
    if (color == null) {
      throw new BuiltValueNullFieldError('WebviewPincodeDialogHint', 'color');
    }
    if (fontSize == null) {
      throw new BuiltValueNullFieldError(
          'WebviewPincodeDialogHint', 'fontSize');
    }
  }

  @override
  WebviewPincodeDialogHint rebuild(
          void Function(WebviewPincodeDialogHintBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WebviewPincodeDialogHintBuilder toBuilder() =>
      new WebviewPincodeDialogHintBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WebviewPincodeDialogHint &&
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
    return (newBuiltValueToStringHelper('WebviewPincodeDialogHint')
          ..add('text', text)
          ..add('color', color)
          ..add('fontSize', fontSize))
        .toString();
  }
}

class WebviewPincodeDialogHintBuilder
    implements
        Builder<WebviewPincodeDialogHint, WebviewPincodeDialogHintBuilder> {
  _$WebviewPincodeDialogHint _$v;

  String _text;
  String get text => _$this._text;
  set text(String text) => _$this._text = text;

  String _color;
  String get color => _$this._color;
  set color(String color) => _$this._color = color;

  double _fontSize;
  double get fontSize => _$this._fontSize;
  set fontSize(double fontSize) => _$this._fontSize = fontSize;

  WebviewPincodeDialogHintBuilder() {
    WebviewPincodeDialogHint._initializeBuilder(this);
  }

  WebviewPincodeDialogHintBuilder get _$this {
    if (_$v != null) {
      _text = _$v.text;
      _color = _$v.color;
      _fontSize = _$v.fontSize;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WebviewPincodeDialogHint other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$WebviewPincodeDialogHint;
  }

  @override
  void update(void Function(WebviewPincodeDialogHintBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$WebviewPincodeDialogHint build() {
    final _$result = _$v ??
        new _$WebviewPincodeDialogHint._(
            text: text, color: color, fontSize: fontSize);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
