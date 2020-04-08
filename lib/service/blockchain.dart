import 'package:bip32/bip32.dart';
import 'package:bip39/bip39.dart' as bip39;
import "package:ethereum_address/ethereum_address.dart";
import 'package:hex/hex.dart';
import 'package:tw_wallet_ui/models/identity.dart';

class BlockChainService {
  static Identity createRootKeyIdentityFromMnemonics(String mnemonics) {
    var seed = bip39.mnemonicToSeed(mnemonics);
    var hdWallet = BIP32.fromSeed(seed);
    var keypair = hdWallet.derivePath("m/44'/60'/0'/0/0");
    var privateKey = '0x' + HEX.encode(keypair.privateKey);
    var publicKey = '0x' + HEX.encode(keypair.publicKey);
    var address = ethereumAddressFromPublicKey(keypair.publicKey);
    return Identity(
      name: '小钱',
      priKey: privateKey,
      pubKey: publicKey,
      address: address,
    );
  }
}