import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tw_wallet_ui/models/serializer.dart';

part 'health_certification.g.dart';

const String healthy = 'healthy';
const String unHealthy = 'unhealthy';

abstract class HealthCertification
    implements Built<HealthCertification, HealthCertificationBuilder> {
  static Serializer<HealthCertification> get serializer =>
      _$healthCertificationSerializer;

  @BuiltValueField(wireName: '@context')
  BuiltList<String> get context;
  int get exp;
  int get iat;
  String get id;
  String get iss;
  String get ver;
  BuiltList<String> get typ;
  HealthCertificationSub get sub;

  factory HealthCertification([Function(HealthCertificationBuilder) updates]) =
      _$HealthCertification;

  factory HealthCertification.fromJson(dynamic serialized) {
    return serializers.deserialize(
      serialized,
      specifiedType: const FullType(HealthCertification),
    )! as HealthCertification;
  }

  Map<String, dynamic> toJson() {
    return serializers.serialize(this)! as Map<String, dynamic>;
  }

  HealthCertification._();
}

abstract class HealthCertificationSub
    implements Built<HealthCertificationSub, HealthCertificationSubBuilder> {
  static Serializer<HealthCertificationSub> get serializer =>
      _$healthCertificationSubSerializer;

  String get id;
  String get phone;
  HealthyStatus get healthyStatus;

  factory HealthCertificationSub([
    Function(HealthCertificationSubBuilder) updates,
  ]) = _$HealthCertificationSub;

  factory HealthCertificationSub.fromJson(dynamic serialized) {
    return serializers.deserialize(
      serialized,
      specifiedType: const FullType(HealthCertificationSub),
    )! as HealthCertificationSub;
  }

  HealthCertificationSub._();
}

abstract class HealthyStatus
    implements Built<HealthyStatus, HealthyStatusBuilder> {
  static Serializer<HealthyStatus> get serializer => _$healthyStatusSerializer;

  String get typ;
  String get val;

  factory HealthyStatus([Function(HealthyStatusBuilder) updates]) =
      _$HealthyStatus;

  factory HealthyStatus.fromJson(dynamic serialized) {
    return serializers.deserialize(
      serialized,
      specifiedType: const FullType(HealthyStatus),
    )! as HealthyStatus;
  }

  HealthyStatus._();
}
