// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tw_balance.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TwPoint> _$twPointSerializer = new _$TwPointSerializer();
Serializer<TwBalance> _$twBalanceSerializer = new _$TwBalanceSerializer();

class _$TwPointSerializer implements StructuredSerializer<TwPoint> {
  @override
  final Iterable<Type> types = const [TwPoint, _$TwPoint];
  @override
  final String wireName = 'TwPoint';

  @override
  Iterable<Object> serialize(Serializers serializers, TwPoint object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'decimal',
      serializers.serialize(object.decimal, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  TwPoint deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TwPointBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'decimal':
          result.decimal = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$TwBalanceSerializer implements StructuredSerializer<TwBalance> {
  @override
  final Iterable<Type> types = const [TwBalance, _$TwBalance];
  @override
  final String wireName = 'TwBalance';

  @override
  Iterable<Object> serialize(Serializers serializers, TwBalance object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'balance',
      serializers.serialize(object.balance,
          specifiedType: const FullType(String)),
      'twpoint',
      serializers.serialize(object.twPoint,
          specifiedType: const FullType(TwPoint)),
    ];

    return result;
  }

  @override
  TwBalance deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TwBalanceBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'balance':
          result.balance = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'twpoint':
          result.twPoint.replace(serializers.deserialize(value,
              specifiedType: const FullType(TwPoint)) as TwPoint);
          break;
      }
    }

    return result.build();
  }
}

class _$TwPoint extends TwPoint {
  @override
  final int decimal;
  @override
  final String name;

  factory _$TwPoint([void Function(TwPointBuilder) updates]) =>
      (new TwPointBuilder()..update(updates)).build();

  _$TwPoint._({this.decimal, this.name}) : super._() {
    if (decimal == null) {
      throw new BuiltValueNullFieldError('TwPoint', 'decimal');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('TwPoint', 'name');
    }
  }

  @override
  TwPoint rebuild(void Function(TwPointBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TwPointBuilder toBuilder() => new TwPointBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TwPoint && decimal == other.decimal && name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, decimal.hashCode), name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TwPoint')
          ..add('decimal', decimal)
          ..add('name', name))
        .toString();
  }
}

class TwPointBuilder implements Builder<TwPoint, TwPointBuilder> {
  _$TwPoint _$v;

  int _decimal;
  int get decimal => _$this._decimal;
  set decimal(int decimal) => _$this._decimal = decimal;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  TwPointBuilder();

  TwPointBuilder get _$this {
    if (_$v != null) {
      _decimal = _$v.decimal;
      _name = _$v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TwPoint other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TwPoint;
  }

  @override
  void update(void Function(TwPointBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TwPoint build() {
    final _$result = _$v ?? new _$TwPoint._(decimal: decimal, name: name);
    replace(_$result);
    return _$result;
  }
}

class _$TwBalance extends TwBalance {
  @override
  final String balance;
  @override
  final TwPoint twPoint;
  Decimal __realBalance;
  String __humanBalance;

  factory _$TwBalance([void Function(TwBalanceBuilder) updates]) =>
      (new TwBalanceBuilder()..update(updates)).build();

  _$TwBalance._({this.balance, this.twPoint}) : super._() {
    if (balance == null) {
      throw new BuiltValueNullFieldError('TwBalance', 'balance');
    }
    if (twPoint == null) {
      throw new BuiltValueNullFieldError('TwBalance', 'twPoint');
    }
  }

  @override
  Decimal get realBalance => __realBalance ??= super.realBalance;

  @override
  String get humanBalance => __humanBalance ??= super.humanBalance;

  @override
  TwBalance rebuild(void Function(TwBalanceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TwBalanceBuilder toBuilder() => new TwBalanceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TwBalance &&
        balance == other.balance &&
        twPoint == other.twPoint;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, balance.hashCode), twPoint.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TwBalance')
          ..add('balance', balance)
          ..add('twPoint', twPoint))
        .toString();
  }
}

class TwBalanceBuilder implements Builder<TwBalance, TwBalanceBuilder> {
  _$TwBalance _$v;

  String _balance;
  String get balance => _$this._balance;
  set balance(String balance) => _$this._balance = balance;

  TwPointBuilder _twPoint;
  TwPointBuilder get twPoint => _$this._twPoint ??= new TwPointBuilder();
  set twPoint(TwPointBuilder twPoint) => _$this._twPoint = twPoint;

  TwBalanceBuilder();

  TwBalanceBuilder get _$this {
    if (_$v != null) {
      _balance = _$v.balance;
      _twPoint = _$v.twPoint?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TwBalance other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TwBalance;
  }

  @override
  void update(void Function(TwBalanceBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TwBalance build() {
    _$TwBalance _$result;
    try {
      _$result =
          _$v ?? new _$TwBalance._(balance: balance, twPoint: twPoint.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'twPoint';
        twPoint.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'TwBalance', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
