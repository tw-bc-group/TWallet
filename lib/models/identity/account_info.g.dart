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
  Iterable<Object> serialize(Serializers serializers, AccountInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'index',
      serializers.serialize(object.index, specifiedType: const FullType(int)),
      'pubKey',
      serializers.serialize(object.pubKey,
          specifiedType: const FullType(String)),
      'priKey',
      serializers.serialize(object.priKey,
          specifiedType: const FullType(String)),
    ];
    if (object.balance != null) {
      result
        ..add('balance')
        ..add(serializers.serialize(object.balance,
            specifiedType: const FullType(Amount)));
    }
    return result;
  }

  @override
  AccountInfo deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AccountInfoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'index':
          result.index = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'pubKey':
          result.pubKey = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'priKey':
          result.priKey = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'balance':
          result.balance = serializers.deserialize(value,
              specifiedType: const FullType(Amount)) as Amount;
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
  final String priKey;
  @override
  final Amount balance;

  factory _$AccountInfo([void Function(AccountInfoBuilder) updates]) =>
      (new AccountInfoBuilder()..update(updates)).build();

  _$AccountInfo._({this.index, this.pubKey, this.priKey, this.balance})
      : super._() {
    if (index == null) {
      throw new BuiltValueNullFieldError('AccountInfo', 'index');
    }
    if (pubKey == null) {
      throw new BuiltValueNullFieldError('AccountInfo', 'pubKey');
    }
    if (priKey == null) {
      throw new BuiltValueNullFieldError('AccountInfo', 'priKey');
    }
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
        priKey == other.priKey &&
        balance == other.balance;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, index.hashCode), pubKey.hashCode), priKey.hashCode),
        balance.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AccountInfo')
          ..add('index', index)
          ..add('pubKey', pubKey)
          ..add('priKey', priKey)
          ..add('balance', balance))
        .toString();
  }
}

class AccountInfoBuilder implements Builder<AccountInfo, AccountInfoBuilder> {
  _$AccountInfo _$v;

  int _index;
  int get index => _$this._index;
  set index(int index) => _$this._index = index;

  String _pubKey;
  String get pubKey => _$this._pubKey;
  set pubKey(String pubKey) => _$this._pubKey = pubKey;

  String _priKey;
  String get priKey => _$this._priKey;
  set priKey(String priKey) => _$this._priKey = priKey;

  Amount _balance;
  Amount get balance => _$this._balance;
  set balance(Amount balance) => _$this._balance = balance;

  AccountInfoBuilder();

  AccountInfoBuilder get _$this {
    if (_$v != null) {
      _index = _$v.index;
      _pubKey = _$v.pubKey;
      _priKey = _$v.priKey;
      _balance = _$v.balance;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AccountInfo other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AccountInfo;
  }

  @override
  void update(void Function(AccountInfoBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AccountInfo build() {
    final _$result = _$v ??
        new _$AccountInfo._(
            index: index, pubKey: pubKey, priKey: priKey, balance: balance);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
