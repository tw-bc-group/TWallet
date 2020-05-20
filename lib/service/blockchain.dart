import 'package:bip32/bip32.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:ethereum_address/ethereum_address.dart';
import 'package:hex/hex.dart';
import 'package:more/tuple.dart';

class BlockChainService {
  static BIP32 generateHDWallet(String mnemonics) {
    var seed = bip39.mnemonicToSeed(mnemonics);
    return BIP32.fromSeed(seed);
  }

  static Tuple2<String, String> generateIdentityKeys(BIP32 hdWallet,
      [int index = 0]) {
    var keypair = hdWallet.derivePath("m/44'/60'/0'/0/" + index.toString());
    var publicKey = '0x' + HEX.encode(keypair.publicKey);
    var privateKey = '0x' + HEX.encode(keypair.privateKey);
    return Tuple2<String, String>(publicKey, privateKey);
  }

  static String publicKeyToAddress(String publicKey) {
    return ethereumAddressFromPublicKey(HEX.decode(publicKey));
  }
}
