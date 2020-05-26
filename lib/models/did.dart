import 'package:tw_wallet_ui/store/env_store.dart';
import 'package:web3dart/credentials.dart';

class DID {
  final EthereumAddress ethAddress;
  DID(this.ethAddress);

  String get eip55Address => ethAddress.hexEip55;

  String get shorthandValue => '${this.toString().substring(0, 10)}*${this.toString().substring(44)}';

  static String _withoutPrefixTag(String original) {
    return original.substring(globalEnv().didPrefix.length);
  }

  factory DID.fromEthAddress(EthereumAddress ethAddress) {
    return DID(ethAddress);
  }

  factory DID.parse(String did) {
    if (did.startsWith(globalEnv().didPrefix)) {
      return DID(EthereumAddress.fromHex('0x${_withoutPrefixTag(did)}'));
    } else {
      throw ArgumentError.value(
          did, 'strParse', 'DID must be start with ${globalEnv().didPrefix}');
    }
  }

  @override
  String toString() {
    return '${globalEnv().didPrefix}${ethAddress.hexEip55.substring(2)}';
  }
}
