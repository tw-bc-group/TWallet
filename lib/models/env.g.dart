// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'env.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Env> _$envSerializer = new _$EnvSerializer();

class _$EnvSerializer implements StructuredSerializer<Env> {
  @override
  final Iterable<Type> types = const [Env, _$Env];
  @override
  final String wireName = 'Env';

  @override
  Iterable<Object> serialize(Serializers serializers, Env object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'apiGatewayBaseUrl',
      serializers.serialize(object.apiGatewayBaseUrl,
          specifiedType: const FullType(String)),
      'apiGatewayConnectTimeout',
      serializers.serialize(object.apiGatewayConnectTimeout,
          specifiedType: const FullType(int)),
      'web3RpcGatewayUrl',
      serializers.serialize(object.web3RpcGatewayUrl,
          specifiedType: const FullType(String)),
      'didPrefix',
      serializers.serialize(object.didPrefix,
          specifiedType: const FullType(String)),
      'tokenName',
      serializers.serialize(object.tokenName,
          specifiedType: const FullType(String)),
      'tokenSymbol',
      serializers.serialize(object.tokenSymbol,
          specifiedType: const FullType(String)),
      'tokenPrecision',
      serializers.serialize(object.tokenPrecision,
          specifiedType: const FullType(int)),
      'tokenHumanReadablePrecision',
      serializers.serialize(object.tokenHumanReadablePrecision,
          specifiedType: const FullType(int)),
      'chainId',
      serializers.serialize(object.chainId, specifiedType: const FullType(int)),
      'centralBankPublicKey',
      serializers.serialize(object.centralBankPublicKey,
          specifiedType: const FullType(RSAPublicKey)),
    ];

    return result;
  }

  @override
  Env deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EnvBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'apiGatewayBaseUrl':
          result.apiGatewayBaseUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'apiGatewayConnectTimeout':
          result.apiGatewayConnectTimeout = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'web3RpcGatewayUrl':
          result.web3RpcGatewayUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'didPrefix':
          result.didPrefix = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'tokenName':
          result.tokenName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'tokenSymbol':
          result.tokenSymbol = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'tokenPrecision':
          result.tokenPrecision = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'tokenHumanReadablePrecision':
          result.tokenHumanReadablePrecision = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'chainId':
          result.chainId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'centralBankPublicKey':
          result.centralBankPublicKey = serializers.deserialize(value,
              specifiedType: const FullType(RSAPublicKey)) as RSAPublicKey;
          break;
      }
    }

    return result.build();
  }
}

class _$Env extends Env {
  @override
  final String apiGatewayBaseUrl;
  @override
  final int apiGatewayConnectTimeout;
  @override
  final String web3RpcGatewayUrl;
  @override
  final String didPrefix;
  @override
  final String tokenName;
  @override
  final String tokenSymbol;
  @override
  final int tokenPrecision;
  @override
  final int tokenHumanReadablePrecision;
  @override
  final int chainId;
  @override
  final RSAPublicKey centralBankPublicKey;

  factory _$Env([void Function(EnvBuilder) updates]) =>
      (new EnvBuilder()..update(updates)).build();

  _$Env._(
      {this.apiGatewayBaseUrl,
      this.apiGatewayConnectTimeout,
      this.web3RpcGatewayUrl,
      this.didPrefix,
      this.tokenName,
      this.tokenSymbol,
      this.tokenPrecision,
      this.tokenHumanReadablePrecision,
      this.chainId,
      this.centralBankPublicKey})
      : super._() {
    if (apiGatewayBaseUrl == null) {
      throw new BuiltValueNullFieldError('Env', 'apiGatewayBaseUrl');
    }
    if (apiGatewayConnectTimeout == null) {
      throw new BuiltValueNullFieldError('Env', 'apiGatewayConnectTimeout');
    }
    if (web3RpcGatewayUrl == null) {
      throw new BuiltValueNullFieldError('Env', 'web3RpcGatewayUrl');
    }
    if (didPrefix == null) {
      throw new BuiltValueNullFieldError('Env', 'didPrefix');
    }
    if (tokenName == null) {
      throw new BuiltValueNullFieldError('Env', 'tokenName');
    }
    if (tokenSymbol == null) {
      throw new BuiltValueNullFieldError('Env', 'tokenSymbol');
    }
    if (tokenPrecision == null) {
      throw new BuiltValueNullFieldError('Env', 'tokenPrecision');
    }
    if (tokenHumanReadablePrecision == null) {
      throw new BuiltValueNullFieldError('Env', 'tokenHumanReadablePrecision');
    }
    if (chainId == null) {
      throw new BuiltValueNullFieldError('Env', 'chainId');
    }
    if (centralBankPublicKey == null) {
      throw new BuiltValueNullFieldError('Env', 'centralBankPublicKey');
    }
  }

  @override
  Env rebuild(void Function(EnvBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EnvBuilder toBuilder() => new EnvBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Env &&
        apiGatewayBaseUrl == other.apiGatewayBaseUrl &&
        apiGatewayConnectTimeout == other.apiGatewayConnectTimeout &&
        web3RpcGatewayUrl == other.web3RpcGatewayUrl &&
        didPrefix == other.didPrefix &&
        tokenName == other.tokenName &&
        tokenSymbol == other.tokenSymbol &&
        tokenPrecision == other.tokenPrecision &&
        tokenHumanReadablePrecision == other.tokenHumanReadablePrecision &&
        chainId == other.chainId &&
        centralBankPublicKey == other.centralBankPublicKey;
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
                                    $jc($jc(0, apiGatewayBaseUrl.hashCode),
                                        apiGatewayConnectTimeout.hashCode),
                                    web3RpcGatewayUrl.hashCode),
                                didPrefix.hashCode),
                            tokenName.hashCode),
                        tokenSymbol.hashCode),
                    tokenPrecision.hashCode),
                tokenHumanReadablePrecision.hashCode),
            chainId.hashCode),
        centralBankPublicKey.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Env')
          ..add('apiGatewayBaseUrl', apiGatewayBaseUrl)
          ..add('apiGatewayConnectTimeout', apiGatewayConnectTimeout)
          ..add('web3RpcGatewayUrl', web3RpcGatewayUrl)
          ..add('didPrefix', didPrefix)
          ..add('tokenName', tokenName)
          ..add('tokenSymbol', tokenSymbol)
          ..add('tokenPrecision', tokenPrecision)
          ..add('tokenHumanReadablePrecision', tokenHumanReadablePrecision)
          ..add('chainId', chainId)
          ..add('centralBankPublicKey', centralBankPublicKey))
        .toString();
  }
}

class EnvBuilder implements Builder<Env, EnvBuilder> {
  _$Env _$v;

  String _apiGatewayBaseUrl;
  String get apiGatewayBaseUrl => _$this._apiGatewayBaseUrl;
  set apiGatewayBaseUrl(String apiGatewayBaseUrl) =>
      _$this._apiGatewayBaseUrl = apiGatewayBaseUrl;

  int _apiGatewayConnectTimeout;
  int get apiGatewayConnectTimeout => _$this._apiGatewayConnectTimeout;
  set apiGatewayConnectTimeout(int apiGatewayConnectTimeout) =>
      _$this._apiGatewayConnectTimeout = apiGatewayConnectTimeout;

  String _web3RpcGatewayUrl;
  String get web3RpcGatewayUrl => _$this._web3RpcGatewayUrl;
  set web3RpcGatewayUrl(String web3RpcGatewayUrl) =>
      _$this._web3RpcGatewayUrl = web3RpcGatewayUrl;

  String _didPrefix;
  String get didPrefix => _$this._didPrefix;
  set didPrefix(String didPrefix) => _$this._didPrefix = didPrefix;

  String _tokenName;
  String get tokenName => _$this._tokenName;
  set tokenName(String tokenName) => _$this._tokenName = tokenName;

  String _tokenSymbol;
  String get tokenSymbol => _$this._tokenSymbol;
  set tokenSymbol(String tokenSymbol) => _$this._tokenSymbol = tokenSymbol;

  int _tokenPrecision;
  int get tokenPrecision => _$this._tokenPrecision;
  set tokenPrecision(int tokenPrecision) =>
      _$this._tokenPrecision = tokenPrecision;

  int _tokenHumanReadablePrecision;
  int get tokenHumanReadablePrecision => _$this._tokenHumanReadablePrecision;
  set tokenHumanReadablePrecision(int tokenHumanReadablePrecision) =>
      _$this._tokenHumanReadablePrecision = tokenHumanReadablePrecision;

  int _chainId;
  int get chainId => _$this._chainId;
  set chainId(int chainId) => _$this._chainId = chainId;

  RSAPublicKey _centralBankPublicKey;
  RSAPublicKey get centralBankPublicKey => _$this._centralBankPublicKey;
  set centralBankPublicKey(RSAPublicKey centralBankPublicKey) =>
      _$this._centralBankPublicKey = centralBankPublicKey;

  EnvBuilder();

  EnvBuilder get _$this {
    if (_$v != null) {
      _apiGatewayBaseUrl = _$v.apiGatewayBaseUrl;
      _apiGatewayConnectTimeout = _$v.apiGatewayConnectTimeout;
      _web3RpcGatewayUrl = _$v.web3RpcGatewayUrl;
      _didPrefix = _$v.didPrefix;
      _tokenName = _$v.tokenName;
      _tokenSymbol = _$v.tokenSymbol;
      _tokenPrecision = _$v.tokenPrecision;
      _tokenHumanReadablePrecision = _$v.tokenHumanReadablePrecision;
      _chainId = _$v.chainId;
      _centralBankPublicKey = _$v.centralBankPublicKey;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Env other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Env;
  }

  @override
  void update(void Function(EnvBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Env build() {
    final _$result = _$v ??
        new _$Env._(
            apiGatewayBaseUrl: apiGatewayBaseUrl,
            apiGatewayConnectTimeout: apiGatewayConnectTimeout,
            web3RpcGatewayUrl: web3RpcGatewayUrl,
            didPrefix: didPrefix,
            tokenName: tokenName,
            tokenSymbol: tokenSymbol,
            tokenPrecision: tokenPrecision,
            tokenHumanReadablePrecision: tokenHumanReadablePrecision,
            chainId: chainId,
            centralBankPublicKey: centralBankPublicKey);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
