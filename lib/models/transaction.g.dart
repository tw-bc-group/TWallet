// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return Transaction(
    json['hash'] as String,
    json['txType'] as String,
    json['createTime'] == null
        ? null
        : DateTime.parse(json['createTime'] as String),
    json['confirmTime'] == null
        ? null
        : DateTime.parse(json['confirmTime'] as String),
    json['fromAddress'] as String,
    json['fromAddressName'] as String,
    json['toAddress'] as String,
    json['toAddressName'] as String,
  )..amount = const _DecimalConverter().fromJson(json['amount']);
}

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'hash': instance.hash,
      'txType': instance.txType,
      'amount': const _DecimalConverter().toJson(instance.amount),
      'createTime': instance.createTime?.toIso8601String(),
      'confirmTime': instance.confirmTime?.toIso8601String(),
      'fromAddress': instance.fromAddress,
      'fromAddressName': instance.fromAddressName,
      'toAddress': instance.toAddress,
      'toAddressName': instance.toAddressName,
    };
