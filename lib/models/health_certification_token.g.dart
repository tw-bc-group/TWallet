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
  Iterable<Object> serialize(
      Serializers serializers, HealthCertificationToken object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'token',
      serializers.serialize(object.token,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  HealthCertificationToken deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new HealthCertificationTokenBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'token':
          result.token = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$HealthCertificationToken extends HealthCertificationToken {
  @override
  final String token;
  HealthCertification __healthCertification;

  factory _$HealthCertificationToken(
          [void Function(HealthCertificationTokenBuilder) updates]) =>
      (new HealthCertificationTokenBuilder()..update(updates)).build();

  _$HealthCertificationToken._({this.token}) : super._() {
    if (token == null) {
      throw new BuiltValueNullFieldError('HealthCertificationToken', 'token');
    }
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
  _$HealthCertificationToken _$v;

  String _token;
  String get token => _$this._token;
  set token(String token) => _$this._token = token;

  HealthCertificationTokenBuilder();

  HealthCertificationTokenBuilder get _$this {
    if (_$v != null) {
      _token = _$v.token;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HealthCertificationToken other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$HealthCertificationToken;
  }

  @override
  void update(void Function(HealthCertificationTokenBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$HealthCertificationToken build() {
    final _$result = _$v ?? new _$HealthCertificationToken._(token: token);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
