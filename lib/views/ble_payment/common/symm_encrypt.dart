import 'dart:typed_data';

import 'package:encrypt/encrypt.dart';

class SymmEncrypt {
  Encrypter? encrypter;
  IV? iv;

  SymmEncrypt(String key, String ivString) {
    iv = IV.fromUtf8(ivString);
    encrypter = Encrypter(AES(Key.fromUtf8(key)));
  }

  Uint8List encrypt(Uint8List data) {
    return encrypter!.encryptBytes(data, iv: iv).bytes;
  }

  Uint8List decrypt(Uint8List encryptedData) {
    return Uint8List.fromList(
      encrypter!.decryptBytes(Encrypted(encryptedData), iv: iv),
    );
  }
}
