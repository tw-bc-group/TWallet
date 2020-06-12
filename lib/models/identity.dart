import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tw_wallet_ui/common/get_it.dart';
import 'package:tw_wallet_ui/models/serializer.dart';
import 'package:tw_wallet_ui/service/api_provider.dart';
import 'package:tw_wallet_ui/service/blockchain.dart';
import 'package:tw_wallet_ui/service/smart_contract/contract.dart';
import 'package:web3dart/credentials.dart';

import 'amount.dart';
import 'did.dart';

part 'identity.g.dart';

abstract class Identity extends Object
    implements Built<Identity, IdentityBuilder> {
  static Serializer<Identity> get serializer => _$identitySerializer;

  @nullable
  String get id;

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
  bool get isSelected;

  @nullable
  bool get fromDApp;

  @nullable
  int get index;

  Identity setSelected() => rebuild((id) => id..isSelected = true);
  Identity setUnSelected() => rebuild((id) => id..isSelected = false);

  Future<bool> register() async {
    return getIt<ContractService>().identityRegistryContract.signContractCall(
        priKey, 'createIdentity', [
      EthereumAddress.fromHex(address),
      did.toString(),
      pubKey,
      name
    ]).then((signedRawTx) {
      return getIt<ApiProvider>()
          .identityRegister(name, pubKey, address, did.toString(), signedRawTx)
          .then((res) => res
              .map((response) =>
                  response.statusCode >= 200 && response.statusCode < 300)
              .orElse(false));
    });
  }

  Future<bool> transferPoint({String toAddress, Amount amount}) async {
    return getIt<ContractService>()
        .twPointContract
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

  factory Identity([void Function(IdentityBuilder) updates]) =>
      _$Identity((builder) => builder
        ..isSelected = false
        ..fromDApp = false
        ..update(updates));

  factory Identity.fromJson(dynamic serialized) {
    return serializers.deserialize(serialized,
        specifiedType: const FullType(Identity)) as Identity;
  }

  Identity._();
}
