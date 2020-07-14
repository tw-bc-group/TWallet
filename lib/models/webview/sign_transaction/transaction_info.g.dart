// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WebviewTransactionInfo> _$webviewTransactionInfoSerializer =
    new _$WebviewTransactionInfoSerializer();

class _$WebviewTransactionInfoSerializer
    implements StructuredSerializer<WebviewTransactionInfo> {
  @override
  final Iterable<Type> types = const [
    WebviewTransactionInfo,
    _$WebviewTransactionInfo
  ];
  @override
  final String wireName = 'WebviewTransactionInfo';

  @override
  Iterable<Object> serialize(
      Serializers serializers, WebviewTransactionInfo object,
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
          specifiedType: const FullType(BigInt)),
      'maxGas',
      serializers.serialize(object.maxGas, specifiedType: const FullType(int)),
      'parameters',
      serializers.serialize(object.parameters,
          specifiedType: const FullType(
              BuiltList, const [const FullType(WebviewParameter)])),
    ];

    return result;
  }

  @override
  WebviewTransactionInfo deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WebviewTransactionInfoBuilder();

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
              specifiedType: const FullType(BigInt)) as BigInt;
          break;
        case 'maxGas':
          result.maxGas = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
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

class _$WebviewTransactionInfo extends WebviewTransactionInfo {
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
  final BigInt gasPrice;
  @override
  final int maxGas;
  @override
  final BuiltList<WebviewParameter> parameters;

  factory _$WebviewTransactionInfo(
          [void Function(WebviewTransactionInfoBuilder) updates]) =>
      (new WebviewTransactionInfoBuilder()..update(updates)).build();

  _$WebviewTransactionInfo._(
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
      throw new BuiltValueNullFieldError('WebviewTransactionInfo', 'accountId');
    }
    if (rpcUrl == null) {
      throw new BuiltValueNullFieldError('WebviewTransactionInfo', 'rpcUrl');
    }
    if (contractName == null) {
      throw new BuiltValueNullFieldError(
          'WebviewTransactionInfo', 'contractName');
    }
    if (contractAddress == null) {
      throw new BuiltValueNullFieldError(
          'WebviewTransactionInfo', 'contractAddress');
    }
    if (contractAbi == null) {
      throw new BuiltValueNullFieldError(
          'WebviewTransactionInfo', 'contractAbi');
    }
    if (functionName == null) {
      throw new BuiltValueNullFieldError(
          'WebviewTransactionInfo', 'functionName');
    }
    if (gasPrice == null) {
      throw new BuiltValueNullFieldError('WebviewTransactionInfo', 'gasPrice');
    }
    if (maxGas == null) {
      throw new BuiltValueNullFieldError('WebviewTransactionInfo', 'maxGas');
    }
    if (parameters == null) {
      throw new BuiltValueNullFieldError(
          'WebviewTransactionInfo', 'parameters');
    }
  }

  @override
  WebviewTransactionInfo rebuild(
          void Function(WebviewTransactionInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WebviewTransactionInfoBuilder toBuilder() =>
      new WebviewTransactionInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WebviewTransactionInfo &&
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
    return (newBuiltValueToStringHelper('WebviewTransactionInfo')
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

class WebviewTransactionInfoBuilder
    implements Builder<WebviewTransactionInfo, WebviewTransactionInfoBuilder> {
  _$WebviewTransactionInfo _$v;

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

  BigInt _gasPrice;
  BigInt get gasPrice => _$this._gasPrice;
  set gasPrice(BigInt gasPrice) => _$this._gasPrice = gasPrice;

  int _maxGas;
  int get maxGas => _$this._maxGas;
  set maxGas(int maxGas) => _$this._maxGas = maxGas;

  ListBuilder<WebviewParameter> _parameters;
  ListBuilder<WebviewParameter> get parameters =>
      _$this._parameters ??= new ListBuilder<WebviewParameter>();
  set parameters(ListBuilder<WebviewParameter> parameters) =>
      _$this._parameters = parameters;

  WebviewTransactionInfoBuilder();

  WebviewTransactionInfoBuilder get _$this {
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
  void replace(WebviewTransactionInfo other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$WebviewTransactionInfo;
  }

  @override
  void update(void Function(WebviewTransactionInfoBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$WebviewTransactionInfo build() {
    _$WebviewTransactionInfo _$result;
    try {
      _$result = _$v ??
          new _$WebviewTransactionInfo._(
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
            'WebviewTransactionInfo', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
