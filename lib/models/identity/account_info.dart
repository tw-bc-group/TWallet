import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tw_wallet_ui/models/amount.dart';
import 'package:tw_wallet_ui/models/serializer.dart';

part 'account_info.g.dart';

abstract class AccountInfo implements Built<AccountInfo, AccountInfoBuilder> {
  static Serializer<AccountInfo> get serializer => _$accountInfoSerializer;

  int get index;

  String get pubKey;

  String get priKey;

  Amount? get balance;

  static AccountInfo fromJson(dynamic serialized) {
    try {
      return serializers.deserialize(serialized,
          specifiedType: const FullType(AccountInfo)) as AccountInfo;
    } catch (error) {
      throw Exception('webview request deserialize error, $error');
    }
  }

  factory AccountInfo([Function(AccountInfoBuilder) updates]) = _$AccountInfo;
  AccountInfo._();
}
