// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pincode_dialog_input.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WebviewPincodeDialogInput> _$webviewPincodeDialogInputSerializer =
    new _$WebviewPincodeDialogInputSerializer();

class _$WebviewPincodeDialogInputSerializer
    implements StructuredSerializer<WebviewPincodeDialogInput> {
  @override
  final Iterable<Type> types = const [
    WebviewPincodeDialogInput,
    _$WebviewPincodeDialogInput
  ];
  @override
  final String wireName = 'WebviewPincodeDialogInput';

  @override
  Iterable<Object> serialize(
      Serializers serializers, WebviewPincodeDialogInput object,
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
      'textSize',
      serializers.serialize(object.textSize,
          specifiedType: const FullType(double)),
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
  WebviewPincodeDialogInput deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WebviewPincodeDialogInputBuilder();

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
        case 'textSize':
          result.textSize = serializers.deserialize(value,
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

class _$WebviewPincodeDialogInput extends WebviewPincodeDialogInput {
  @override
  final double borderWidth;
  @override
  final double borderRadius;
  @override
  final double size;
  @override
  final double textSize;
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

  factory _$WebviewPincodeDialogInput(
          [void Function(WebviewPincodeDialogInputBuilder) updates]) =>
      (new WebviewPincodeDialogInputBuilder()..update(updates)).build();

  _$WebviewPincodeDialogInput._(
      {this.borderWidth,
      this.borderRadius,
      this.size,
      this.textSize,
      this.textColor,
      this.borderColor,
      this.activeBorderColor,
      this.selectedBorderColor,
      this.filledColor,
      this.activeFillColor,
      this.selectedFillColor})
      : super._() {
    if (borderWidth == null) {
      throw new BuiltValueNullFieldError(
          'WebviewPincodeDialogInput', 'borderWidth');
    }
    if (borderRadius == null) {
      throw new BuiltValueNullFieldError(
          'WebviewPincodeDialogInput', 'borderRadius');
    }
    if (size == null) {
      throw new BuiltValueNullFieldError('WebviewPincodeDialogInput', 'size');
    }
    if (textSize == null) {
      throw new BuiltValueNullFieldError(
          'WebviewPincodeDialogInput', 'textSize');
    }
    if (textColor == null) {
      throw new BuiltValueNullFieldError(
          'WebviewPincodeDialogInput', 'textColor');
    }
    if (borderColor == null) {
      throw new BuiltValueNullFieldError(
          'WebviewPincodeDialogInput', 'borderColor');
    }
    if (activeBorderColor == null) {
      throw new BuiltValueNullFieldError(
          'WebviewPincodeDialogInput', 'activeBorderColor');
    }
    if (selectedBorderColor == null) {
      throw new BuiltValueNullFieldError(
          'WebviewPincodeDialogInput', 'selectedBorderColor');
    }
    if (filledColor == null) {
      throw new BuiltValueNullFieldError(
          'WebviewPincodeDialogInput', 'filledColor');
    }
    if (activeFillColor == null) {
      throw new BuiltValueNullFieldError(
          'WebviewPincodeDialogInput', 'activeFillColor');
    }
    if (selectedFillColor == null) {
      throw new BuiltValueNullFieldError(
          'WebviewPincodeDialogInput', 'selectedFillColor');
    }
  }

  @override
  WebviewPincodeDialogInput rebuild(
          void Function(WebviewPincodeDialogInputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WebviewPincodeDialogInputBuilder toBuilder() =>
      new WebviewPincodeDialogInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WebviewPincodeDialogInput &&
        borderWidth == other.borderWidth &&
        borderRadius == other.borderRadius &&
        size == other.size &&
        textSize == other.textSize &&
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
                                    $jc(
                                        $jc($jc(0, borderWidth.hashCode),
                                            borderRadius.hashCode),
                                        size.hashCode),
                                    textSize.hashCode),
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
    return (newBuiltValueToStringHelper('WebviewPincodeDialogInput')
          ..add('borderWidth', borderWidth)
          ..add('borderRadius', borderRadius)
          ..add('size', size)
          ..add('textSize', textSize)
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

class WebviewPincodeDialogInputBuilder
    implements
        Builder<WebviewPincodeDialogInput, WebviewPincodeDialogInputBuilder> {
  _$WebviewPincodeDialogInput _$v;

  double _borderWidth;
  double get borderWidth => _$this._borderWidth;
  set borderWidth(double borderWidth) => _$this._borderWidth = borderWidth;

  double _borderRadius;
  double get borderRadius => _$this._borderRadius;
  set borderRadius(double borderRadius) => _$this._borderRadius = borderRadius;

  double _size;
  double get size => _$this._size;
  set size(double size) => _$this._size = size;

  double _textSize;
  double get textSize => _$this._textSize;
  set textSize(double textSize) => _$this._textSize = textSize;

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

  WebviewPincodeDialogInputBuilder() {
    WebviewPincodeDialogInput._initializeBuilder(this);
  }

  WebviewPincodeDialogInputBuilder get _$this {
    if (_$v != null) {
      _borderWidth = _$v.borderWidth;
      _borderRadius = _$v.borderRadius;
      _size = _$v.size;
      _textSize = _$v.textSize;
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
  void replace(WebviewPincodeDialogInput other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$WebviewPincodeDialogInput;
  }

  @override
  void update(void Function(WebviewPincodeDialogInputBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$WebviewPincodeDialogInput build() {
    final _$result = _$v ??
        new _$WebviewPincodeDialogInput._(
            borderWidth: borderWidth,
            borderRadius: borderRadius,
            size: size,
            textSize: textSize,
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
