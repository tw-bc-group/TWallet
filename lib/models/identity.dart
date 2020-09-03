import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tw_wallet_ui/common/get_it.dart';
import 'package:tw_wallet_ui/models/serializer.dart';
import 'package:tw_wallet_ui/service/api_provider.dart';
import 'package:tw_wallet_ui/service/blockchain.dart';
import 'package:tw_wallet_ui/service/smart_contract/contract.dart';
import 'package:tw_wallet_ui/store/identity_store.dart';
import 'package:tw_wallet_ui/store/mnemonics.dart';
import 'package:uuid/uuid.dart';
import 'package:web3dart/credentials.dart';

import 'amount.dart';
import 'did.dart';

part 'identity.g.dart';

abstract class Identity extends Object
    implements Built<Identity, IdentityBuilder> {
  static Serializer<Identity> get serializer => _$identitySerializer;

  String get id;

  String get name;

  int get index;

  String get pubKey;

  String get priKey;

  String get dappId;

  bool get isSelected;

  @nullable
  String get phone;

  @nullable
  String get email;

  @nullable
  String get birthday;

  @nullable
  Amount get balance;

  @nullable
  String get healthCertificateStatus;

  @nullable
  String get healthStatus;

  @memoized
  String get address =>
      BlockChainService.publicKeyToAddress(pubKey.substring(2));

  @memoized
  DID get did => DID.fromEthAddress(EthereumAddress.fromHex(address));

  @nullable
  String get extra;

  Identity setSelected() => rebuild((id) => id..isSelected = true);

  Identity setUnSelected() => rebuild((id) => id..isSelected = false);

  Map<String, dynamic> basicInfo() => {
        'id': id,
        'address': address,
        'publicKey': pubKey,
        'index': index,
        'extra': extra
      };

  factory Identity([void Function(IdentityBuilder) updates]) =>
      _$Identity((builder) => builder
        ..id = Uuid().v1()
        ..isSelected = false
        ..dappId = ""
        ..extra = ""
        ..update(updates));

  Future<bool> register() async {
    return getIt<ContractService>().identitiesContract.sendTransaction(
        getIt<MnemonicsStore>().firstPrivateKey, 'registerIdentity', [
      name,
      did.toString(),
      dappId,
      BigInt.from(index),
      extra,
    ]).then((success) {
      if (success) {
        getIt<IdentityStore>().addIdentity(identity: this);
      }
      return success;
    });
  }

  Future<String> signOfflinePayment(BigInt bill, String toAddress) {
    return getIt<ContractService>().nftTokenContract.signContractCall(
        priKey, 'safeTransferFrom', [
      EthereumAddress.fromHex(address),
      EthereumAddress.fromHex(toAddress),
      bill
    ]);
  }

  Future<bool> transferPoint({String toAddress, Amount amount}) async {
    return getIt<ContractService>()
        .tokenContract
        .signContractCall(priKey, 'transfer', [
      EthereumAddress.fromHex(toAddress),
      BigInt.parse(amount.original.toString()),
    ]).then((signedRawTx) {
      return getIt<ApiProvider>()
          .transferPoint(address, pubKey, signedRawTx)
          .then((res) =>
              res.map((response) => response.statusCode == 200).orElse(false));
    });
  }

  Map<String, dynamic> toJson() {
    return serializers.serialize(this) as Map<String, dynamic>;
  }

  factory Identity.fromJson(dynamic serialized) {
    return serializers.deserialize(serialized,
        specifiedType: const FullType(Identity)) as Identity;
  }

  Identity._();
}
