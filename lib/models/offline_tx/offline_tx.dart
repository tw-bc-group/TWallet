import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tw_wallet_ui/models/dcep/dcep.dart';
import 'package:tw_wallet_ui/models/serializer.dart';

part 'offline_tx.g.dart';

abstract class TxReceive implements Built<TxReceive, TxReceiveBuilder> {
  String get tx;

  String get from;

  String get publicKey;

  String get description;

  factory TxReceive([void Function(TxReceiveBuilder) updates]) = _$TxReceive;

  Map<String, dynamic> toJson() {
    return serializers.serialize(this)! as Map<String, dynamic>;
  }

  static TxReceive? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(TxReceive.serializer, json);
  }

  static Serializer<TxReceive> get serializer => _$txReceiveSerializer;

  TxReceive._();
}

abstract class TxSend implements Built<TxSend, TxSendBuilder> {
  Dcep get dcep;

  String get signedRawTx;

  factory TxSend([void Function(TxSendBuilder) updates]) = _$TxSend;

  TxSend._();
}
