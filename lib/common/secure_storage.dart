import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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
  static final FlutterSecureStorage _storage = FlutterSecureStorage();

  static Future<String> get(SecureStorageItem item) async {
    return await _storage.read(key: item.asKey());
  }

  static Future<void> set(SecureStorageItem item, String value) {
    return _storage.write(key: item.asKey(), value: value);
  }

  static Future<void> delete(SecureStorageItem item) {
    return _storage.delete(key: item.asKey());
  }
}
