// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verifiable_credential.dart';

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

VerifiableCredentialTokenResponse _$VerifiableCredentialTokenResponseFromJson(
        Map<String, dynamic> json) =>
    VerifiableCredentialTokenResponse(
      token: json['token'] as String,
    );

Map<String, dynamic> _$VerifiableCredentialTokenResponseToJson(
        VerifiableCredentialTokenResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
    };
