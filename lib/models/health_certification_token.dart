import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:get/get.dart';
import 'package:tw_wallet_ui/models/serializer.dart';
import 'package:tw_wallet_ui/service/api_provider.dart';

import 'health_certification.dart';

part 'health_certification_token.g.dart';

abstract class HealthCertificationToken extends Object
    implements
        Built<HealthCertificationToken, HealthCertificationTokenBuilder> {
  static Serializer<HealthCertificationToken> get serializer =>
      _$healthCertificationTokenSerializer;

  String get token;

  @memoized
  HealthCertification get healthCertification {
    return HealthCertification.fromJson(
        json.decode(String.fromCharCodes(base64.decode(token.split('.')[1]))));
  }

  Map<String, dynamic> toJson() {
    return serializers.serialize(this) as Map<String, dynamic>;
  }

  Future<bool> verify() {
    return Get.find<ApiProvider>().verifyHealthCertificationToken(token).then(
        (res) =>
            res.map((response) => response.statusCode == 200).orElse(false));
  }

  factory HealthCertificationToken(
          [void Function(HealthCertificationTokenBuilder) updates]) =
      _$HealthCertificationToken;
  HealthCertificationToken._();

  factory HealthCertificationToken.fromJson(dynamic serialized) {
    return serializers.deserialize(serialized,
            specifiedType: const FullType(HealthCertificationToken))
        as HealthCertificationToken;
  }

  @override
  String toString() {
    return token;
  }
}
