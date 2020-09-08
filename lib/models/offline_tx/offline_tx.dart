import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tw_wallet_ui/models/serializer.dart';

part 'offline_tx.g.dart';

abstract class OfflineTx implements Built<OfflineTx, OfflineTxBuilder> {
  String get from;

  String get publicKey;

  String get tx;

  factory OfflineTx([void Function(OfflineTxBuilder) updates]) = _$OfflineTx;

  Map<String, dynamic> toJson() {
    return serializers.serialize(this) as Map<String, dynamic>;
  }

  static OfflineTx fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(OfflineTx.serializer, json);
  }

  static Serializer<OfflineTx> get serializer => _$offlineTxSerializer;

  OfflineTx._();
}
