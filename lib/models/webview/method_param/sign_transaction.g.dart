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
      'rpcUrl',
      serializers.serialize(object.rpcUrl,
          specifiedType: const FullType(String)),
      'abi',
      serializers.serialize(object.abi, specifiedType: const FullType(String)),
      'function',
      serializers.serialize(object.function,
          specifiedType: const FullType(String)),
      'gasPrice',
      serializers.serialize(object.gasPrice,
          specifiedType: const FullType(num)),
      'maxGas',
      serializers.serialize(object.maxGas, specifiedType: const FullType(num)),
      'parameters',
      serializers.serialize(object.parameters,
          specifiedType:
              const FullType(BuiltList, const [const FullType(JsonObject)])),
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
        case 'rpcUrl':
          result.rpcUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'abi':
          result.abi = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'function':
          result.function = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'gasPrice':
          result.gasPrice = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num;
          break;
        case 'maxGas':
          result.maxGas = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num;
          break;
        case 'parameters':
          result.parameters.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(JsonObject)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$WebviewSignTransaction extends WebviewSignTransaction {
  @override
  final String rpcUrl;
  @override
  final String abi;
  @override
  final String function;
  @override
  final num gasPrice;
  @override
  final num maxGas;
  @override
  final BuiltList<JsonObject> parameters;

  factory _$WebviewSignTransaction(
          [void Function(WebviewSignTransactionBuilder) updates]) =>
      (new WebviewSignTransactionBuilder()..update(updates)).build();

  _$WebviewSignTransaction._(
      {this.rpcUrl,
      this.abi,
      this.function,
      this.gasPrice,
      this.maxGas,
      this.parameters})
      : super._() {
    if (rpcUrl == null) {
      throw new BuiltValueNullFieldError('WebviewSignTransaction', 'rpcUrl');
    }
    if (abi == null) {
      throw new BuiltValueNullFieldError('WebviewSignTransaction', 'abi');
    }
    if (function == null) {
      throw new BuiltValueNullFieldError('WebviewSignTransaction', 'function');
    }
    if (gasPrice == null) {
      throw new BuiltValueNullFieldError('WebviewSignTransaction', 'gasPrice');
    }
    if (maxGas == null) {
      throw new BuiltValueNullFieldError('WebviewSignTransaction', 'maxGas');
    }
    if (parameters == null) {
      throw new BuiltValueNullFieldError(
          'WebviewSignTransaction', 'parameters');
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
        rpcUrl == other.rpcUrl &&
        abi == other.abi &&
        function == other.function &&
        gasPrice == other.gasPrice &&
        maxGas == other.maxGas &&
        parameters == other.parameters;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, rpcUrl.hashCode), abi.hashCode),
                    function.hashCode),
                gasPrice.hashCode),
            maxGas.hashCode),
        parameters.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('WebviewSignTransaction')
          ..add('rpcUrl', rpcUrl)
          ..add('abi', abi)
          ..add('function', function)
          ..add('gasPrice', gasPrice)
          ..add('maxGas', maxGas)
          ..add('parameters', parameters))
        .toString();
  }
}

class WebviewSignTransactionBuilder
    implements Builder<WebviewSignTransaction, WebviewSignTransactionBuilder> {
  _$WebviewSignTransaction _$v;

  String _rpcUrl;
  String get rpcUrl => _$this._rpcUrl;
  set rpcUrl(String rpcUrl) => _$this._rpcUrl = rpcUrl;

  String _abi;
  String get abi => _$this._abi;
  set abi(String abi) => _$this._abi = abi;

  String _function;
  String get function => _$this._function;
  set function(String function) => _$this._function = function;

  num _gasPrice;
  num get gasPrice => _$this._gasPrice;
  set gasPrice(num gasPrice) => _$this._gasPrice = gasPrice;

  num _maxGas;
  num get maxGas => _$this._maxGas;
  set maxGas(num maxGas) => _$this._maxGas = maxGas;

  ListBuilder<JsonObject> _parameters;
  ListBuilder<JsonObject> get parameters =>
      _$this._parameters ??= new ListBuilder<JsonObject>();
  set parameters(ListBuilder<JsonObject> parameters) =>
      _$this._parameters = parameters;

  WebviewSignTransactionBuilder();

  WebviewSignTransactionBuilder get _$this {
    if (_$v != null) {
      _rpcUrl = _$v.rpcUrl;
      _abi = _$v.abi;
      _function = _$v.function;
      _gasPrice = _$v.gasPrice;
      _maxGas = _$v.maxGas;
      _parameters = _$v.parameters?.toBuilder();
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
              rpcUrl: rpcUrl,
              abi: abi,
              function: function,
              gasPrice: gasPrice,
              maxGas: maxGas,
              parameters: parameters.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'parameters';
        parameters.build();
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
