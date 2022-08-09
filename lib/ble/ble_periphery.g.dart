// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ble_periphery.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const BleCentralState _$connected = const BleCentralState._('connected');
const BleCentralState _$disconnected = const BleCentralState._('disconnected');

BleCentralState _$valueOf(String name) {
  switch (name) {
    case 'connected':
      return _$connected;
    case 'disconnected':
      return _$disconnected;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<BleCentralState> _$values =
    new BuiltSet<BleCentralState>(const <BleCentralState>[
  _$connected,
  _$disconnected,
]);

Serializer<BleCentralState> _$bleCentralStateSerializer =
    new _$BleCentralStateSerializer();

class _$BleCentralStateSerializer
    implements PrimitiveSerializer<BleCentralState> {
  @override
  final Iterable<Type> types = const <Type>[BleCentralState];
  @override
  final String wireName = 'BleCentralState';

  @override
  Object serialize(Serializers serializers, BleCentralState object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  BleCentralState deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      BleCentralState.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
