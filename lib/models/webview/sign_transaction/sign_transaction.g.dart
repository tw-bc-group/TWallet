// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_transaction.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WebviewSignTransaction> _$webviewSignTransactionSerializer =
    new _$WebviewSignTransactionSerializer();

class _$WebviewSignTransactionSerializer
    implements StructuredSerializer<WebviewSignTransaction> {
  @override
  final Iterable<Type> types = const [
    WebviewSignTransaction,
    _$WebviewSignTransaction
  ];
  @override
  final String wireName = 'WebviewSignTransaction';

  @override
  Iterable<Object> serialize(
      Serializers serializers, WebviewSignTransaction object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'transactionInfo',
      serializers.serialize(object.transactionInfo,
          specifiedType: const FullType(WebviewTransactionInfo)),
      'token',
      serializers.serialize(object.token,
          specifiedType: const FullType(String)),
      'pincodeDialogStyle',
      serializers.serialize(object.pincodeDialogStyle,
          specifiedType: const FullType(WebviewPincodeDialogStyle)),
    ];

    return result;
  }

  @override
  WebviewSignTransaction deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WebviewSignTransactionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'transactionInfo':
          result.transactionInfo.replace(serializers.deserialize(value,
                  specifiedType: const FullType(WebviewTransactionInfo))
              as WebviewTransactionInfo);
          break;
        case 'token':
          result.token = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'pincodeDialogStyle':
          result.pincodeDialogStyle.replace(serializers.deserialize(value,
                  specifiedType: const FullType(WebviewPincodeDialogStyle))
              as WebviewPincodeDialogStyle);
          break;
      }
    }

    return result.build();
  }
}

class _$WebviewSignTransaction extends WebviewSignTransaction {
  @override
  final WebviewTransactionInfo transactionInfo;
  @override
  final String token;
  @override
  final WebviewPincodeDialogStyle pincodeDialogStyle;

  factory _$WebviewSignTransaction(
          [void Function(WebviewSignTransactionBuilder) updates]) =>
      (new WebviewSignTransactionBuilder()..update(updates)).build();

  _$WebviewSignTransaction._(
      {this.transactionInfo, this.token, this.pincodeDialogStyle})
      : super._() {
    if (transactionInfo == null) {
      throw new BuiltValueNullFieldError(
          'WebviewSignTransaction', 'transactionInfo');
    }
    if (token == null) {
      throw new BuiltValueNullFieldError('WebviewSignTransaction', 'token');
    }
    if (pincodeDialogStyle == null) {
      throw new BuiltValueNullFieldError(
          'WebviewSignTransaction', 'pincodeDialogStyle');
    }
  }

  @override
  WebviewSignTransaction rebuild(
          void Function(WebviewSignTransactionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WebviewSignTransactionBuilder toBuilder() =>
      new WebviewSignTransactionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WebviewSignTransaction &&
        transactionInfo == other.transactionInfo &&
        token == other.token &&
        pincodeDialogStyle == other.pincodeDialogStyle;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, transactionInfo.hashCode), token.hashCode),
        pincodeDialogStyle.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('WebviewSignTransaction')
          ..add('transactionInfo', transactionInfo)
          ..add('token', token)
          ..add('pincodeDialogStyle', pincodeDialogStyle))
        .toString();
  }
}

class WebviewSignTransactionBuilder
    implements Builder<WebviewSignTransaction, WebviewSignTransactionBuilder> {
  _$WebviewSignTransaction _$v;

  WebviewTransactionInfoBuilder _transactionInfo;
  WebviewTransactionInfoBuilder get transactionInfo =>
      _$this._transactionInfo ??= new WebviewTransactionInfoBuilder();
  set transactionInfo(WebviewTransactionInfoBuilder transactionInfo) =>
      _$this._transactionInfo = transactionInfo;

  String _token;
  String get token => _$this._token;
  set token(String token) => _$this._token = token;

  WebviewPincodeDialogStyleBuilder _pincodeDialogStyle;
  WebviewPincodeDialogStyleBuilder get pincodeDialogStyle =>
      _$this._pincodeDialogStyle ??= new WebviewPincodeDialogStyleBuilder();
  set pincodeDialogStyle(WebviewPincodeDialogStyleBuilder pincodeDialogStyle) =>
      _$this._pincodeDialogStyle = pincodeDialogStyle;

  WebviewSignTransactionBuilder();

  WebviewSignTransactionBuilder get _$this {
    if (_$v != null) {
      _transactionInfo = _$v.transactionInfo?.toBuilder();
      _token = _$v.token;
      _pincodeDialogStyle = _$v.pincodeDialogStyle?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WebviewSignTransaction other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$WebviewSignTransaction;
  }

  @override
  void update(void Function(WebviewSignTransactionBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$WebviewSignTransaction build() {
    _$WebviewSignTransaction _$result;
    try {
      _$result = _$v ??
          new _$WebviewSignTransaction._(
              transactionInfo: transactionInfo.build(),
              token: token,
              pincodeDialogStyle: pincodeDialogStyle.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'transactionInfo';
        transactionInfo.build();

        _$failedField = 'pincodeDialogStyle';
        pincodeDialogStyle.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'WebviewSignTransaction', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
