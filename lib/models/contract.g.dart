// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContractModel _$ContractModelFromJson(Map<String, dynamic> json) {
  return ContractModel(
    json['name'] as String,
    json['address'] as String,
    json['abi'] as String,
  );
}

Map<String, dynamic> _$ContractModelToJson(ContractModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'abi': instance.abi,
    };
