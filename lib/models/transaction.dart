import 'package:decimal/decimal.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tw_wallet_ui/models/amount.dart';
import 'package:tw_wallet_ui/models/tx_status.dart';

part 'transaction.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Transaction {
  final String hash;

  @_TypeConverter()
  TxStatus txType;

  @_DecimalConverter()
  Decimal amount;

  final DateTime createTime;
  final DateTime confirmTime;
  final String fromAddress;
  final String fromAddressName;
  final String toAddress;
  final String toAddressName;

  Transaction(this.hash, this.createTime, this.confirmTime, this.fromAddress,
      this.fromAddressName, this.toAddress, this.toAddressName);

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
}

class _TypeConverter implements JsonConverter<TxStatus, String> {
  const _TypeConverter();

  // note: all records are successful right now; change if backend support status
  @override
  TxStatus fromJson(String json) => TxStatus.succeeded;

  @override
  String toJson(TxStatus object) => object.toString();
}

class _DecimalConverter implements JsonConverter<Decimal, Object> {
  const _DecimalConverter();

  @override
  Decimal fromJson(Object json) {
    return Amount.parse(json, 18);
  }

  @override
  Object toJson(Decimal object) {
    return Amount.original(object, 18).toString();
  }
}
