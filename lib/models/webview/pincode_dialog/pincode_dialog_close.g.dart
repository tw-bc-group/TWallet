// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pincode_dialog_close.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WebviewPincodeDialogClose> _$webviewPincodeDialogCloseSerializer =
    new _$WebviewPincodeDialogCloseSerializer();

class _$WebviewPincodeDialogCloseSerializer
    implements StructuredSerializer<WebviewPincodeDialogClose> {
  @override
  final Iterable<Type> types = const [
    WebviewPincodeDialogClose,
    _$WebviewPincodeDialogClose
  ];
  @override
  final String wireName = 'WebviewPincodeDialogClose';

  @override
  Iterable<Object> serialize(
      Serializers serializers, WebviewPincodeDialogClose object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'color',
      serializers.serialize(object.color,
          specifiedType: const FullType(String)),
      'size',
      serializers.serialize(object.size, specifiedType: const FullType(double)),
    ];

    return result;
  }

  @override
  WebviewPincodeDialogClose deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WebviewPincodeDialogCloseBuilder();

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
        case 'size':
          result.size = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
      }
    }

    return result.build();
  }
}

class _$WebviewPincodeDialogClose extends WebviewPincodeDialogClose {
  @override
  final String color;
  @override
  final double size;

  factory _$WebviewPincodeDialogClose(
          [void Function(WebviewPincodeDialogCloseBuilder) updates]) =>
      (new WebviewPincodeDialogCloseBuilder()..update(updates)).build();

  _$WebviewPincodeDialogClose._({this.color, this.size}) : super._() {
    if (color == null) {
      throw new BuiltValueNullFieldError('WebviewPincodeDialogClose', 'color');
    }
    if (size == null) {
      throw new BuiltValueNullFieldError('WebviewPincodeDialogClose', 'size');
    }
  }

  @override
  WebviewPincodeDialogClose rebuild(
          void Function(WebviewPincodeDialogCloseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WebviewPincodeDialogCloseBuilder toBuilder() =>
      new WebviewPincodeDialogCloseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WebviewPincodeDialogClose &&
        color == other.color &&
        size == other.size;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, color.hashCode), size.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('WebviewPincodeDialogClose')
          ..add('color', color)
          ..add('size', size))
        .toString();
  }
}

class WebviewPincodeDialogCloseBuilder
    implements
        Builder<WebviewPincodeDialogClose, WebviewPincodeDialogCloseBuilder> {
  _$WebviewPincodeDialogClose _$v;

  String _color;
  String get color => _$this._color;
  set color(String color) => _$this._color = color;

  double _size;
  double get size => _$this._size;
  set size(double size) => _$this._size = size;

  WebviewPincodeDialogCloseBuilder() {
    WebviewPincodeDialogClose._initializeBuilder(this);
  }

  WebviewPincodeDialogCloseBuilder get _$this {
    if (_$v != null) {
      _color = _$v.color;
      _size = _$v.size;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WebviewPincodeDialogClose other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$WebviewPincodeDialogClose;
  }

  @override
  void update(void Function(WebviewPincodeDialogCloseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$WebviewPincodeDialogClose build() {
    final _$result =
        _$v ?? new _$WebviewPincodeDialogClose._(color: color, size: size);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
