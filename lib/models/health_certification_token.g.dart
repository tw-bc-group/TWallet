// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_certification_token.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<HealthCertificationToken> _$healthCertificationTokenSerializer =
    new _$HealthCertificationTokenSerializer();

class _$HealthCertificationTokenSerializer
    implements StructuredSerializer<HealthCertificationToken> {
  @override
  final Iterable<Type> types = const [
    HealthCertificationToken,
    _$HealthCertificationToken
  ];
  @override
  final String wireName = 'HealthCertificationToken';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, HealthCertificationToken object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'token',
      serializers.serialize(object.token,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  HealthCertificationToken deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new HealthCertificationTokenBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'token':
          result.token = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$HealthCertificationToken extends HealthCertificationToken {
  @override
  final String token;
  HealthCertification? __healthCertification;

  factory _$HealthCertificationToken(
          [void Function(HealthCertificationTokenBuilder)? updates]) =>
      (new HealthCertificationTokenBuilder()..update(updates))._build();

  _$HealthCertificationToken._({required this.token}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        token, r'HealthCertificationToken', 'token');
  }

  @override
  HealthCertification get healthCertification =>
      __healthCertification ??= super.healthCertification;

  @override
  HealthCertificationToken rebuild(
          void Function(HealthCertificationTokenBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HealthCertificationTokenBuilder toBuilder() =>
      new HealthCertificationTokenBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HealthCertificationToken && token == other.token;
  }

  @override
  int get hashCode {
    return $jf($jc(0, token.hashCode));
  }
}

class HealthCertificationTokenBuilder
    implements
        Builder<HealthCertificationToken, HealthCertificationTokenBuilder> {
  _$HealthCertificationToken? _$v;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  HealthCertificationTokenBuilder();

  HealthCertificationTokenBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _token = $v.token;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HealthCertificationToken other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$HealthCertificationToken;
  }

  @override
  void update(void Function(HealthCertificationTokenBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  HealthCertificationToken build() => _build();

  _$HealthCertificationToken _build() {
    final _$result = _$v ??
        new _$HealthCertificationToken._(
            token: BuiltValueNullFieldError.checkNotNull(
                token, r'HealthCertificationToken', 'token'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
