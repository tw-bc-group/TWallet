import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tw_wallet_ui/global/common/secure_storage.dart';
import 'package:tw_wallet_ui/global/service/blockchain.dart';

part 'identity.g.dart';

@JsonSerializable()
class Identity {
  String name;
  String pubKey;
  String priKey;
  String phone;
  String email;
  DateTime birthday;

  Identity(
      {@required this.name,
      @required this.pubKey,
      @required this.priKey,
      this.phone,
      this.email,
      this.birthday});

  String get address =>
      BlockChainService.publicKeyToAddress(pubKey.substring(2));

  factory Identity.fromJson(Map<String, dynamic> json) =>
      _$IdentityFromJson(json);

  Map<String, dynamic> toJson() => _$IdentityToJson(this);

  static Future<Identity> getFromSecureStorage() async {
    return Identity.fromJson(
        json.decode(await SecureStorage.get(SecureStorageItem.Identity)));
  }
}
