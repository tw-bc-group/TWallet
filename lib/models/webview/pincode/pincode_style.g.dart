// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pincode_style.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WebviewPincodeStyle> _$webviewPincodeStyleSerializer =
    new _$WebviewPincodeStyleSerializer();

class _$WebviewPincodeStyleSerializer
    implements StructuredSerializer<WebviewPincodeStyle> {
  @override
  final Iterable<Type> types = const [
    WebviewPincodeStyle,
    _$WebviewPincodeStyle
  ];
  @override
  final String wireName = 'WebviewPincodeStyle';

  @override
  Iterable<Object> serialize(
      Serializers serializers, WebviewPincodeStyle object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.closeIcon != null) {
      result
        ..add('closeIcon')
        ..add(serializers.serialize(object.closeIcon,
            specifiedType: const FullType(WebviewPincodeClose)));
    }
    if (object.errorMsg != null) {
      result
        ..add('errorMsg')
        ..add(serializers.serialize(object.errorMsg,
            specifiedType: const FullType(WebviewPincodeErrorMsg)));
    }
    if (object.hintMsg != null) {
      result
        ..add('hintMsg')
        ..add(serializers.serialize(object.hintMsg,
            specifiedType: const FullType(WebviewPincodeHint)));
    }
    if (object.inputFields != null) {
      result
        ..add('inputFields')
        ..add(serializers.serialize(object.inputFields,
            specifiedType: const FullType(WebviewPincodeInput)));
    }
    if (object.title != null) {
      result
        ..add('title')
        ..add(serializers.serialize(object.title,
            specifiedType: const FullType(WebviewPincodeTitle)));
    }
    return result;
  }

  @override
  WebviewPincodeStyle deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WebviewPincodeStyleBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'closeIcon':
          result.closeIcon.replace(serializers.deserialize(value,
                  specifiedType: const FullType(WebviewPincodeClose))
              as WebviewPincodeClose);
          break;
        case 'errorMsg':
          result.errorMsg.replace(serializers.deserialize(value,
                  specifiedType: const FullType(WebviewPincodeErrorMsg))
              as WebviewPincodeErrorMsg);
          break;
        case 'hintMsg':
          result.hintMsg.replace(serializers.deserialize(value,
                  specifiedType: const FullType(WebviewPincodeHint))
              as WebviewPincodeHint);
          break;
        case 'inputFields':
          result.inputFields.replace(serializers.deserialize(value,
                  specifiedType: const FullType(WebviewPincodeInput))
              as WebviewPincodeInput);
          break;
        case 'title':
          result.title.replace(serializers.deserialize(value,
                  specifiedType: const FullType(WebviewPincodeTitle))
              as WebviewPincodeTitle);
          break;
      }
    }

    return result.build();
  }
}

class _$WebviewPincodeStyle extends WebviewPincodeStyle {
  @override
  final WebviewPincodeClose closeIcon;
  @override
  final WebviewPincodeErrorMsg errorMsg;
  @override
  final WebviewPincodeHint hintMsg;
  @override
  final WebviewPincodeInput inputFields;
  @override
  final WebviewPincodeTitle title;

  factory _$WebviewPincodeStyle(
          [void Function(WebviewPincodeStyleBuilder) updates]) =>
      (new WebviewPincodeStyleBuilder()..update(updates)).build();

  _$WebviewPincodeStyle._(
      {this.closeIcon,
      this.errorMsg,
      this.hintMsg,
      this.inputFields,
      this.title})
      : super._();

  @override
  WebviewPincodeStyle rebuild(
          void Function(WebviewPincodeStyleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WebviewPincodeStyleBuilder toBuilder() =>
      new WebviewPincodeStyleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WebviewPincodeStyle &&
        closeIcon == other.closeIcon &&
        errorMsg == other.errorMsg &&
        hintMsg == other.hintMsg &&
        inputFields == other.inputFields &&
        title == other.title;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, closeIcon.hashCode), errorMsg.hashCode),
                hintMsg.hashCode),
            inputFields.hashCode),
        title.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('WebviewPincodeStyle')
          ..add('closeIcon', closeIcon)
          ..add('errorMsg', errorMsg)
          ..add('hintMsg', hintMsg)
          ..add('inputFields', inputFields)
          ..add('title', title))
        .toString();
  }
}

class WebviewPincodeStyleBuilder
    implements Builder<WebviewPincodeStyle, WebviewPincodeStyleBuilder> {
  _$WebviewPincodeStyle _$v;

  WebviewPincodeCloseBuilder _closeIcon;
  WebviewPincodeCloseBuilder get closeIcon =>
      _$this._closeIcon ??= new WebviewPincodeCloseBuilder();
  set closeIcon(WebviewPincodeCloseBuilder closeIcon) =>
      _$this._closeIcon = closeIcon;

  WebviewPincodeErrorMsgBuilder _errorMsg;
  WebviewPincodeErrorMsgBuilder get errorMsg =>
      _$this._errorMsg ??= new WebviewPincodeErrorMsgBuilder();
  set errorMsg(WebviewPincodeErrorMsgBuilder errorMsg) =>
      _$this._errorMsg = errorMsg;

  WebviewPincodeHintBuilder _hintMsg;
  WebviewPincodeHintBuilder get hintMsg =>
      _$this._hintMsg ??= new WebviewPincodeHintBuilder();
  set hintMsg(WebviewPincodeHintBuilder hintMsg) => _$this._hintMsg = hintMsg;

  WebviewPincodeInputBuilder _inputFields;
  WebviewPincodeInputBuilder get inputFields =>
      _$this._inputFields ??= new WebviewPincodeInputBuilder();
  set inputFields(WebviewPincodeInputBuilder inputFields) =>
      _$this._inputFields = inputFields;

  WebviewPincodeTitleBuilder _title;
  WebviewPincodeTitleBuilder get title =>
      _$this._title ??= new WebviewPincodeTitleBuilder();
  set title(WebviewPincodeTitleBuilder title) => _$this._title = title;

  WebviewPincodeStyleBuilder();

  WebviewPincodeStyleBuilder get _$this {
    if (_$v != null) {
      _closeIcon = _$v.closeIcon?.toBuilder();
      _errorMsg = _$v.errorMsg?.toBuilder();
      _hintMsg = _$v.hintMsg?.toBuilder();
      _inputFields = _$v.inputFields?.toBuilder();
      _title = _$v.title?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WebviewPincodeStyle other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$WebviewPincodeStyle;
  }

  @override
  void update(void Function(WebviewPincodeStyleBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$WebviewPincodeStyle build() {
    _$WebviewPincodeStyle _$result;
    try {
      _$result = _$v ??
          new _$WebviewPincodeStyle._(
              closeIcon: _closeIcon?.build(),
              errorMsg: _errorMsg?.build(),
              hintMsg: _hintMsg?.build(),
              inputFields: _inputFields?.build(),
              title: _title?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'closeIcon';
        _closeIcon?.build();
        _$failedField = 'errorMsg';
        _errorMsg?.build();
        _$failedField = 'hintMsg';
        _hintMsg?.build();
        _$failedField = 'inputFields';
        _inputFields?.build();
        _$failedField = 'title';
        _title?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'WebviewPincodeStyle', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
