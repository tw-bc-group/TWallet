import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tw_wallet_ui/models/serializer.dart';

part 'profile_info.g.dart';

abstract class ProfileInfo implements Built<ProfileInfo, ProfileInfoBuilder> {
  static Serializer<ProfileInfo> get serializer => _$profileInfoSerializer;

  String get name;

  @nullable
  String get phone;

  @nullable
  String get email;

  @nullable
  String get birthday;

  static ProfileInfo fromJson(dynamic serialized) {
    try {
      return serializers.deserialize(serialized,
          specifiedType: const FullType(ProfileInfo)) as ProfileInfo;
    } catch (error) {
      throw Exception('webview request deserialize error, $error');
    }
  }

  factory ProfileInfo([Function(ProfileInfoBuilder) updates]) = _$ProfileInfo;
  ProfileInfo._();
}
