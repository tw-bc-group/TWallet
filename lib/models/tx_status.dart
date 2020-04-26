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

  @override
  String toString() {
    String res = '';
    switch (this) {
      case TxStatus.succeeded:
        res = '成功';
        break;
      case TxStatus.failed:
        res = '失败';
        break;
      case TxStatus.transferring:
        res = '处理中';
        break;
    }
    return res;
  }
}
