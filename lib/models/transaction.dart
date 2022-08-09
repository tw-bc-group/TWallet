import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tw_wallet_ui/models/amount.dart';
import 'package:tw_wallet_ui/models/serializer.dart';
import 'package:tw_wallet_ui/models/tx_status.dart';

part 'transaction.g.dart';

abstract class Transaction extends Object
    implements Built<Transaction, TransactionBuilder> {
  static Serializer<Transaction> get serializer => _$transactionSerializer;

  String get hash;
  Amount get amount;

  @BuiltValueField(wireName: 'create_time')
  DateTime get createTime;

  @BuiltValueField(wireName: 'confirm_time')
  DateTime? get confirmTime;

  @BuiltValueField(wireName: 'from_address')
  String get fromAddress;

  @BuiltValueField(wireName: 'from_address_name')
  String? get fromAddressName;

  @BuiltValueField(wireName: 'to_address')
  String get toAddress;

  @BuiltValueField(wireName: 'to_address_name')
  String? get toAddressName;

  @BuiltValueField(wireName: 'tx_type')
  TxStatus get txType;

  Map<String, dynamic> toJson() {
    return serializers.serialize(this)! as Map<String, dynamic>;
  }

  factory Transaction([void Function(TransactionBuilder) updates]) =
      _$Transaction;

  factory Transaction.fromJson(dynamic serialized) {
    return serializers.deserialize(
      serialized,
      specifiedType: const FullType(Transaction),
    )! as Transaction;
  }

  Transaction._();
}
