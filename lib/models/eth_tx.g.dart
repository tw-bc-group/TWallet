// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eth_tx.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EthTxInfo> _$ethTxInfoSerializer = new _$EthTxInfoSerializer();

class _$EthTxInfoSerializer implements StructuredSerializer<EthTxInfo> {
  @override
  final Iterable<Type> types = const [EthTxInfo, _$EthTxInfo];
  @override
  final String wireName = 'EthTxInfo';

  @override
  Iterable<Object> serialize(Serializers serializers, EthTxInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'nonce',
      serializers.serialize(object.nonce,
          specifiedType: const FullType(BigInt)),
      'gasPrice',
      serializers.serialize(object.gasPrice,
          specifiedType: const FullType(BigInt)),
      'gasLimit',
      serializers.serialize(object.gasLimit,
          specifiedType: const FullType(BigInt)),
      'to',
      serializers.serialize(object.to, specifiedType: const FullType(String)),
      'value',
      serializers.serialize(object.value,
          specifiedType: const FullType(BigInt)),
      'data',
      serializers.serialize(object.data,
          specifiedType: const FullType(Uint8List)),
      'v',
      serializers.serialize(object.v, specifiedType: const FullType(BigInt)),
      'r',
      serializers.serialize(object.r, specifiedType: const FullType(BigInt)),
      's',
      serializers.serialize(object.s, specifiedType: const FullType(BigInt)),
    ];

    return result;
  }

  @override
  EthTxInfo deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EthTxInfoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'nonce':
          result.nonce = serializers.deserialize(value,
              specifiedType: const FullType(BigInt)) as BigInt;
          break;
        case 'gasPrice':
          result.gasPrice = serializers.deserialize(value,
              specifiedType: const FullType(BigInt)) as BigInt;
          break;
        case 'gasLimit':
          result.gasLimit = serializers.deserialize(value,
              specifiedType: const FullType(BigInt)) as BigInt;
          break;
        case 'to':
          result.to = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'value':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(BigInt)) as BigInt;
          break;
        case 'data':
          result.data = serializers.deserialize(value,
              specifiedType: const FullType(Uint8List)) as Uint8List;
          break;
        case 'v':
          result.v = serializers.deserialize(value,
              specifiedType: const FullType(BigInt)) as BigInt;
          break;
        case 'r':
          result.r = serializers.deserialize(value,
              specifiedType: const FullType(BigInt)) as BigInt;
          break;
        case 's':
          result.s = serializers.deserialize(value,
              specifiedType: const FullType(BigInt)) as BigInt;
          break;
      }
    }

    return result.build();
  }
}

class _$EthTxInfo extends EthTxInfo {
  @override
  final BigInt nonce;
  @override
  final BigInt gasPrice;
  @override
  final BigInt gasLimit;
  @override
  final String to;
  @override
  final BigInt value;
  @override
  final Uint8List data;
  @override
  final BigInt v;
  @override
  final BigInt r;
  @override
  final BigInt s;

  factory _$EthTxInfo([void Function(EthTxInfoBuilder) updates]) =>
      (new EthTxInfoBuilder()..update(updates)).build();

  _$EthTxInfo._(
      {this.nonce,
      this.gasPrice,
      this.gasLimit,
      this.to,
      this.value,
      this.data,
      this.v,
      this.r,
      this.s})
      : super._() {
    if (nonce == null) {
      throw new BuiltValueNullFieldError('EthTxInfo', 'nonce');
    }
    if (gasPrice == null) {
      throw new BuiltValueNullFieldError('EthTxInfo', 'gasPrice');
    }
    if (gasLimit == null) {
      throw new BuiltValueNullFieldError('EthTxInfo', 'gasLimit');
    }
    if (to == null) {
      throw new BuiltValueNullFieldError('EthTxInfo', 'to');
    }
    if (value == null) {
      throw new BuiltValueNullFieldError('EthTxInfo', 'value');
    }
    if (data == null) {
      throw new BuiltValueNullFieldError('EthTxInfo', 'data');
    }
    if (v == null) {
      throw new BuiltValueNullFieldError('EthTxInfo', 'v');
    }
    if (r == null) {
      throw new BuiltValueNullFieldError('EthTxInfo', 'r');
    }
    if (s == null) {
      throw new BuiltValueNullFieldError('EthTxInfo', 's');
    }
  }

  @override
  EthTxInfo rebuild(void Function(EthTxInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EthTxInfoBuilder toBuilder() => new EthTxInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EthTxInfo &&
        nonce == other.nonce &&
        gasPrice == other.gasPrice &&
        gasLimit == other.gasLimit &&
        to == other.to &&
        value == other.value &&
        data == other.data &&
        v == other.v &&
        r == other.r &&
        s == other.s;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, nonce.hashCode), gasPrice.hashCode),
                                gasLimit.hashCode),
                            to.hashCode),
                        value.hashCode),
                    data.hashCode),
                v.hashCode),
            r.hashCode),
        s.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('EthTxInfo')
          ..add('nonce', nonce)
          ..add('gasPrice', gasPrice)
          ..add('gasLimit', gasLimit)
          ..add('to', to)
          ..add('value', value)
          ..add('data', data)
          ..add('v', v)
          ..add('r', r)
          ..add('s', s))
        .toString();
  }
}

class EthTxInfoBuilder implements Builder<EthTxInfo, EthTxInfoBuilder> {
  _$EthTxInfo _$v;

  BigInt _nonce;
  BigInt get nonce => _$this._nonce;
  set nonce(BigInt nonce) => _$this._nonce = nonce;

  BigInt _gasPrice;
  BigInt get gasPrice => _$this._gasPrice;
  set gasPrice(BigInt gasPrice) => _$this._gasPrice = gasPrice;

  BigInt _gasLimit;
  BigInt get gasLimit => _$this._gasLimit;
  set gasLimit(BigInt gasLimit) => _$this._gasLimit = gasLimit;

  String _to;
  String get to => _$this._to;
  set to(String to) => _$this._to = to;

  BigInt _value;
  BigInt get value => _$this._value;
  set value(BigInt value) => _$this._value = value;

  Uint8List _data;
  Uint8List get data => _$this._data;
  set data(Uint8List data) => _$this._data = data;

  BigInt _v;
  BigInt get v => _$this._v;
  set v(BigInt v) => _$this._v = v;

  BigInt _r;
  BigInt get r => _$this._r;
  set r(BigInt r) => _$this._r = r;

  BigInt _s;
  BigInt get s => _$this._s;
  set s(BigInt s) => _$this._s = s;

  EthTxInfoBuilder();

  EthTxInfoBuilder get _$this {
    if (_$v != null) {
      _nonce = _$v.nonce;
      _gasPrice = _$v.gasPrice;
      _gasLimit = _$v.gasLimit;
      _to = _$v.to;
      _value = _$v.value;
      _data = _$v.data;
      _v = _$v.v;
      _r = _$v.r;
      _s = _$v.s;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EthTxInfo other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$EthTxInfo;
  }

  @override
  void update(void Function(EthTxInfoBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$EthTxInfo build() {
    final _$result = _$v ??
        new _$EthTxInfo._(
            nonce: nonce,
            gasPrice: gasPrice,
            gasLimit: gasLimit,
            to: to,
            value: value,
            data: data,
            v: v,
            r: r,
            s: s);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
