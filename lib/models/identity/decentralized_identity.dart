import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:get/get.dart';
import 'package:tw_wallet_ui/models/amount.dart';
import 'package:tw_wallet_ui/models/dcep/dcep.dart';
import 'package:tw_wallet_ui/models/did.dart';
import 'package:tw_wallet_ui/models/identity/account_info.dart';
import 'package:tw_wallet_ui/models/identity/health_info.dart';
import 'package:tw_wallet_ui/models/identity/profile_info.dart';
import 'package:tw_wallet_ui/models/serializer.dart';
import 'package:tw_wallet_ui/service/api_provider.dart';
import 'package:tw_wallet_ui/service/contract.dart';
import 'package:tw_wallet_ui/store/dcep/dcep_store.dart';
import 'package:tw_wallet_ui/store/identity_store.dart';
import 'package:uuid/uuid.dart';
import 'package:web3dart/credentials.dart';

part 'decentralized_identity.g.dart';

abstract class DecentralizedIdentity extends Object
    implements Built<DecentralizedIdentity, DecentralizedIdentityBuilder> {
  static Serializer<DecentralizedIdentity> get serializer =>
      _$decentralizedIdentitySerializer;

  String get id;

  String get dappId;

  ProfileInfo get profileInfo;

  AccountInfo get accountInfo;

  HealthInfo get healthInfo;

  String? get extra;

  @memoized
  String get address => accountInfo.address;

  @memoized
  DID get did => DID.fromEthAddress(EthereumAddress.fromHex(address));

  Map<String, dynamic> basicInfo() => {
        'id': id,
        'address': address,
        'publicKey': accountInfo.pubKey,
        'index': accountInfo.index,
        'extra': extra
      };

  factory DecentralizedIdentity([
    void Function(DecentralizedIdentityBuilder)? updates,
  ]) =>
      _$DecentralizedIdentity(
        (builder) => builder
          ..id = const Uuid().v1()
          ..dappId = ""
          ..extra = ""
          ..update(updates),
      );

  Future<bool> register(Credentials creds) async {
    return Get.find<ContractService>()
        .identitiesContract!
        .sendTransaction(creds, 'registerIdentity', [
      profileInfo.name,
      did.toString(),
      dappId,
      BigInt.from(accountInfo.index),
      extra,
      accountInfo.pubKey,
    ]).then((success) {
      if (success) {
        Get.find<IdentityStore>().addIdentity(identity: this);
      }
      return success;
    });
  }

  Future<void> redeemDcep(DcepType type) {
    return Get.find<ApiProvider>().redeemDcepV2(address, type).then(
          (res) => res.ifPresent((dcep) {
            if (dcep.verify()) {
              if (dcep.owner == address) {
                Get.find<DcepStore>().add(dcep);
              }
            }
          }),
        );
  }

  Future<String> signOfflinePayment(BigInt bill, String toAddress, int nonce) {
    return Get.find<ContractService>().nftTokenContract!.signContractCall(
          accountInfo.priKey,
          'safeTransferFrom',
          [
            EthereumAddress.fromHex(address),
            EthereumAddress.fromHex(toAddress),
            bill
          ],
          nonce: nonce,
        );
  }

  Future<bool> transferPoint({
    required String toAddress,
    required Amount amount,
  }) async {
    return Get.find<ContractService>()
        .tokenContract!
        .signContractCall(accountInfo.priKey, 'transfer', [
      EthereumAddress.fromHex(toAddress),
      BigInt.parse(amount.original.toString()),
    ]).then((signedRawTx) {
      return Get.find<ApiProvider>()
          .transferPoint(address, accountInfo.pubKey, signedRawTx)
          .then((response) => response.statusCode == 200);
    });
  }

  Map<String, dynamic> toJson() {
    return serializers.serialize(this)! as Map<String, dynamic>;
  }

  factory DecentralizedIdentity.fromJson(dynamic serialized) {
    return serializers.deserialize(
      serialized,
      specifiedType: const FullType(DecentralizedIdentity),
    )! as DecentralizedIdentity;
  }

  DecentralizedIdentity._();
}
