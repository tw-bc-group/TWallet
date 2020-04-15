// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Identity _$IdentityFromJson(Map<String, dynamic> json) {
  return Identity(
    id: json['id'] as String,
    name: json['name'] as String,
    pubKey: json['pubKey'] as String,
    priKey: json['priKey'] as String,
    phone: json['phone'] as String,
    email: json['email'] as String,
    birthday: json['birthday'] == null
        ? null
        : DateTime.parse(json['birthday'] as String),
  );
}

Map<String, dynamic> _$IdentityToJson(Identity instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'pubKey': instance.pubKey,
      'priKey': instance.priKey,
      'phone': instance.phone,
      'email': instance.email,
      'birthday': instance.birthday?.toIso8601String(),
    };
