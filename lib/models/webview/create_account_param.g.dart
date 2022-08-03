// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_account_param.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CreateAccountParam> _$createAccountParamSerializer =
    new _$CreateAccountParamSerializer();

class _$CreateAccountParamSerializer
    implements StructuredSerializer<CreateAccountParam> {
  @override
  final Iterable<Type> types = const [CreateAccountParam, _$CreateAccountParam];
  @override
  final String wireName = 'CreateAccountParam';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, CreateAccountParam object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.extra;
    if (value != null) {
      result
        ..add('extra')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  CreateAccountParam deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CreateAccountParamBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'extra':
          result.extra = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$CreateAccountParam extends CreateAccountParam {
  @override
  final String? extra;

  factory _$CreateAccountParam(
          [void Function(CreateAccountParamBuilder)? updates]) =>
      (new CreateAccountParamBuilder()..update(updates))._build();

  _$CreateAccountParam._({this.extra}) : super._();

  @override
  CreateAccountParam rebuild(
          void Function(CreateAccountParamBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateAccountParamBuilder toBuilder() =>
      new CreateAccountParamBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateAccountParam && extra == other.extra;
  }

  @override
  int get hashCode {
    return $jf($jc(0, extra.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateAccountParam')
          ..add('extra', extra))
        .toString();
  }
}

class CreateAccountParamBuilder
    implements Builder<CreateAccountParam, CreateAccountParamBuilder> {
  _$CreateAccountParam? _$v;

  String? _extra;
  String? get extra => _$this._extra;
  set extra(String? extra) => _$this._extra = extra;

  CreateAccountParamBuilder() {
    CreateAccountParam._initializeBuilder(this);
  }

  CreateAccountParamBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _extra = $v.extra;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateAccountParam other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateAccountParam;
  }

  @override
  void update(void Function(CreateAccountParamBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateAccountParam build() => _build();

  _$CreateAccountParam _build() {
    final _$result = _$v ?? new _$CreateAccountParam._(extra: extra);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
