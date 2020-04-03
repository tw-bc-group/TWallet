import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const MASTER_KEY_LENGTH = 32;
const STORAGE_KEY = 'master_key';
const AES_ENCRYPT_MODE = 'cbc';
const AES_ENCRYPT_PADDING = 'pkcs7';
const AES_ENCRYPT_IV = '1234567890123456';

enum SecureStorageItem {
  Identity,
  MasterKey,
}

extension _SecureStorageItemExtension on SecureStorageItem {
  String asKey() {
    return this.toString().toLowerCase();
  }
}

class SecureStorage {
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  Future<String> get(SecureStorageItem item) async {
    return await _storage.read(key: item.asKey());
  }

  Future<void> set(SecureStorageItem item, String value) {
    return _storage.write(key: item.asKey(), value: value);
  }
}
