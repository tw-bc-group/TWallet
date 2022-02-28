// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dcep.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const DcepType _$rmb100 = const DcepType._('rmb100');
const DcepType _$rmb050 = const DcepType._('rmb050');
const DcepType _$rmb010 = const DcepType._('rmb010');
const DcepType _$rmb005 = const DcepType._('rmb005');
const DcepType _$rmb001 = const DcepType._('rmb001');
const DcepType _$rmb000_50 = const DcepType._('rmb000_50');
const DcepType _$rmb000_10 = const DcepType._('rmb000_10');

DcepType _$valueOf(String name) {
  switch (name) {
    case 'rmb100':
      return _$rmb100;
    case 'rmb050':
      return _$rmb050;
    case 'rmb010':
      return _$rmb010;
    case 'rmb005':
      return _$rmb005;
    case 'rmb001':
      return _$rmb001;
    case 'rmb000_50':
      return _$rmb000_50;
    case 'rmb000_10':
      return _$rmb000_10;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<DcepType> _$values = new BuiltSet<DcepType>(const <DcepType>[
  _$rmb100,
  _$rmb050,
  _$rmb010,
  _$rmb005,
  _$rmb001,
  _$rmb000_50,
  _$rmb000_10,
]);

Serializer<DcepType> _$dcepTypeSerializer = new _$DcepTypeSerializer();
Serializer<Dcep> _$dcepSerializer = new _$DcepSerializer();

class _$DcepTypeSerializer implements PrimitiveSerializer<DcepType> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'rmb100': 'RMB100_00',
    'rmb050': 'RMB050_00',
    'rmb010': 'RMB010_00',
    'rmb005': 'RMB005_00',
    'rmb001': 'RMB001_00',
    'rmb000_50': 'RMB000_50',
    'rmb000_10': 'RMB000_10',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'RMB100_00': 'rmb100',
    'RMB050_00': 'rmb050',
    'RMB010_00': 'rmb010',
    'RMB005_00': 'rmb005',
    'RMB001_00': 'rmb001',
    'RMB000_50': 'rmb000_50',
    'RMB000_10': 'rmb000_10',
  };

  @override
  final Iterable<Type> types = const <Type>[DcepType];
  @override
  final String wireName = 'DcepType';

  @override
  Object serialize(Serializers serializers, DcepType object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  DcepType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      DcepType.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$DcepSerializer implements StructuredSerializer<Dcep> {
  @override
  final Iterable<Type> types = const [Dcep, _$Dcep];
  @override
  final String wireName = 'Dcep';

  @override
  Iterable<Object?> serialize(Serializers serializers, Dcep object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'serial_number',
      serializers.serialize(object.sn, specifiedType: const FullType(String)),
      'owner',
      serializers.serialize(object.owner,
          specifiedType: const FullType(String)),
      'signature',
      serializers.serialize(object.signature,
          specifiedType: const FullType(String)),
      'money_type',
      serializers.serialize(object.type,
          specifiedType: const FullType(DcepType)),
    ];

    return result;
  }

  @override
  Dcep deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DcepBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'serial_number':
          result.sn = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'owner':
          result.owner = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'signature':
          result.signature = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'money_type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(DcepType)) as DcepType;
          break;
      }
    }

    return result.build();
  }
}

class _$Dcep extends Dcep {
  @override
  final String sn;
  @override
  final String owner;
  @override
  final String signature;
  @override
  final DcepType type;

  factory _$Dcep([void Function(DcepBuilder)? updates]) =>
      (new DcepBuilder()..update(updates)).build();

  _$Dcep._(
      {required this.sn,
      required this.owner,
      required this.signature,
      required this.type})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(sn, 'Dcep', 'sn');
    BuiltValueNullFieldError.checkNotNull(owner, 'Dcep', 'owner');
    BuiltValueNullFieldError.checkNotNull(signature, 'Dcep', 'signature');
    BuiltValueNullFieldError.checkNotNull(type, 'Dcep', 'type');
  }

  @override
  Dcep rebuild(void Function(DcepBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DcepBuilder toBuilder() => new DcepBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Dcep &&
        sn == other.sn &&
        owner == other.owner &&
        signature == other.signature &&
        type == other.type;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, sn.hashCode), owner.hashCode), signature.hashCode),
        type.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Dcep')
          ..add('sn', sn)
          ..add('owner', owner)
          ..add('signature', signature)
          ..add('type', type))
        .toString();
  }
}

class DcepBuilder implements Builder<Dcep, DcepBuilder> {
  _$Dcep? _$v;

  String? _sn;
  String? get sn => _$this._sn;
  set sn(String? sn) => _$this._sn = sn;

  String? _owner;
  String? get owner => _$this._owner;
  set owner(String? owner) => _$this._owner = owner;

  String? _signature;
  String? get signature => _$this._signature;
  set signature(String? signature) => _$this._signature = signature;

  DcepType? _type;
  DcepType? get type => _$this._type;
  set type(DcepType? type) => _$this._type = type;

  DcepBuilder();

  DcepBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _sn = $v.sn;
      _owner = $v.owner;
      _signature = $v.signature;
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Dcep other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Dcep;
  }

  @override
  void update(void Function(DcepBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Dcep build() {
    final _$result = _$v ??
        new _$Dcep._(
            sn: BuiltValueNullFieldError.checkNotNull(sn, 'Dcep', 'sn'),
            owner:
                BuiltValueNullFieldError.checkNotNull(owner, 'Dcep', 'owner'),
            signature: BuiltValueNullFieldError.checkNotNull(
                signature, 'Dcep', 'signature'),
            type: BuiltValueNullFieldError.checkNotNull(type, 'Dcep', 'type'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
