import 'dart:typed_data';

import 'package:bip32/bip32.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:convert/convert.dart';
import 'package:ethereum_addresses/ethereum_addresses.dart';
import 'package:more/tuple.dart';

class BlockChainService {
  static BIP32 _hdWallet(String mnemonics) {
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

  static Tuple2<String, String> keypairFromMnenomics(
    String mnemonics, [
    int index = 0,
  ]) {
    return generateKeypair(_hdWallet(mnemonics), index);
  }

  static String publicKeyToAddress(String publicKey) {
    final list = publicKey.startsWith('0x')
        ? hex.decode(publicKey.substring(2))
        : hex.decode(publicKey);
    return ethereumAddressFromPublicKey(list as Uint8List);
  }
}
