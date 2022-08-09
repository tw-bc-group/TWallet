import 'package:tw_wallet_ui/common/application.dart';
import 'package:web3dart/credentials.dart';

class DID {
  final EthereumAddress ethAddress;
  DID(this.ethAddress);

  String get eip55Address => ethAddress.hexEip55;

  String get shorthandValue =>
      '${toString().substring(0, 10)}*${toString().substring(44)}';

  static String _withoutPrefixTag(String original) {
    return original.substring(Application.globalEnv.didPrefix.length);
  }

  factory DID.fromEthAddress(EthereumAddress ethAddress) {
    return DID(ethAddress);
  }

  factory DID.parse(String did) {
    if (did.startsWith(Application.globalEnv.didPrefix)) {
      return DID(EthereumAddress.fromHex('0x${_withoutPrefixTag(did)}'));
    } else {
      throw ArgumentError.value(
        did,
        'strParse',
        'DID must be start with ${Application.globalEnv.didPrefix}',
      );
    }
  }

  @override
  String toString() {
    return '${Application.globalEnv.didPrefix}${ethAddress.hexEip55.substring(2)}';
  }
}
