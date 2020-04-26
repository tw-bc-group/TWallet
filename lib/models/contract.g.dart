// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Contract> _$contractSerializer = new _$ContractSerializer();

class _$ContractSerializer implements StructuredSerializer<Contract> {
  @override
  final Iterable<Type> types = const [Contract, _$Contract];
  @override
  final String wireName = 'Contract';

  @override
  Iterable<Object> serialize(Serializers serializers, Contract object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'address',
      serializers.serialize(object.address,
          specifiedType: const FullType(String)),
      'abi',
      serializers.serialize(object.abi, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Contract deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ContractBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'abi':
          result.abi = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Contract extends Contract {
  @override
  final String name;
  @override
  final String address;
  @override
  final String abi;

  factory _$Contract([void Function(ContractBuilder) updates]) =>
      (new ContractBuilder()..update(updates)).build();

  _$Contract._({this.name, this.address, this.abi}) : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('Contract', 'name');
    }
    if (address == null) {
      throw new BuiltValueNullFieldError('Contract', 'address');
    }
    if (abi == null) {
      throw new BuiltValueNullFieldError('Contract', 'abi');
    }
  }

  @override
  Contract rebuild(void Function(ContractBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ContractBuilder toBuilder() => new ContractBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Contract &&
        name == other.name &&
        address == other.address &&
        abi == other.abi;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, name.hashCode), address.hashCode), abi.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Contract')
          ..add('name', name)
          ..add('address', address)
          ..add('abi', abi))
        .toString();
  }
}

class ContractBuilder implements Builder<Contract, ContractBuilder> {
  _$Contract _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _address;
  String get address => _$this._address;
  set address(String address) => _$this._address = address;

  String _abi;
  String get abi => _$this._abi;
  set abi(String abi) => _$this._abi = abi;

  ContractBuilder();

  ContractBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _address = _$v.address;
      _abi = _$v.abi;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Contract other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Contract;
  }

  @override
  void update(void Function(ContractBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Contract build() {
    final _$result =
        _$v ?? new _$Contract._(name: name, address: address, abi: abi);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
