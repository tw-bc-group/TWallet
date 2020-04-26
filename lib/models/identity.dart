import 'package:avataaar_image/avataaar_image.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:optional/optional_internal.dart';
import 'package:tw_wallet_ui/global/common/get_it.dart';
import 'package:tw_wallet_ui/global/service/api_provider.dart';
import 'package:tw_wallet_ui/global/service/blockchain.dart';
import 'package:tw_wallet_ui/global/service/smart_contract/contract.dart';
import 'package:tw_wallet_ui/models/serializer.dart';
import 'package:web3dart/credentials.dart';

import 'amount.dart';

part 'identity.g.dart';

abstract class Identity extends Object
    implements Built<Identity, IdentityBuilder> {
  static Serializer<Identity> get serializer => _$identitySerializer;

  @nullable
  String get id;
  @nullable
  String get avatar;
  String get name;
  String get pubKey;
  String get priKey;
  @nullable
  String get phone;
  @nullable
  String get email;
  @nullable
  String get birthday;
  @nullable
  Amount get balance;

  @memoized
  String get address =>
      BlockChainService.publicKeyToAddress(pubKey.substring(2));

  @memoized
  String get did => 'DID:TW:${address.substring(2)}';

  @memoized
  Optional<Avataaar> get avataaar =>
      Optional.ofNullable(avatar).map((avatar) => Avataaar.fromJson(avatar));

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

  Future<bool> transferPoint({String toAddress, BigInt point}) async {
    return getIt<ContractService>()
        .twPointContract
        .signContractCall(priKey, 'transfer', [
      EthereumAddress.fromHex(toAddress),
      point,
    ]).then((signedRawTx) {
      return getIt<ApiProvider>()
          .transferPoint(address, pubKey, signedRawTx)
          .then((response) => response.statusCode == 201);
    });
  }

  Map<String, dynamic> toJson() {
    return serializers.serialize(this);
  }

  factory Identity.fromJson(dynamic serialized) {
    return serializers.deserialize(serialized,
        specifiedType: const FullType(Identity));
  }

  factory Identity([void Function(IdentityBuilder) updates]) = _$Identity;
  Identity._();
}
