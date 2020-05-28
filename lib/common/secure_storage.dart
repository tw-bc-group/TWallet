import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum SecureStorageItem {
  masterKey,
  mnemonics,
}

extension _SecureStorageItemExtension on SecureStorageItem {
  String asKey() {
    return toString().toLowerCase();
  }
}

class SecureStorage {
  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  static Future<String> get(SecureStorageItem item) async {
    return _storage.read(key: item.asKey());
  }

  static Future<void> set(SecureStorageItem item, String value) {
    return _storage.write(key: item.asKey(), value: value);
  }

  static Future<void> delete(SecureStorageItem item) {
    return _storage.delete(key: item.asKey());
  }

  static Future<void> clearAll() async {
    for (final item in SecureStorageItem.values) {
      await _storage.delete(key: item.asKey());
    }
  }

  static Future<bool> hasMnemonics() {
    return SecureStorage.get(SecureStorageItem.mnemonics)
        .then((res) => res != null);
  }
}
