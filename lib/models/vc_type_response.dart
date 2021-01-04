import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tw_wallet_ui/models/serializer.dart';

part 'vc_type_response.g.dart';

abstract class VcType extends Object
    implements Built<VcType, VcTypeBuilder> {
  static Serializer<VcType> get serializer => _$vcTypeSerializer;

  String get id;
  String get name;
  BuiltList<String> get content;

  Map<String, dynamic> toJson() {
    return serializers.serialize(this) as Map<String, dynamic>;
  }

  factory VcType([void Function(VcTypeBuilder) updates]) =
  _$VcType;

  factory VcType.fromJson(dynamic serialized) {
    return serializers.deserialize(serialized,
        specifiedType: const FullType(VcType)) as VcType;
  }

  VcType._();
}
