// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verifiable_credential.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<VerifiableCredentialTokenResponse>
    _$verifiableCredentialTokenResponseSerializer =
    new _$VerifiableCredentialTokenResponseSerializer();

class _$VerifiableCredentialTokenResponseSerializer
    implements StructuredSerializer<VerifiableCredentialTokenResponse> {
  @override
  final Iterable<Type> types = const [
    VerifiableCredentialTokenResponse,
    _$VerifiableCredentialTokenResponse
  ];
  @override
  final String wireName = 'VerifiableCredentialTokenResponse';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, VerifiableCredentialTokenResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'token',
      serializers.serialize(object.token,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  VerifiableCredentialTokenResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VerifiableCredentialTokenResponseBuilder();

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

class _$VerifiableCredentialTokenResponse
    extends VerifiableCredentialTokenResponse {
  @override
  final String token;

  factory _$VerifiableCredentialTokenResponse(
          [void Function(VerifiableCredentialTokenResponseBuilder)? updates]) =>
      (new VerifiableCredentialTokenResponseBuilder()..update(updates))
          ._build();

  _$VerifiableCredentialTokenResponse._({required this.token}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        token, r'VerifiableCredentialTokenResponse', 'token');
  }

  @override
  VerifiableCredentialTokenResponse rebuild(
          void Function(VerifiableCredentialTokenResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VerifiableCredentialTokenResponseBuilder toBuilder() =>
      new VerifiableCredentialTokenResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VerifiableCredentialTokenResponse && token == other.token;
  }

  @override
  int get hashCode {
    return $jf($jc(0, token.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VerifiableCredentialTokenResponse')
          ..add('token', token))
        .toString();
  }
}

class VerifiableCredentialTokenResponseBuilder
    implements
        Builder<VerifiableCredentialTokenResponse,
            VerifiableCredentialTokenResponseBuilder> {
  _$VerifiableCredentialTokenResponse? _$v;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  VerifiableCredentialTokenResponseBuilder();

  VerifiableCredentialTokenResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _token = $v.token;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VerifiableCredentialTokenResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$VerifiableCredentialTokenResponse;
  }

  @override
  void update(
      void Function(VerifiableCredentialTokenResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VerifiableCredentialTokenResponse build() => _build();

  _$VerifiableCredentialTokenResponse _build() {
    final _$result = _$v ??
        new _$VerifiableCredentialTokenResponse._(
            token: BuiltValueNullFieldError.checkNotNull(
                token, r'VerifiableCredentialTokenResponse', 'token'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifiableCredentialPresentationRequest
    _$VerifiableCredentialPresentationRequestFromJson(
            Map<String, dynamic> json) =>
        VerifiableCredentialPresentationRequest(
          id: json['id'] as String,
          name: json['name'] as String,
          vcTypes: (json['vc_types'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
        );

Map<String, dynamic> _$VerifiableCredentialPresentationRequestToJson(
        VerifiableCredentialPresentationRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'vc_types': instance.vcTypes,
    };
