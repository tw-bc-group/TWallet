// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tw_balance.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TwBalance> _$twBalanceSerializer = new _$TwBalanceSerializer();

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
      serializers.serialize(object.amount,
          specifiedType: const FullType(Amount)),
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
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(Amount)) as Amount;
          break;
      }
    }

    return result.build();
  }
}

class _$TwBalance extends TwBalance {
  @override
  final Amount amount;
  Decimal __original;
  String __humanReadable;

  factory _$TwBalance([void Function(TwBalanceBuilder) updates]) =>
      (new TwBalanceBuilder()..update(updates)).build();

  _$TwBalance._({this.amount}) : super._() {
    if (amount == null) {
      throw new BuiltValueNullFieldError('TwBalance', 'amount');
    }
  }

  @override
  Decimal get original => __original ??= super.original;

  @override
  String get humanReadable => __humanReadable ??= super.humanReadable;

  @override
  TwBalance rebuild(void Function(TwBalanceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TwBalanceBuilder toBuilder() => new TwBalanceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TwBalance && amount == other.amount;
  }

  @override
  int get hashCode {
    return $jf($jc(0, amount.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TwBalance')..add('amount', amount))
        .toString();
  }
}

class TwBalanceBuilder implements Builder<TwBalance, TwBalanceBuilder> {
  _$TwBalance _$v;

  Amount _amount;
  Amount get amount => _$this._amount;
  set amount(Amount amount) => _$this._amount = amount;

  TwBalanceBuilder();

  TwBalanceBuilder get _$this {
    if (_$v != null) {
      _amount = _$v.amount;
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
    final _$result = _$v ?? new _$TwBalance._(amount: amount);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
