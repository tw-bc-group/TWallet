// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return Transaction(
    json['hash'] as String,
    json['create_time'] == null
        ? null
        : DateTime.parse(json['create_time'] as String),
    json['confirm_time'] == null
        ? null
        : DateTime.parse(json['confirm_time'] as String),
    json['from_address'] as String,
    json['from_address_name'] as String,
    json['to_address'] as String,
    json['to_address_name'] as String,
  )
    ..txType = const _TypeConverter().fromJson(json['tx_type'] as String)
    ..amount = const _DecimalConverter().fromJson(json['amount']);
}

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'hash': instance.hash,
      'tx_type': const _TypeConverter().toJson(instance.txType),
      'amount': const _DecimalConverter().toJson(instance.amount),
      'create_time': instance.createTime?.toIso8601String(),
      'confirm_time': instance.confirmTime?.toIso8601String(),
      'from_address': instance.fromAddress,
      'from_address_name': instance.fromAddressName,
      'to_address': instance.toAddress,
      'to_address_name': instance.toAddressName,
    };
