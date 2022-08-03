// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issuer_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<IssuerResponse> _$issuerResponseSerializer =
    new _$IssuerResponseSerializer();

class _$IssuerResponseSerializer
    implements StructuredSerializer<IssuerResponse> {
  @override
  final Iterable<Type> types = const [IssuerResponse, _$IssuerResponse];
  @override
  final String wireName = 'IssuerResponse';

  @override
  Iterable<Object?> serialize(Serializers serializers, IssuerResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'vc_types',
      serializers.serialize(object.vcTypes,
          specifiedType:
              const FullType(BuiltList, const [const FullType(VcType)])),
    ];

    return result;
  }

  @override
  IssuerResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new IssuerResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'vc_types':
          result.vcTypes.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(VcType)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$IssuerResponse extends IssuerResponse {
  @override
  final int id;
  @override
  final String name;
  @override
  final BuiltList<VcType> vcTypes;

  factory _$IssuerResponse([void Function(IssuerResponseBuilder)? updates]) =>
      (new IssuerResponseBuilder()..update(updates))._build();

  _$IssuerResponse._(
      {required this.id, required this.name, required this.vcTypes})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'IssuerResponse', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'IssuerResponse', 'name');
    BuiltValueNullFieldError.checkNotNull(
        vcTypes, r'IssuerResponse', 'vcTypes');
  }

  @override
  IssuerResponse rebuild(void Function(IssuerResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IssuerResponseBuilder toBuilder() =>
      new IssuerResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is IssuerResponse &&
        id == other.id &&
        name == other.name &&
        vcTypes == other.vcTypes;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, id.hashCode), name.hashCode), vcTypes.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'IssuerResponse')
          ..add('id', id)
          ..add('name', name)
          ..add('vcTypes', vcTypes))
        .toString();
  }
}

class IssuerResponseBuilder
    implements Builder<IssuerResponse, IssuerResponseBuilder> {
  _$IssuerResponse? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ListBuilder<VcType>? _vcTypes;
  ListBuilder<VcType> get vcTypes =>
      _$this._vcTypes ??= new ListBuilder<VcType>();
  set vcTypes(ListBuilder<VcType>? vcTypes) => _$this._vcTypes = vcTypes;

  IssuerResponseBuilder();

  IssuerResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _vcTypes = $v.vcTypes.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(IssuerResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$IssuerResponse;
  }

  @override
  void update(void Function(IssuerResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  IssuerResponse build() => _build();

  _$IssuerResponse _build() {
    _$IssuerResponse _$result;
    try {
      _$result = _$v ??
          new _$IssuerResponse._(
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'IssuerResponse', 'id'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'IssuerResponse', 'name'),
              vcTypes: vcTypes.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vcTypes';
        vcTypes.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'IssuerResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
