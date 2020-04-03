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

  Map<String, dynamic> toJson() => _$IdentityToJson(this);

  Future<Identity> getFromSecureStorage() async {
    var identityGet = await SecureStorage.get(SecureStorageItem.Identity);
    var identity = json.decode(identityGet);
    this.name = identity.name;
    this.priKey = identity.priKey;
    this.pubKey = identity.pubKey;
    this.address = identity.address;
    return this;
  }
}
