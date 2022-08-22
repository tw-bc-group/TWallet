import 'dart:typed_data';

import 'package:bip32/bip32.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:convert/convert.dart';
import 'package:ethereum_addresses/ethereum_addresses.dart';
import 'package:more/tuple.dart';

class BlockChainService {
  static BIP32 generateHDWallet(String mnemonics) {
    final Uint8List seed = bip39.mnemonicToSeed(mnemonics);
    return BIP32.fromSeed(seed);
  }

  static Tuple2<String, String> generateKeypair(
    BIP32 hdWallet, [
    int index = 0,
  ]) {
    final BIP32 keypair = hdWallet.derivePath("m/44'/60'/0'/0/$index");
    final String publicKey = '0x${hex.encode(keypair.publicKey)}';
    final String privateKey = '0x${hex.encode(keypair.privateKey!)}';
    return Tuple2<String, String>(publicKey, privateKey);
  }

  static String publicKeyToAddress(String publicKey) {
    return ethereumAddressFromPublicKey(hex.decode(publicKey) as Uint8List);
  }
}
