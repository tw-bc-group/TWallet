import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tw_wallet_ui/models/serializer.dart';

part 'health_certification.g.dart';

abstract class HealthCertification implements Built<HealthCertification, HealthCertificationBuilder> {
  static Serializer<HealthCertification> get serializer => _$healthCertificationSerializer;

  HealthCertification._();

  @BuiltValueField(wireName: '@context')
  BuiltList<String> get context;
  int get exp;
  int get iat;
  String get id;
  String get iss;
  String get ver;
  BuiltList<String> get typ;
  HealthCertificationSub get sub;

  factory HealthCertification.fromJson(dynamic serialized) {
    return serializers.deserialize(serialized,
        specifiedType: FullType(HealthCertification));
  }

  factory HealthCertification([Function(HealthCertificationBuilder) updates]) =
      _$HealthCertification;
}

abstract class HealthCertificationSub implements Built<HealthCertificationSub, HealthCertificationSubBuilder> {
  static Serializer<HealthCertificationSub> get serializer => _$healthCertificationSubSerializer;

  HealthCertificationSub._();
  
  String get id;
  String get phone;
  // HealthyStatus get healthyStatus;

  factory HealthCertificationSub.fromJson(dynamic serialized) {
    return serializers.deserialize(serialized,
        specifiedType: FullType(HealthCertificationSub));
  }

  factory HealthCertificationSub([Function(HealthCertificationSubBuilder) updates]) =
      _$HealthCertificationSub;
}

abstract class HealthyStatus implements Built<HealthyStatus, HealthyStatusBuilder> {
  static Serializer<HealthyStatus> get serializer => _$healthyStatusSerializer;

  HealthyStatus._();
  
  String get typ;
  String get val;

  factory HealthyStatus.fromJson(dynamic serialized) {
    return serializers.deserialize(serialized,
        specifiedType: FullType(HealthyStatus));
  }

  factory HealthyStatus([Function(HealthyStatusBuilder) updates]) =
      _$HealthyStatus;
}