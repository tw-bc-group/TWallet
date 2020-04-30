import 'package:tw_wallet_ui/global/common/env.dart';
import 'package:web3dart/credentials.dart';

class DID extends Object {
  final EthereumAddress ethAddress;
  const DID(this.ethAddress);

  String get eip55Address => ethAddress.hexEip55;

  static String _withoutPrefixTag(String original) {
    return original.substring(DID_PREFIX_TAG.length);
  }

  factory DID.fromEthAddress(EthereumAddress ethAddress) {
    return DID(ethAddress);
  }

  factory DID.parse(String did) {
    if (did.startsWith(DID_PREFIX_TAG)) {
      return DID(EthereumAddress.fromHex('0x${_withoutPrefixTag(did)}'));
    } else {
      throw ArgumentError.value(
          did, 'strParse', 'DID must be start with $DID_PREFIX_TAG');
    }
  }

  @override
  String toString() {
    return '$DID_PREFIX_TAG${ethAddress.hexEip55.substring(2)}';
  }
}
