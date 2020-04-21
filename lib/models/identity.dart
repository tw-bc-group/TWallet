import 'package:avataaar_image/avataaar_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:optional/optional_internal.dart';
import 'package:tw_wallet_ui/global/common/get_it.dart';
import 'package:tw_wallet_ui/global/service/api_provider.dart';
import 'package:tw_wallet_ui/global/service/blockchain.dart';
import 'package:tw_wallet_ui/global/service/smart_contract/contract.dart';
import 'package:web3dart/credentials.dart';

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

  Optional<Avataaar> get avataaar =>
      Optional.ofNullable(avatar).map((avatar) => Avataaar.fromJson(avatar));

  String get address =>
      BlockChainService.publicKeyToAddress(pubKey.substring(2));

  String get did => 'DID:TW:${address.substring(2)}';

  factory Identity.fromJson(Map<String, dynamic> json) =>
      _$IdentityFromJson(json);

  Map<String, dynamic> toJson() => _$IdentityToJson(this);

  Future<bool> register() async {
    return getIt<ContractService>().identityRegistryContract.signContractCall(
        priKey, 'createIdentity', [
      EthereumAddress.fromHex(address),
      did,
      pubKey,
      name
    ]).then((signedRawTx) {
      return getIt<ApiProvider>()
          .identityRegister(name, pubKey, address, did, signedRawTx)
          .then((response) => response.statusCode == 201);
    });
  }

  Future<bool> transferPoint(
      {@required String toAddress, @required BigInt point}) async {
    return getIt<ContractService>()
        .twPointContract
        .signContractCall(priKey, 'transfer', [
      EthereumAddress.fromHex(toAddress),
      point,
    ]).then((signedRawTx) {
      return getIt<ApiProvider>()
          .transferPoint(address, pubKey, signedRawTx)
          .then((response) => response.statusCode == 200);
    });
  }
}
