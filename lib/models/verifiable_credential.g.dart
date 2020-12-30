// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verifiable_credential.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifiableCredentialPresentationRequest
    _$VerifiableCredentialPresentationRequestFromJson(
        Map<String, dynamic> json) {
  return VerifiableCredentialPresentationRequest(
    id: json['id'] as int,
    name: json['name'] as String,
    vcTypes: (json['vcTypes'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$VerifiableCredentialPresentationRequestToJson(
        VerifiableCredentialPresentationRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'vcTypes': instance.vcTypes,
    };
