import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:more/tuple.dart';
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

  Future<bool> register(int index, String extra) async {
    return getIt<ContractService>().identitiesContract.sendTransaction(
        getIt<MnemonicsStore>().firstPrivateKey, 'registerIdentity', [
      name,
      did.toString(),
      "", //dappId
      BigInt.from(index),
      extra,
    ]).then((success) {
      if (success) {
        getIt<IdentityStore>().addIdentity(identity: this);
      }
      return success;
    });
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

  static Future<bool> restore() async {
    try {
      final IdentityStore _identityStore = getIt<IdentityStore>();
      final MnemonicsStore _mnemonicsStore = getIt<MnemonicsStore>();
      final List<dynamic> queryResult = await getIt<ContractService>()
          .identitiesContract
          .callFunction(_mnemonicsStore.firstPublicKey, 'identityOf', null);

      if (queryResult.isNotEmpty) {
        await _identityStore.clear();

        for (int i = 0; i < (queryResult[0] as List<dynamic>).length; i++) {
          final int index = (queryResult[3][i] as BigInt).toInt();
          final Tuple2<String, String> keys = _mnemonicsStore.indexKeys(index);
          final Identity identity = Identity((identity) => identity
            ..id = Uuid().v1()
            ..name = queryResult[0][i] as String
            ..pubKey = keys.first
            ..priKey = keys.second
            ..dappId = queryResult[2][i] as String
            ..index = index
            ..extra = queryResult[4][i] as String);
          await _identityStore.addIdentity(identity: identity);
        }
      }

      return true;
    } catch (_) {
      return false;
    }
  }

  Identity._();
}
