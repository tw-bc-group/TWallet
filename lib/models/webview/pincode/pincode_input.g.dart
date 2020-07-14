// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pincode_input.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WebviewPincodeInput> _$webviewPincodeInputSerializer =
    new _$WebviewPincodeInputSerializer();

class _$WebviewPincodeInputSerializer
    implements StructuredSerializer<WebviewPincodeInput> {
  @override
  final Iterable<Type> types = const [
    WebviewPincodeInput,
    _$WebviewPincodeInput
  ];
  @override
  final String wireName = 'WebviewPincodeInput';

  @override
  Iterable<Object> serialize(
      Serializers serializers, WebviewPincodeInput object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'borderWidth',
      serializers.serialize(object.borderWidth,
          specifiedType: const FullType(double)),
      'borderRadius',
      serializers.serialize(object.borderRadius,
          specifiedType: const FullType(double)),
      'size',
      serializers.serialize(object.size, specifiedType: const FullType(double)),
      'textColor',
      serializers.serialize(object.textColor,
          specifiedType: const FullType(String)),
      'borderColor',
      serializers.serialize(object.borderColor,
          specifiedType: const FullType(String)),
      'activeBorderColor',
      serializers.serialize(object.activeBorderColor,
          specifiedType: const FullType(String)),
      'selectedBorderColor',
      serializers.serialize(object.selectedBorderColor,
          specifiedType: const FullType(String)),
      'filledColor',
      serializers.serialize(object.filledColor,
          specifiedType: const FullType(String)),
      'activeFillColor',
      serializers.serialize(object.activeFillColor,
          specifiedType: const FullType(String)),
      'selectedFillColor',
      serializers.serialize(object.selectedFillColor,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  WebviewPincodeInput deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WebviewPincodeInputBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'borderWidth':
          result.borderWidth = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'borderRadius':
          result.borderRadius = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'size':
          result.size = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'textColor':
          result.textColor = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'borderColor':
          result.borderColor = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'activeBorderColor':
          result.activeBorderColor = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'selectedBorderColor':
          result.selectedBorderColor = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'filledColor':
          result.filledColor = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'activeFillColor':
          result.activeFillColor = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'selectedFillColor':
          result.selectedFillColor = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$WebviewPincodeInput extends WebviewPincodeInput {
  @override
  final double borderWidth;
  @override
  final double borderRadius;
  @override
  final double size;
  @override
  final String textColor;
  @override
  final String borderColor;
  @override
  final String activeBorderColor;
  @override
  final String selectedBorderColor;
  @override
  final String filledColor;
  @override
  final String activeFillColor;
  @override
  final String selectedFillColor;

  factory _$WebviewPincodeInput(
          [void Function(WebviewPincodeInputBuilder) updates]) =>
      (new WebviewPincodeInputBuilder()..update(updates)).build();

  _$WebviewPincodeInput._(
      {this.borderWidth,
      this.borderRadius,
      this.size,
      this.textColor,
      this.borderColor,
      this.activeBorderColor,
      this.selectedBorderColor,
      this.filledColor,
      this.activeFillColor,
      this.selectedFillColor})
      : super._() {
    if (borderWidth == null) {
      throw new BuiltValueNullFieldError('WebviewPincodeInput', 'borderWidth');
    }
    if (borderRadius == null) {
      throw new BuiltValueNullFieldError('WebviewPincodeInput', 'borderRadius');
    }
    if (size == null) {
      throw new BuiltValueNullFieldError('WebviewPincodeInput', 'size');
    }
    if (textColor == null) {
      throw new BuiltValueNullFieldError('WebviewPincodeInput', 'textColor');
    }
    if (borderColor == null) {
      throw new BuiltValueNullFieldError('WebviewPincodeInput', 'borderColor');
    }
    if (activeBorderColor == null) {
      throw new BuiltValueNullFieldError(
          'WebviewPincodeInput', 'activeBorderColor');
    }
    if (selectedBorderColor == null) {
      throw new BuiltValueNullFieldError(
          'WebviewPincodeInput', 'selectedBorderColor');
    }
    if (filledColor == null) {
      throw new BuiltValueNullFieldError('WebviewPincodeInput', 'filledColor');
    }
    if (activeFillColor == null) {
      throw new BuiltValueNullFieldError(
          'WebviewPincodeInput', 'activeFillColor');
    }
    if (selectedFillColor == null) {
      throw new BuiltValueNullFieldError(
          'WebviewPincodeInput', 'selectedFillColor');
    }
  }

  @override
  WebviewPincodeInput rebuild(
          void Function(WebviewPincodeInputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WebviewPincodeInputBuilder toBuilder() =>
      new WebviewPincodeInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WebviewPincodeInput &&
        borderWidth == other.borderWidth &&
        borderRadius == other.borderRadius &&
        size == other.size &&
        textColor == other.textColor &&
        borderColor == other.borderColor &&
        activeBorderColor == other.activeBorderColor &&
        selectedBorderColor == other.selectedBorderColor &&
        filledColor == other.filledColor &&
        activeFillColor == other.activeFillColor &&
        selectedFillColor == other.selectedFillColor;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc($jc(0, borderWidth.hashCode),
                                        borderRadius.hashCode),
                                    size.hashCode),
                                textColor.hashCode),
                            borderColor.hashCode),
                        activeBorderColor.hashCode),
                    selectedBorderColor.hashCode),
                filledColor.hashCode),
            activeFillColor.hashCode),
        selectedFillColor.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('WebviewPincodeInput')
          ..add('borderWidth', borderWidth)
          ..add('borderRadius', borderRadius)
          ..add('size', size)
          ..add('textColor', textColor)
          ..add('borderColor', borderColor)
          ..add('activeBorderColor', activeBorderColor)
          ..add('selectedBorderColor', selectedBorderColor)
          ..add('filledColor', filledColor)
          ..add('activeFillColor', activeFillColor)
          ..add('selectedFillColor', selectedFillColor))
        .toString();
  }
}

class WebviewPincodeInputBuilder
    implements Builder<WebviewPincodeInput, WebviewPincodeInputBuilder> {
  _$WebviewPincodeInput _$v;

  double _borderWidth;
  double get borderWidth => _$this._borderWidth;
  set borderWidth(double borderWidth) => _$this._borderWidth = borderWidth;

  double _borderRadius;
  double get borderRadius => _$this._borderRadius;
  set borderRadius(double borderRadius) => _$this._borderRadius = borderRadius;

  double _size;
  double get size => _$this._size;
  set size(double size) => _$this._size = size;

  String _textColor;
  String get textColor => _$this._textColor;
  set textColor(String textColor) => _$this._textColor = textColor;

  String _borderColor;
  String get borderColor => _$this._borderColor;
  set borderColor(String borderColor) => _$this._borderColor = borderColor;

  String _activeBorderColor;
  String get activeBorderColor => _$this._activeBorderColor;
  set activeBorderColor(String activeBorderColor) =>
      _$this._activeBorderColor = activeBorderColor;

  String _selectedBorderColor;
  String get selectedBorderColor => _$this._selectedBorderColor;
  set selectedBorderColor(String selectedBorderColor) =>
      _$this._selectedBorderColor = selectedBorderColor;

  String _filledColor;
  String get filledColor => _$this._filledColor;
  set filledColor(String filledColor) => _$this._filledColor = filledColor;

  String _activeFillColor;
  String get activeFillColor => _$this._activeFillColor;
  set activeFillColor(String activeFillColor) =>
      _$this._activeFillColor = activeFillColor;

  String _selectedFillColor;
  String get selectedFillColor => _$this._selectedFillColor;
  set selectedFillColor(String selectedFillColor) =>
      _$this._selectedFillColor = selectedFillColor;

  WebviewPincodeInputBuilder();

  WebviewPincodeInputBuilder get _$this {
    if (_$v != null) {
      _borderWidth = _$v.borderWidth;
      _borderRadius = _$v.borderRadius;
      _size = _$v.size;
      _textColor = _$v.textColor;
      _borderColor = _$v.borderColor;
      _activeBorderColor = _$v.activeBorderColor;
      _selectedBorderColor = _$v.selectedBorderColor;
      _filledColor = _$v.filledColor;
      _activeFillColor = _$v.activeFillColor;
      _selectedFillColor = _$v.selectedFillColor;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WebviewPincodeInput other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$WebviewPincodeInput;
  }

  @override
  void update(void Function(WebviewPincodeInputBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$WebviewPincodeInput build() {
    final _$result = _$v ??
        new _$WebviewPincodeInput._(
            borderWidth: borderWidth,
            borderRadius: borderRadius,
            size: size,
            textColor: textColor,
            borderColor: borderColor,
            activeBorderColor: activeBorderColor,
            selectedBorderColor: selectedBorderColor,
            filledColor: filledColor,
            activeFillColor: activeFillColor,
            selectedFillColor: selectedFillColor);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
