// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Identity _$IdentityFromJson(Map<String, dynamic> json) {
  return Identity(
    name: json['name'] as String,
    priKey: json['priKey'] as String,
    pubKey: json['pubKey'] as String,
    address: json['address'] as String,
  );
}

Map<String, dynamic> _$IdentityToJson(Identity instance) => <String, dynamic>{
      'name': instance.name,
      'priKey': instance.priKey,
      'pubKey': instance.pubKey,
      'address': instance.address,
    };
