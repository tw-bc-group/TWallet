// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AccountInfo> _$accountInfoSerializer = new _$AccountInfoSerializer();

class _$AccountInfoSerializer implements StructuredSerializer<AccountInfo> {
  @override
  final Iterable<Type> types = const [AccountInfo, _$AccountInfo];
  @override
  final String wireName = 'AccountInfo';

  @override
  Iterable<Object?> serialize(Serializers serializers, AccountInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'index',
      serializers.serialize(object.index, specifiedType: const FullType(int)),
      'pubKey',
      serializers.serialize(object.pubKey,
          specifiedType: const FullType(String)),
      'address',
      serializers.serialize(object.address,
          specifiedType: const FullType(String)),
      'priKey',
      serializers.serialize(object.priKey,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.balance;
    if (value != null) {
      result
        ..add('balance')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Amount)));
    }
    return result;
  }

  @override
  AccountInfo deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AccountInfoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'index':
          result.index = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'pubKey':
          result.pubKey = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'priKey':
          result.priKey = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'balance':
          result.balance = serializers.deserialize(value,
              specifiedType: const FullType(Amount)) as Amount?;
          break;
      }
    }

    return result.build();
  }
}

class _$AccountInfo extends AccountInfo {
  @override
  final int index;
  @override
  final String pubKey;
  @override
  final String address;
  @override
  final String priKey;
  @override
  final Amount? balance;

  factory _$AccountInfo([void Function(AccountInfoBuilder)? updates]) =>
      (new AccountInfoBuilder()..update(updates))._build();

  _$AccountInfo._(
      {required this.index,
      required this.pubKey,
      required this.address,
      required this.priKey,
      this.balance})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(index, r'AccountInfo', 'index');
    BuiltValueNullFieldError.checkNotNull(pubKey, r'AccountInfo', 'pubKey');
    BuiltValueNullFieldError.checkNotNull(address, r'AccountInfo', 'address');
    BuiltValueNullFieldError.checkNotNull(priKey, r'AccountInfo', 'priKey');
  }

  @override
  AccountInfo rebuild(void Function(AccountInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AccountInfoBuilder toBuilder() => new AccountInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AccountInfo &&
        index == other.index &&
        pubKey == other.pubKey &&
        address == other.address &&
        priKey == other.priKey &&
        balance == other.balance;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, index.hashCode), pubKey.hashCode), address.hashCode),
            priKey.hashCode),
        balance.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AccountInfo')
          ..add('index', index)
          ..add('pubKey', pubKey)
          ..add('address', address)
          ..add('priKey', priKey)
          ..add('balance', balance))
        .toString();
  }
}

class AccountInfoBuilder implements Builder<AccountInfo, AccountInfoBuilder> {
  _$AccountInfo? _$v;

  int? _index;
  int? get index => _$this._index;
  set index(int? index) => _$this._index = index;

  String? _pubKey;
  String? get pubKey => _$this._pubKey;
  set pubKey(String? pubKey) => _$this._pubKey = pubKey;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  String? _priKey;
  String? get priKey => _$this._priKey;
  set priKey(String? priKey) => _$this._priKey = priKey;

  Amount? _balance;
  Amount? get balance => _$this._balance;
  set balance(Amount? balance) => _$this._balance = balance;

  AccountInfoBuilder();

  AccountInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _index = $v.index;
      _pubKey = $v.pubKey;
      _address = $v.address;
      _priKey = $v.priKey;
      _balance = $v.balance;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AccountInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AccountInfo;
  }

  @override
  void update(void Function(AccountInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AccountInfo build() => _build();

  _$AccountInfo _build() {
    final _$result = _$v ??
        new _$AccountInfo._(
            index: BuiltValueNullFieldError.checkNotNull(
                index, r'AccountInfo', 'index'),
            pubKey: BuiltValueNullFieldError.checkNotNull(
                pubKey, r'AccountInfo', 'pubKey'),
            address: BuiltValueNullFieldError.checkNotNull(
                address, r'AccountInfo', 'address'),
            priKey: BuiltValueNullFieldError.checkNotNull(
                priKey, r'AccountInfo', 'priKey'),
            balance: balance);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
