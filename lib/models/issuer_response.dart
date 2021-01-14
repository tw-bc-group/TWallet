import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tw_wallet_ui/models/serializer.dart';
import 'package:tw_wallet_ui/models/vc_type_response.dart';

part 'issuer_response.g.dart';

abstract class IssuerResponse extends Object
    implements Built<IssuerResponse, IssuerResponseBuilder> {
  static Serializer<IssuerResponse> get serializer =>
      _$issuerResponseSerializer;

  int get id;
  String get name;
  @BuiltValueField(wireName: 'vc_types')
  BuiltList<VcType> get vcTypes;

  Map<String, dynamic> toJson() {
    return serializers.serialize(this) as Map<String, dynamic>;
  }

  factory IssuerResponse([void Function(IssuerResponseBuilder) updates]) =
      _$IssuerResponse;

  factory IssuerResponse.fromJson(dynamic serialized) {
    return serializers.deserialize(serialized,
        specifiedType: const FullType(IssuerResponse)) as IssuerResponse;
  }

  IssuerResponse._();
}
