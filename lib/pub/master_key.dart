import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:random_string/random_string.dart';
import 'package:steel_crypt/steel_crypt.dart';

const MASTER_KEY_LENGTH = 32;
const STORAGE_KEY = 'master_key';
const AES_ENCRYPT_MODE = 'cbc';
const AES_ENCRYPT_PADDING = 'pkcs7';
const AES_ENCRYPT_IV = '1234567890123456';

class MasterKey {
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  Future<String> read() async {
    return await _storage.read(key: STORAGE_KEY);
  }

  Future<void> setNewKey({@required String pin}) async {
    String masterKey = randomString(MASTER_KEY_LENGTH);
    var crypt = AesCrypt(masterKey, AES_ENCRYPT_MODE, AES_ENCRYPT_PADDING);
    var encrypt = crypt.encrypt(masterKey, AES_ENCRYPT_IV);
    _storage.write(key: STORAGE_KEY, value: encrypt);
    return;
  }
}
