import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'tx_status.g.dart';

class TxStatus extends EnumClass {
  static Serializer<TxStatus> get serializer => _$txStatusSerializer;

  //TODO: all records are successful right now; change if backend support status
  @BuiltValueEnumConst(wireName: 'Transfer')
  static const TxStatus succeeded = _$succeeded;
  static const TxStatus transferring = _$transferring;
  static const TxStatus failed = _$failed;

  const TxStatus._(String name) : super(name);

  static BuiltSet<TxStatus> get values => _$values;
  static TxStatus valueOf(String name) => _$valueOf(name);

  String getDesc() {
    String res = '';
    switch (this) {
      case TxStatus.succeeded:
        res = 'The transaction has been completed';
        break;
      case TxStatus.failed:
        res = 'Failed';
        break;
      case TxStatus.transferring:
        res = 'The transaction is being processed';
        break;
    }
    return res;
  }

  @override
  String toString() {
    String res = '';
    switch (this) {
      case TxStatus.succeeded:
        res = 'Success';
        break;
      case TxStatus.failed:
        res = 'Failed';
        break;
      case TxStatus.transferring:
        res = 'Transferring';
        break;
    }
    return res;
  }
}
