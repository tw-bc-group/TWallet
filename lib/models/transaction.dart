import 'package:decimal/decimal.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transaction.g.dart';

@JsonSerializable()
class Transaction {
  final String hash;
  final String txType;

  @_DecimalConverter()
  Decimal amount;
  final DateTime createTime;
  final DateTime confirmTime;
  final String fromAddress;
  final String fromAddressName;
  final String toAddress;
  final String toAddressName;

  Transaction(
      this.hash,
      this.txType,
      this.createTime,
      this.confirmTime,
      this.fromAddress,
      this.fromAddressName,
      this.toAddress,
      this.toAddressName);
}

class _DecimalConverter implements JsonConverter<Decimal, Object> {
  const _DecimalConverter();

  @override
  Decimal fromJson(Object json) {
    return Decimal.parse(json);
  }

  @override
  Object toJson(Decimal object) {
    return object.toString();
  }
}
