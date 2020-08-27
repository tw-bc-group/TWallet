import 'package:crypton/crypton.dart';
import 'package:encrypt/encrypt.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:random_string/random_string.dart';

void main() {
  test("when generate rsa keys, should return correct rsa keys", () async {
    final RSAKeypair keyPair = RSAKeypair.fromRandom();
    final String message =
        DateTime.now().millisecondsSinceEpoch.toRadixString(16);
    final String rsaEncrypted = keyPair.publicKey.encrypt(message);
    String decrypted = keyPair.privateKey.decrypt(rsaEncrypted);
    expect(message, decrypted);

    final String aesKey = randomString(16);
    final key = Key.fromUtf8(aesKey);
    final IV iv = IV.fromUtf8(aesKey);
    final Encrypter encrypter = Encrypter(AES(key));
    final Encrypted aesEncrypted = encrypter.encrypt(message, iv: iv);
    decrypted = encrypter.decrypt(aesEncrypted, iv: iv);
    expect(message, decrypted);
  });
}
