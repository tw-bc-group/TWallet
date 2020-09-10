import 'dart:convert';
import 'dart:typed_data';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/models/serializer.dart';

part 'dcep.g.dart';

class DcepType extends EnumClass {
  static Serializer<DcepType> get serializer => _$dcepTypeSerializer;

  @BuiltValueEnumConst(wireName: 'RMB100_00')
  static const DcepType rmb100 = _$rmb100;

  @BuiltValueEnumConst(wireName: 'RMB050_00')
  static const DcepType rmb050 = _$rmb050;

  @BuiltValueEnumConst(wireName: 'RMB010_00')
  static const DcepType rmb010 = _$rmb010;

  @BuiltValueEnumConst(wireName: 'RMB005_00')
  static const DcepType rmb005 = _$rmb005;

  @BuiltValueEnumConst(wireName: 'RMB001_00')
  static const DcepType rmb001 = _$rmb001;

  @BuiltValueEnumConst(wireName: 'RMB000_50')
  static const DcepType rmb000_50 = _$rmb000_50;

  @BuiltValueEnumConst(wireName: 'RMB000_10')
  static const DcepType rmb000_10 = _$rmb000_10;

  static BuiltSet<DcepType> get values => _$values;

  static DcepType valueOf(String name) => _$valueOf(name);

  const DcepType._(String name) : super(name);

  int get amount {
    switch (this) {
      case DcepType.rmb100:
        return 10000;
      case DcepType.rmb050:
        return 5000;
      case DcepType.rmb010:
        return 1000;
      case DcepType.rmb005:
        return 500;
      case DcepType.rmb001:
        return 100;
      case DcepType.rmb000_50:
        return 50;
      case DcepType.rmb000_10:
        return 10;
      default:
        return 0;
    }
  }

  String get humanReadable {
    switch (this) {
      case DcepType.rmb100:
        return '100元';
      case DcepType.rmb050:
        return '50元';
      case DcepType.rmb010:
        return '10元';
      case DcepType.rmb005:
        return '5元';
      case DcepType.rmb001:
        return '1元';
      case DcepType.rmb000_50:
        return '5角';
      case DcepType.rmb000_10:
        return '1角';
      default:
        return '0元';
    }
  }

  @override
  String toString() {
    return (serializers.serialize(this) as Map<String, dynamic>)[''] as String;
  }
}

abstract class Dcep extends Object implements Built<Dcep, DcepBuilder> {
  static Serializer<Dcep> get serializer => _$dcepSerializer;

  @BuiltValueField(wireName: 'serial_number')
  String get sn;

  String get owner;

  String get signature;

  @BuiltValueField(wireName: 'money_type')
  DcepType get type;

  @BuiltValueField(wireName: 'create_time')
  DateTime get createdAt;

  int compareTo(Dcep ohs) {
    return type.amount.compareTo(ohs.type.amount);
  }

  int get amount => type.amount;

  Map<String, dynamic> toJson() {
    return serializers.serialize(this) as Map<String, dynamic>;
  }

  bool verify() {
    return Application.globalEnv.centralBankPublicKey.verifySHA256Signature(
        Uint8List.fromList(utf8.encode(sn)), base64.decode(signature));
  }

  factory Dcep([void Function(DcepBuilder) updates]) = _$Dcep;

  factory Dcep.fromJson(dynamic serialized) {
    return serializers.deserialize(serialized,
        specifiedType: const FullType(Dcep)) as Dcep;
  }

  Dcep._();
}
