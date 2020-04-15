import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tw_wallet_ui/global/service/blockchain.dart';

part 'identity.g.dart';

@JsonSerializable()
class Identity {
  String id;
  String avatar;
  String name;
  String pubKey;
  String priKey;
  String phone;
  String email;
  DateTime birthday;

  Identity(
      {@required this.id,
      @required this.avatar,
      @required this.name,
      @required this.pubKey,
      @required this.priKey,
      this.phone,
      this.email,
      this.birthday});

  String get address =>
      BlockChainService.publicKeyToAddress(pubKey.substring(2));

  String get did => 'DID:TW:${address.substring(2)}';

  factory Identity.fromJson(Map<String, dynamic> json) =>
      _$IdentityFromJson(json);

  Map<String, dynamic> toJson() => _$IdentityToJson(this);
}
