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
  Iterable<Object?> serialize(
      Serializers serializers, WebviewPincodeDialogInput object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
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
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WebviewPincodeDialogInputBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'borderWidth':
          result.borderWidth = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'borderRadius':
          result.borderRadius = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'size':
          result.size = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'textSize':
          result.textSize = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'textColor':
          result.textColor = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'borderColor':
          result.borderColor = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'activeBorderColor':
          result.activeBorderColor = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'selectedBorderColor':
          result.selectedBorderColor = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'filledColor':
          result.filledColor = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'activeFillColor':
          result.activeFillColor = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'selectedFillColor':
          result.selectedFillColor = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
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
          [void Function(WebviewPincodeDialogInputBuilder)? updates]) =>
      (new WebviewPincodeDialogInputBuilder()..update(updates))._build();

  _$WebviewPincodeDialogInput._(
      {required this.borderWidth,
      required this.borderRadius,
      required this.size,
      required this.textSize,
      required this.textColor,
      required this.borderColor,
      required this.activeBorderColor,
      required this.selectedBorderColor,
      required this.filledColor,
      required this.activeFillColor,
      required this.selectedFillColor})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        borderWidth, r'WebviewPincodeDialogInput', 'borderWidth');
    BuiltValueNullFieldError.checkNotNull(
        borderRadius, r'WebviewPincodeDialogInput', 'borderRadius');
    BuiltValueNullFieldError.checkNotNull(
        size, r'WebviewPincodeDialogInput', 'size');
    BuiltValueNullFieldError.checkNotNull(
        textSize, r'WebviewPincodeDialogInput', 'textSize');
    BuiltValueNullFieldError.checkNotNull(
        textColor, r'WebviewPincodeDialogInput', 'textColor');
    BuiltValueNullFieldError.checkNotNull(
        borderColor, r'WebviewPincodeDialogInput', 'borderColor');
    BuiltValueNullFieldError.checkNotNull(
        activeBorderColor, r'WebviewPincodeDialogInput', 'activeBorderColor');
    BuiltValueNullFieldError.checkNotNull(selectedBorderColor,
        r'WebviewPincodeDialogInput', 'selectedBorderColor');
    BuiltValueNullFieldError.checkNotNull(
        filledColor, r'WebviewPincodeDialogInput', 'filledColor');
    BuiltValueNullFieldError.checkNotNull(
        activeFillColor, r'WebviewPincodeDialogInput', 'activeFillColor');
    BuiltValueNullFieldError.checkNotNull(
        selectedFillColor, r'WebviewPincodeDialogInput', 'selectedFillColor');
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
    return (newBuiltValueToStringHelper(r'WebviewPincodeDialogInput')
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
  _$WebviewPincodeDialogInput? _$v;

  double? _borderWidth;
  double? get borderWidth => _$this._borderWidth;
  set borderWidth(double? borderWidth) => _$this._borderWidth = borderWidth;

  double? _borderRadius;
  double? get borderRadius => _$this._borderRadius;
  set borderRadius(double? borderRadius) => _$this._borderRadius = borderRadius;

  double? _size;
  double? get size => _$this._size;
  set size(double? size) => _$this._size = size;

  double? _textSize;
  double? get textSize => _$this._textSize;
  set textSize(double? textSize) => _$this._textSize = textSize;

  String? _textColor;
  String? get textColor => _$this._textColor;
  set textColor(String? textColor) => _$this._textColor = textColor;

  String? _borderColor;
  String? get borderColor => _$this._borderColor;
  set borderColor(String? borderColor) => _$this._borderColor = borderColor;

  String? _activeBorderColor;
  String? get activeBorderColor => _$this._activeBorderColor;
  set activeBorderColor(String? activeBorderColor) =>
      _$this._activeBorderColor = activeBorderColor;

  String? _selectedBorderColor;
  String? get selectedBorderColor => _$this._selectedBorderColor;
  set selectedBorderColor(String? selectedBorderColor) =>
      _$this._selectedBorderColor = selectedBorderColor;

  String? _filledColor;
  String? get filledColor => _$this._filledColor;
  set filledColor(String? filledColor) => _$this._filledColor = filledColor;

  String? _activeFillColor;
  String? get activeFillColor => _$this._activeFillColor;
  set activeFillColor(String? activeFillColor) =>
      _$this._activeFillColor = activeFillColor;

  String? _selectedFillColor;
  String? get selectedFillColor => _$this._selectedFillColor;
  set selectedFillColor(String? selectedFillColor) =>
      _$this._selectedFillColor = selectedFillColor;

  WebviewPincodeDialogInputBuilder() {
    WebviewPincodeDialogInput._initializeBuilder(this);
  }

  WebviewPincodeDialogInputBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _borderWidth = $v.borderWidth;
      _borderRadius = $v.borderRadius;
      _size = $v.size;
      _textSize = $v.textSize;
      _textColor = $v.textColor;
      _borderColor = $v.borderColor;
      _activeBorderColor = $v.activeBorderColor;
      _selectedBorderColor = $v.selectedBorderColor;
      _filledColor = $v.filledColor;
      _activeFillColor = $v.activeFillColor;
      _selectedFillColor = $v.selectedFillColor;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WebviewPincodeDialogInput other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WebviewPincodeDialogInput;
  }

  @override
  void update(void Function(WebviewPincodeDialogInputBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WebviewPincodeDialogInput build() => _build();

  _$WebviewPincodeDialogInput _build() {
    final _$result = _$v ??
        new _$WebviewPincodeDialogInput._(
            borderWidth: BuiltValueNullFieldError.checkNotNull(
                borderWidth, r'WebviewPincodeDialogInput', 'borderWidth'),
            borderRadius: BuiltValueNullFieldError.checkNotNull(
                borderRadius, r'WebviewPincodeDialogInput', 'borderRadius'),
            size: BuiltValueNullFieldError.checkNotNull(
                size, r'WebviewPincodeDialogInput', 'size'),
            textSize: BuiltValueNullFieldError.checkNotNull(
                textSize, r'WebviewPincodeDialogInput', 'textSize'),
            textColor: BuiltValueNullFieldError.checkNotNull(
                textColor, r'WebviewPincodeDialogInput', 'textColor'),
            borderColor: BuiltValueNullFieldError.checkNotNull(
                borderColor, r'WebviewPincodeDialogInput', 'borderColor'),
            activeBorderColor: BuiltValueNullFieldError.checkNotNull(
                activeBorderColor, r'WebviewPincodeDialogInput', 'activeBorderColor'),
            selectedBorderColor: BuiltValueNullFieldError.checkNotNull(
                selectedBorderColor, r'WebviewPincodeDialogInput', 'selectedBorderColor'),
            filledColor: BuiltValueNullFieldError.checkNotNull(filledColor, r'WebviewPincodeDialogInput', 'filledColor'),
            activeFillColor: BuiltValueNullFieldError.checkNotNull(activeFillColor, r'WebviewPincodeDialogInput', 'activeFillColor'),
            selectedFillColor: BuiltValueNullFieldError.checkNotNull(selectedFillColor, r'WebviewPincodeDialogInput', 'selectedFillColor'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
