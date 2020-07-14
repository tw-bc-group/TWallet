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
    final result = <Object>[
      'pincodeClose',
      serializers.serialize(object.pincodeClose,
          specifiedType: const FullType(WebviewPincodeClose)),
      'pincodeErrorMsg',
      serializers.serialize(object.pincodeErrorMsg,
          specifiedType: const FullType(WebviewPincodeErrorMsg)),
      'pincodeHint',
      serializers.serialize(object.pincodeHint,
          specifiedType: const FullType(WebviewPincodeHint)),
      'pincodeInput',
      serializers.serialize(object.pincodeInput,
          specifiedType: const FullType(WebviewPincodeInput)),
      'pincodeTitle',
      serializers.serialize(object.pincodeTitle,
          specifiedType: const FullType(WebviewPincodeTitle)),
    ];

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
        case 'pincodeClose':
          result.pincodeClose.replace(serializers.deserialize(value,
                  specifiedType: const FullType(WebviewPincodeClose))
              as WebviewPincodeClose);
          break;
        case 'pincodeErrorMsg':
          result.pincodeErrorMsg.replace(serializers.deserialize(value,
                  specifiedType: const FullType(WebviewPincodeErrorMsg))
              as WebviewPincodeErrorMsg);
          break;
        case 'pincodeHint':
          result.pincodeHint.replace(serializers.deserialize(value,
                  specifiedType: const FullType(WebviewPincodeHint))
              as WebviewPincodeHint);
          break;
        case 'pincodeInput':
          result.pincodeInput.replace(serializers.deserialize(value,
                  specifiedType: const FullType(WebviewPincodeInput))
              as WebviewPincodeInput);
          break;
        case 'pincodeTitle':
          result.pincodeTitle.replace(serializers.deserialize(value,
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
  final WebviewPincodeClose pincodeClose;
  @override
  final WebviewPincodeErrorMsg pincodeErrorMsg;
  @override
  final WebviewPincodeHint pincodeHint;
  @override
  final WebviewPincodeInput pincodeInput;
  @override
  final WebviewPincodeTitle pincodeTitle;

  factory _$WebviewPincodeStyle(
          [void Function(WebviewPincodeStyleBuilder) updates]) =>
      (new WebviewPincodeStyleBuilder()..update(updates)).build();

  _$WebviewPincodeStyle._(
      {this.pincodeClose,
      this.pincodeErrorMsg,
      this.pincodeHint,
      this.pincodeInput,
      this.pincodeTitle})
      : super._() {
    if (pincodeClose == null) {
      throw new BuiltValueNullFieldError('WebviewPincodeStyle', 'pincodeClose');
    }
    if (pincodeErrorMsg == null) {
      throw new BuiltValueNullFieldError(
          'WebviewPincodeStyle', 'pincodeErrorMsg');
    }
    if (pincodeHint == null) {
      throw new BuiltValueNullFieldError('WebviewPincodeStyle', 'pincodeHint');
    }
    if (pincodeInput == null) {
      throw new BuiltValueNullFieldError('WebviewPincodeStyle', 'pincodeInput');
    }
    if (pincodeTitle == null) {
      throw new BuiltValueNullFieldError('WebviewPincodeStyle', 'pincodeTitle');
    }
  }

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
        pincodeClose == other.pincodeClose &&
        pincodeErrorMsg == other.pincodeErrorMsg &&
        pincodeHint == other.pincodeHint &&
        pincodeInput == other.pincodeInput &&
        pincodeTitle == other.pincodeTitle;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, pincodeClose.hashCode), pincodeErrorMsg.hashCode),
                pincodeHint.hashCode),
            pincodeInput.hashCode),
        pincodeTitle.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('WebviewPincodeStyle')
          ..add('pincodeClose', pincodeClose)
          ..add('pincodeErrorMsg', pincodeErrorMsg)
          ..add('pincodeHint', pincodeHint)
          ..add('pincodeInput', pincodeInput)
          ..add('pincodeTitle', pincodeTitle))
        .toString();
  }
}

class WebviewPincodeStyleBuilder
    implements Builder<WebviewPincodeStyle, WebviewPincodeStyleBuilder> {
  _$WebviewPincodeStyle _$v;

  WebviewPincodeCloseBuilder _pincodeClose;
  WebviewPincodeCloseBuilder get pincodeClose =>
      _$this._pincodeClose ??= new WebviewPincodeCloseBuilder();
  set pincodeClose(WebviewPincodeCloseBuilder pincodeClose) =>
      _$this._pincodeClose = pincodeClose;

  WebviewPincodeErrorMsgBuilder _pincodeErrorMsg;
  WebviewPincodeErrorMsgBuilder get pincodeErrorMsg =>
      _$this._pincodeErrorMsg ??= new WebviewPincodeErrorMsgBuilder();
  set pincodeErrorMsg(WebviewPincodeErrorMsgBuilder pincodeErrorMsg) =>
      _$this._pincodeErrorMsg = pincodeErrorMsg;

  WebviewPincodeHintBuilder _pincodeHint;
  WebviewPincodeHintBuilder get pincodeHint =>
      _$this._pincodeHint ??= new WebviewPincodeHintBuilder();
  set pincodeHint(WebviewPincodeHintBuilder pincodeHint) =>
      _$this._pincodeHint = pincodeHint;

  WebviewPincodeInputBuilder _pincodeInput;
  WebviewPincodeInputBuilder get pincodeInput =>
      _$this._pincodeInput ??= new WebviewPincodeInputBuilder();
  set pincodeInput(WebviewPincodeInputBuilder pincodeInput) =>
      _$this._pincodeInput = pincodeInput;

  WebviewPincodeTitleBuilder _pincodeTitle;
  WebviewPincodeTitleBuilder get pincodeTitle =>
      _$this._pincodeTitle ??= new WebviewPincodeTitleBuilder();
  set pincodeTitle(WebviewPincodeTitleBuilder pincodeTitle) =>
      _$this._pincodeTitle = pincodeTitle;

  WebviewPincodeStyleBuilder();

  WebviewPincodeStyleBuilder get _$this {
    if (_$v != null) {
      _pincodeClose = _$v.pincodeClose?.toBuilder();
      _pincodeErrorMsg = _$v.pincodeErrorMsg?.toBuilder();
      _pincodeHint = _$v.pincodeHint?.toBuilder();
      _pincodeInput = _$v.pincodeInput?.toBuilder();
      _pincodeTitle = _$v.pincodeTitle?.toBuilder();
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
              pincodeClose: pincodeClose.build(),
              pincodeErrorMsg: pincodeErrorMsg.build(),
              pincodeHint: pincodeHint.build(),
              pincodeInput: pincodeInput.build(),
              pincodeTitle: pincodeTitle.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'pincodeClose';
        pincodeClose.build();
        _$failedField = 'pincodeErrorMsg';
        pincodeErrorMsg.build();
        _$failedField = 'pincodeHint';
        pincodeHint.build();
        _$failedField = 'pincodeInput';
        pincodeInput.build();
        _$failedField = 'pincodeTitle';
        pincodeTitle.build();
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
