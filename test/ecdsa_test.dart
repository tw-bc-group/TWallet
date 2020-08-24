import 'dart:convert';
import 'dart:typed_data';

import 'package:bip32/bip32.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:more/tuple.dart';
import 'package:tw_wallet_ui/service/blockchain.dart';
import 'package:web3dart/crypto.dart';

Future<void> main() async {
  test(
      'when use private key signed something, should verify valid and recover address',
      () {
    final BIP32 bip32 =
        BlockChainService.generateHDWallet('1 2 3 4 5 6 7 8 9 10 11 12');
    final Tuple2<String, String> keyPair =
        BlockChainService.generateKeys(bip32);

    final publicKey = decompressPublicKey(hexToBytes(keyPair.first)).sublist(1);

    final Uint8List messageHash =
        keccak256(Uint8List.fromList(utf8.encode('hello world')));

    final MsgSignature msgSignature =
        sign(messageHash, hexToBytes(keyPair.second));

    expect(isValidSignature(messageHash, msgSignature, publicKey), true);

    expect(ecRecover(messageHash, msgSignature), publicKey);
  });
}
