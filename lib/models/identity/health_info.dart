import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tw_wallet_ui/models/serializer.dart';

part 'health_info.g.dart';

abstract class HealthInfo implements Built<HealthInfo, HealthInfoBuilder> {
  static Serializer<HealthInfo> get serializer => _$healthInfoSerializer;

  @nullable
  String get healthCertificateStatus;

  @nullable
  String get healthStatus;

  static HealthInfo fromJson(dynamic serialized) {
    try {
      return serializers.deserialize(serialized,
          specifiedType: const FullType(HealthInfo)) as HealthInfo;
    } catch (error) {
      throw Exception('webview request deserialize error, $error');
    }
  }

  factory HealthInfo([Function(HealthInfoBuilder) updates]) = _$HealthInfo;
  HealthInfo._();
}
