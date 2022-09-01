import 'dart:convert';
import 'dart:typed_data';

import 'package:crypton/crypton.dart';
import 'package:encrypt/encrypt.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:more/tuple.dart';
import 'package:random_string/random_string.dart';
import 'package:tw_wallet_ui/models/eth_tx_info/eth_tx_info.dart';
import 'package:tw_wallet_ui/service/blockchain.dart';
import 'package:tw_wallet_ui/service/rlp.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/src/utils/rlp.dart' as rlp;

void main() {
  group('aes test', () {
    test(
        'when use aes key encrypt something, use same key decrypt should return same things',
        () {
      final String message =
          DateTime.now().millisecondsSinceEpoch.toRadixString(16);
      final String aesKey = randomString(16);
      final key = Key.fromUtf8(aesKey);
      final IV iv = IV.fromUtf8(randomString(16));
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

    test('when verify dcep signature, should verify success', () {
      final RSAPublicKey publicKey = RSAPublicKey.fromString(
        'MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAI5SXpw1SSsM3FN43JVKn4gb+oGXfjL7rCDluqydAyHZ8vV7ySqi8oM1CoHRC9U2ST7IldydsQ+4cjC9xfzexxcCAwEAAQ==',
      );

      expect(
        publicKey.verifySHA256Signature(
          Uint8List.fromList(
            utf8.encode('CB_100_00_1005445100500696096768'),
          ),
          base64.decode(
            'SvwfPo8ECILQMig/i89akHVMb7C/YML3ABPbIzzqYQDTYT/f5MyiGpfBWlnXPfT20Z1B2FIs3Kz6tKZlLhgLXg==',
          ),
        ),
        true,
      );
    });
  });

  group('ecdsa test', () {
    final Tuple2<String, String> keyPair =
        BlockChainService.keypairFromMnenomics('1 2 3 4 5 6 7 8 9 10 11 12');

    final publicKey = decompressPublicKey(hexToBytes(keyPair.first)).sublist(1);

    final Uint8List messageHash =
        keccak256(Uint8List.fromList(utf8.encode('hello world')));

    final MsgSignature msgSignature =
        sign(messageHash, hexToBytes(keyPair.second));

    final hexSignature = bytesToHex(
      rlp.encode([msgSignature.v, msgSignature.r, msgSignature.s]),
    );

    test('when use private key signed something, should verify success', () {
      expect(isValidSignature(messageHash, msgSignature, publicKey), true);
    });

    test(
        'when use private key signed something, should recovery the public key success',
        () {
      expect(ecRecover(messageHash, msgSignature), publicKey);
    });

    test('when use rlp decode the signature, should return correct r, s v', () {
      final List<Uint8List> decodeRlp = decode(hexToBytes(hexSignature));
      final BigInt v = bytesToInt(decodeRlp[0]);
      expect(v.toInt(), msgSignature.v);
      final BigInt r = bytesToInt(decodeRlp[1]);
      expect(r, msgSignature.r);
      final BigInt s = bytesToInt(decodeRlp[2]);
      expect(s, msgSignature.s);
    });

    test(
        'when verify signed tx raw data, should recovery the public key success',
        () {
      final encoded = hexToBytes(
        '0xf8c50180830493e0946b5ae192e2162e4c92cb306a2fb6c0c6cc05fa7a80b86442842e0e0000000000000000000000009d79341d8c30c62306883dcf19be536574e9b2dc000000000000000000000000ab115b8c0a27e5e35f4438be928c7aec7779b38543425f3130305f30305f3130303830363336363031313834333630333736333237a01782f963367a95a3c3504f791c08b8328f32284189fbfe69bfe64a6712c7b29ea07f77896370a9c4b1d0e7bf83eadd93d7d4ee0247f50bb90243304c7b167e07a0',
      );

      final List<Uint8List> decodedRlp = decode(encoded);

      final EthTxInfo ethTxInfo = EthTxInfo.fromDecodedRlp(decodedRlp);

      expect(
        ethTxInfo.messageHash,
        hexToBytes(
          '2ea7daed5c33bec3bd0bf8559f8e5f671fc38e927b4087dd2065db22f204ce99',
        ),
      );

      expect(
        ethTxInfo.recoverPublicKey(),
        '85c26b6182946f3354174ade4c48fc769d07fb16839f8f58ce9a5f4f15354037fce9ce5b6e2bc413188c6ba201300265bdd1c075c4152dd3b01613b03a580a4d',
      );
    });
  });
}
