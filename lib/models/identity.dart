import 'package:avataaar_image/avataaar_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:optional/optional_internal.dart';
import 'package:tw_wallet_ui/global/common/get_it.dart';
import 'package:tw_wallet_ui/global/service/api_provider.dart';
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

  Optional<Avataaar> get avataaar => avatar != null
      ? Optional.of(Avataaar.fromJson(avatar))
      : Optional.empty();

  String get address =>
      BlockChainService.publicKeyToAddress(pubKey.substring(2));

  String get did => 'DID:TW:${address.substring(2)}';

  factory Identity.fromJson(Map<String, dynamic> json) =>
      _$IdentityFromJson(json);

  Map<String, dynamic> toJson() => _$IdentityToJson(this);

  Future<bool> add() async {
    ApiProvider apiProvider = getIt<ApiProvider>();
    Response response = await apiProvider.addIdentityV1(
        name: name, address: address, did: did, publicKey: pubKey);

    if (response.statusCode == 201) {
      return true;
    }
    return false;
  }
}
