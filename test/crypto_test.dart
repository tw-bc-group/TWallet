import 'dart:convert';
import 'dart:typed_data';

import 'package:bip32/bip32.dart';
import 'package:crypton/crypton.dart';
import 'package:encrypt/encrypt.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:more/tuple.dart';
import 'package:random_string/random_string.dart';
import 'package:tw_wallet_ui/service/blockchain.dart';
import 'package:web3dart/crypto.dart';

void main() {
  group('aes test', () {
    test(
        'when use aes key encrypt some thing, use same key decrypt should return same thing',
        () {
      final String message =
          DateTime.now().millisecondsSinceEpoch.toRadixString(16);
      final String aesKey = randomString(16);
      final key = Key.fromUtf8(aesKey);
      final IV iv = IV.fromUtf8(aesKey);
      final Encrypter encrypter = Encrypter(AES(key));
      final Encrypted aesEncrypted = encrypter.encrypt(message, iv: iv);
      final String decrypted = encrypter.decrypt(aesEncrypted, iv: iv);
      expect(message, decrypted);
    });
  });

  group('rsa test', () {
    test(
        "when use public key encrypt something, use private key decrypt should return same things",
        () async {
      final RSAKeypair keyPair = RSAKeypair.fromRandom();
      final String message =
          DateTime.now().millisecondsSinceEpoch.toRadixString(16);
      final String rsaEncrypted = keyPair.publicKey.encrypt(message);
      final String decrypted = keyPair.privateKey.decrypt(rsaEncrypted);
      expect(message, decrypted);
    });
  });

  group('ecdsa test', () {
    test(
        'when use private key signed something, should verify valid and recover address',
        () {
      final BIP32 bip32 =
          BlockChainService.generateHDWallet('1 2 3 4 5 6 7 8 9 10 11 12');
      final Tuple2<String, String> keyPair =
          BlockChainService.generateKeys(bip32);

      final publicKey =
          decompressPublicKey(hexToBytes(keyPair.first)).sublist(1);

      final Uint8List messageHash =
          keccak256(Uint8List.fromList(utf8.encode('hello world')));

      final MsgSignature msgSignature =
          sign(messageHash, hexToBytes(keyPair.second));

      expect(isValidSignature(messageHash, msgSignature, publicKey), true);

      expect(ecRecover(messageHash, msgSignature), publicKey);
    });
  });
}
