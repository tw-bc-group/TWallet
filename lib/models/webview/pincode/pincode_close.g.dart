// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pincode_close.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WebviewPincodeClose> _$webviewPincodeCloseSerializer =
    new _$WebviewPincodeCloseSerializer();

class _$WebviewPincodeCloseSerializer
    implements StructuredSerializer<WebviewPincodeClose> {
  @override
  final Iterable<Type> types = const [
    WebviewPincodeClose,
    _$WebviewPincodeClose
  ];
  @override
  final String wireName = 'WebviewPincodeClose';

  @override
  Iterable<Object> serialize(
      Serializers serializers, WebviewPincodeClose object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.color != null) {
      result
        ..add('color')
        ..add(serializers.serialize(object.color,
            specifiedType: const FullType(String)));
    }
    if (object.size != null) {
      result
        ..add('size')
        ..add(serializers.serialize(object.size,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  WebviewPincodeClose deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WebviewPincodeCloseBuilder();

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

class _$WebviewPincodeClose extends WebviewPincodeClose {
  @override
  final String color;
  @override
  final double size;

  factory _$WebviewPincodeClose(
          [void Function(WebviewPincodeCloseBuilder) updates]) =>
      (new WebviewPincodeCloseBuilder()..update(updates)).build();

  _$WebviewPincodeClose._({this.color, this.size}) : super._();

  @override
  WebviewPincodeClose rebuild(
          void Function(WebviewPincodeCloseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WebviewPincodeCloseBuilder toBuilder() =>
      new WebviewPincodeCloseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WebviewPincodeClose &&
        color == other.color &&
        size == other.size;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, color.hashCode), size.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('WebviewPincodeClose')
          ..add('color', color)
          ..add('size', size))
        .toString();
  }
}

class WebviewPincodeCloseBuilder
    implements Builder<WebviewPincodeClose, WebviewPincodeCloseBuilder> {
  _$WebviewPincodeClose _$v;

  String _color;
  String get color => _$this._color;
  set color(String color) => _$this._color = color;

  double _size;
  double get size => _$this._size;
  set size(double size) => _$this._size = size;

  WebviewPincodeCloseBuilder();

  WebviewPincodeCloseBuilder get _$this {
    if (_$v != null) {
      _color = _$v.color;
      _size = _$v.size;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WebviewPincodeClose other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$WebviewPincodeClose;
  }

  @override
  void update(void Function(WebviewPincodeCloseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$WebviewPincodeClose build() {
    final _$result =
        _$v ?? new _$WebviewPincodeClose._(color: color, size: size);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
