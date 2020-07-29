import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tw_wallet_ui/models/serializer.dart';

part 'create_account_param.g.dart';

abstract class CreateAccountParam
    implements Built<CreateAccountParam, CreateAccountParamBuilder> {
  static Serializer<CreateAccountParam> get serializer =>
      _$createAccountParamSerializer;

  String get dappid;
  String get extra;

  static CreateAccountParam fromJson(dynamic serialized) {
    try {
      return serializers.deserialize(serialized,
              specifiedType: const FullType(CreateAccountParam))
          as CreateAccountParam;
    } catch (error) {
      throw Exception('webview request deserialize error, $error');
    }
  }

  factory CreateAccountParam([Function(CreateAccountParamBuilder) updates]) =
      _$CreateAccountParam;
  CreateAccountParam._();
}
