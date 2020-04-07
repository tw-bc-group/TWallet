import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:tw_wallet_ui/common/secure_storage.dart';

part 'identity.g.dart';

@JsonSerializable()
class Identity {
  String name;
  String priKey;
  String pubKey;
  String address;

  Identity({this.name, this.priKey, this.pubKey, this.address});

  factory Identity.fromJson(Map<String, dynamic> json) =>
      _$IdentityFromJson(json);

  factory Identity.unknown() {
    return Identity(
      name: '',
      priKey: '',
      pubKey: '',
      address: '',
    );
  }

  Map<String, dynamic> toJson() => _$IdentityToJson(this);

  static Future<Identity> getFromSecureStorage() async {
    return Identity.fromJson(
        json.decode(await SecureStorage.get(SecureStorageItem.Identity)));
  }
}
