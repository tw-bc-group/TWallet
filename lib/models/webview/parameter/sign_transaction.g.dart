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
      'accountId',
      serializers.serialize(object.accountId,
          specifiedType: const FullType(String)),
      'rpcUrl',
      serializers.serialize(object.rpcUrl,
          specifiedType: const FullType(String)),
      'contractName',
      serializers.serialize(object.contractName,
          specifiedType: const FullType(String)),
      'contractAddress',
      serializers.serialize(object.contractAddress,
          specifiedType: const FullType(String)),
      'contractAbi',
      serializers.serialize(object.contractAbi,
          specifiedType: const FullType(String)),
      'functionName',
      serializers.serialize(object.functionName,
          specifiedType: const FullType(String)),
      'gasPrice',
      serializers.serialize(object.gasPrice,
          specifiedType: const FullType(num)),
      'maxGas',
      serializers.serialize(object.maxGas, specifiedType: const FullType(num)),
      'parameters',
      serializers.serialize(object.parameters,
          specifiedType: const FullType(
              BuiltList, const [const FullType(WebviewParameter)])),
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
        case 'accountId':
          result.accountId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'rpcUrl':
          result.rpcUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'contractName':
          result.contractName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'contractAddress':
          result.contractAddress = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'contractAbi':
          result.contractAbi = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'functionName':
          result.functionName = serializers.deserialize(value,
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
                      BuiltList, const [const FullType(WebviewParameter)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$WebviewSignTransaction extends WebviewSignTransaction {
  @override
  final String accountId;
  @override
  final String rpcUrl;
  @override
  final String contractName;
  @override
  final String contractAddress;
  @override
  final String contractAbi;
  @override
  final String functionName;
  @override
  final num gasPrice;
  @override
  final num maxGas;
  @override
  final BuiltList<WebviewParameter> parameters;

  factory _$WebviewSignTransaction(
          [void Function(WebviewSignTransactionBuilder) updates]) =>
      (new WebviewSignTransactionBuilder()..update(updates)).build();

  _$WebviewSignTransaction._(
      {this.accountId,
      this.rpcUrl,
      this.contractName,
      this.contractAddress,
      this.contractAbi,
      this.functionName,
      this.gasPrice,
      this.maxGas,
      this.parameters})
      : super._() {
    if (accountId == null) {
      throw new BuiltValueNullFieldError('WebviewSignTransaction', 'accountId');
    }
    if (rpcUrl == null) {
      throw new BuiltValueNullFieldError('WebviewSignTransaction', 'rpcUrl');
    }
    if (contractName == null) {
      throw new BuiltValueNullFieldError(
          'WebviewSignTransaction', 'contractName');
    }
    if (contractAddress == null) {
      throw new BuiltValueNullFieldError(
          'WebviewSignTransaction', 'contractAddress');
    }
    if (contractAbi == null) {
      throw new BuiltValueNullFieldError(
          'WebviewSignTransaction', 'contractAbi');
    }
    if (functionName == null) {
      throw new BuiltValueNullFieldError(
          'WebviewSignTransaction', 'functionName');
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
        accountId == other.accountId &&
        rpcUrl == other.rpcUrl &&
        contractName == other.contractName &&
        contractAddress == other.contractAddress &&
        contractAbi == other.contractAbi &&
        functionName == other.functionName &&
        gasPrice == other.gasPrice &&
        maxGas == other.maxGas &&
        parameters == other.parameters;
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
                                $jc($jc(0, accountId.hashCode),
                                    rpcUrl.hashCode),
                                contractName.hashCode),
                            contractAddress.hashCode),
                        contractAbi.hashCode),
                    functionName.hashCode),
                gasPrice.hashCode),
            maxGas.hashCode),
        parameters.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('WebviewSignTransaction')
          ..add('accountId', accountId)
          ..add('rpcUrl', rpcUrl)
          ..add('contractName', contractName)
          ..add('contractAddress', contractAddress)
          ..add('contractAbi', contractAbi)
          ..add('functionName', functionName)
          ..add('gasPrice', gasPrice)
          ..add('maxGas', maxGas)
          ..add('parameters', parameters))
        .toString();
  }
}

class WebviewSignTransactionBuilder
    implements Builder<WebviewSignTransaction, WebviewSignTransactionBuilder> {
  _$WebviewSignTransaction _$v;

  String _accountId;
  String get accountId => _$this._accountId;
  set accountId(String accountId) => _$this._accountId = accountId;

  String _rpcUrl;
  String get rpcUrl => _$this._rpcUrl;
  set rpcUrl(String rpcUrl) => _$this._rpcUrl = rpcUrl;

  String _contractName;
  String get contractName => _$this._contractName;
  set contractName(String contractName) => _$this._contractName = contractName;

  String _contractAddress;
  String get contractAddress => _$this._contractAddress;
  set contractAddress(String contractAddress) =>
      _$this._contractAddress = contractAddress;

  String _contractAbi;
  String get contractAbi => _$this._contractAbi;
  set contractAbi(String contractAbi) => _$this._contractAbi = contractAbi;

  String _functionName;
  String get functionName => _$this._functionName;
  set functionName(String functionName) => _$this._functionName = functionName;

  num _gasPrice;
  num get gasPrice => _$this._gasPrice;
  set gasPrice(num gasPrice) => _$this._gasPrice = gasPrice;

  num _maxGas;
  num get maxGas => _$this._maxGas;
  set maxGas(num maxGas) => _$this._maxGas = maxGas;

  ListBuilder<WebviewParameter> _parameters;
  ListBuilder<WebviewParameter> get parameters =>
      _$this._parameters ??= new ListBuilder<WebviewParameter>();
  set parameters(ListBuilder<WebviewParameter> parameters) =>
      _$this._parameters = parameters;

  WebviewSignTransactionBuilder();

  WebviewSignTransactionBuilder get _$this {
    if (_$v != null) {
      _accountId = _$v.accountId;
      _rpcUrl = _$v.rpcUrl;
      _contractName = _$v.contractName;
      _contractAddress = _$v.contractAddress;
      _contractAbi = _$v.contractAbi;
      _functionName = _$v.functionName;
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
              accountId: accountId,
              rpcUrl: rpcUrl,
              contractName: contractName,
              contractAddress: contractAddress,
              contractAbi: contractAbi,
              functionName: functionName,
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
