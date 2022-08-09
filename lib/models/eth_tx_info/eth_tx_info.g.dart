// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eth_tx_info.dart';

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
  Iterable<Object?> serialize(Serializers serializers, EthTxInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
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
      serializers.serialize(object.v, specifiedType: const FullType(int)),
      'r',
      serializers.serialize(object.r, specifiedType: const FullType(BigInt)),
      's',
      serializers.serialize(object.s, specifiedType: const FullType(BigInt)),
    ];

    return result;
  }

  @override
  EthTxInfo deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EthTxInfoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'nonce':
          result.nonce = serializers.deserialize(value,
              specifiedType: const FullType(BigInt))! as BigInt;
          break;
        case 'gasPrice':
          result.gasPrice = serializers.deserialize(value,
              specifiedType: const FullType(BigInt))! as BigInt;
          break;
        case 'gasLimit':
          result.gasLimit = serializers.deserialize(value,
              specifiedType: const FullType(BigInt))! as BigInt;
          break;
        case 'to':
          result.to = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'value':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(BigInt))! as BigInt;
          break;
        case 'data':
          result.data = serializers.deserialize(value,
              specifiedType: const FullType(Uint8List))! as Uint8List;
          break;
        case 'v':
          result.v = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'r':
          result.r = serializers.deserialize(value,
              specifiedType: const FullType(BigInt))! as BigInt;
          break;
        case 's':
          result.s = serializers.deserialize(value,
              specifiedType: const FullType(BigInt))! as BigInt;
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
  final int v;
  @override
  final BigInt r;
  @override
  final BigInt s;

  factory _$EthTxInfo([void Function(EthTxInfoBuilder)? updates]) =>
      (new EthTxInfoBuilder()..update(updates))._build();

  _$EthTxInfo._(
      {required this.nonce,
      required this.gasPrice,
      required this.gasLimit,
      required this.to,
      required this.value,
      required this.data,
      required this.v,
      required this.r,
      required this.s})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(nonce, r'EthTxInfo', 'nonce');
    BuiltValueNullFieldError.checkNotNull(gasPrice, r'EthTxInfo', 'gasPrice');
    BuiltValueNullFieldError.checkNotNull(gasLimit, r'EthTxInfo', 'gasLimit');
    BuiltValueNullFieldError.checkNotNull(to, r'EthTxInfo', 'to');
    BuiltValueNullFieldError.checkNotNull(value, r'EthTxInfo', 'value');
    BuiltValueNullFieldError.checkNotNull(data, r'EthTxInfo', 'data');
    BuiltValueNullFieldError.checkNotNull(v, r'EthTxInfo', 'v');
    BuiltValueNullFieldError.checkNotNull(r, r'EthTxInfo', 'r');
    BuiltValueNullFieldError.checkNotNull(s, r'EthTxInfo', 's');
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
    return (newBuiltValueToStringHelper(r'EthTxInfo')
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
  _$EthTxInfo? _$v;

  BigInt? _nonce;
  BigInt? get nonce => _$this._nonce;
  set nonce(BigInt? nonce) => _$this._nonce = nonce;

  BigInt? _gasPrice;
  BigInt? get gasPrice => _$this._gasPrice;
  set gasPrice(BigInt? gasPrice) => _$this._gasPrice = gasPrice;

  BigInt? _gasLimit;
  BigInt? get gasLimit => _$this._gasLimit;
  set gasLimit(BigInt? gasLimit) => _$this._gasLimit = gasLimit;

  String? _to;
  String? get to => _$this._to;
  set to(String? to) => _$this._to = to;

  BigInt? _value;
  BigInt? get value => _$this._value;
  set value(BigInt? value) => _$this._value = value;

  Uint8List? _data;
  Uint8List? get data => _$this._data;
  set data(Uint8List? data) => _$this._data = data;

  int? _v;
  int? get v => _$this._v;
  set v(int? v) => _$this._v = v;

  BigInt? _r;
  BigInt? get r => _$this._r;
  set r(BigInt? r) => _$this._r = r;

  BigInt? _s;
  BigInt? get s => _$this._s;
  set s(BigInt? s) => _$this._s = s;

  EthTxInfoBuilder();

  EthTxInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _nonce = $v.nonce;
      _gasPrice = $v.gasPrice;
      _gasLimit = $v.gasLimit;
      _to = $v.to;
      _value = $v.value;
      _data = $v.data;
      _v = $v.v;
      _r = $v.r;
      _s = $v.s;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EthTxInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EthTxInfo;
  }

  @override
  void update(void Function(EthTxInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EthTxInfo build() => _build();

  _$EthTxInfo _build() {
    final _$result = _$v ??
        new _$EthTxInfo._(
            nonce: BuiltValueNullFieldError.checkNotNull(
                nonce, r'EthTxInfo', 'nonce'),
            gasPrice: BuiltValueNullFieldError.checkNotNull(
                gasPrice, r'EthTxInfo', 'gasPrice'),
            gasLimit: BuiltValueNullFieldError.checkNotNull(
                gasLimit, r'EthTxInfo', 'gasLimit'),
            to: BuiltValueNullFieldError.checkNotNull(to, r'EthTxInfo', 'to'),
            value: BuiltValueNullFieldError.checkNotNull(
                value, r'EthTxInfo', 'value'),
            data: BuiltValueNullFieldError.checkNotNull(
                data, r'EthTxInfo', 'data'),
            v: BuiltValueNullFieldError.checkNotNull(v, r'EthTxInfo', 'v'),
            r: BuiltValueNullFieldError.checkNotNull(r, r'EthTxInfo', 'r'),
            s: BuiltValueNullFieldError.checkNotNull(s, r'EthTxInfo', 's'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
