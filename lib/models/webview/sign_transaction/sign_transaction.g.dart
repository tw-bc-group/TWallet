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
    ];
    if (object.pincodeStyle != null) {
      result
        ..add('pincodeStyle')
        ..add(serializers.serialize(object.pincodeStyle,
            specifiedType: const FullType(WebviewPincodeStyle)));
    }
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
        case 'pincodeStyle':
          result.pincodeStyle.replace(serializers.deserialize(value,
                  specifiedType: const FullType(WebviewPincodeStyle))
              as WebviewPincodeStyle);
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
  final WebviewPincodeStyle pincodeStyle;

  factory _$WebviewSignTransaction(
          [void Function(WebviewSignTransactionBuilder) updates]) =>
      (new WebviewSignTransactionBuilder()..update(updates)).build();

  _$WebviewSignTransaction._({this.transactionInfo, this.pincodeStyle})
      : super._() {
    if (transactionInfo == null) {
      throw new BuiltValueNullFieldError(
          'WebviewSignTransaction', 'transactionInfo');
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
        pincodeStyle == other.pincodeStyle;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, transactionInfo.hashCode), pincodeStyle.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('WebviewSignTransaction')
          ..add('transactionInfo', transactionInfo)
          ..add('pincodeStyle', pincodeStyle))
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

  WebviewPincodeStyleBuilder _pincodeStyle;
  WebviewPincodeStyleBuilder get pincodeStyle =>
      _$this._pincodeStyle ??= new WebviewPincodeStyleBuilder();
  set pincodeStyle(WebviewPincodeStyleBuilder pincodeStyle) =>
      _$this._pincodeStyle = pincodeStyle;

  WebviewSignTransactionBuilder();

  WebviewSignTransactionBuilder get _$this {
    if (_$v != null) {
      _transactionInfo = _$v.transactionInfo?.toBuilder();
      _pincodeStyle = _$v.pincodeStyle?.toBuilder();
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
              pincodeStyle: _pincodeStyle?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'transactionInfo';
        transactionInfo.build();
        _$failedField = 'pincodeStyle';
        _pincodeStyle?.build();
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
