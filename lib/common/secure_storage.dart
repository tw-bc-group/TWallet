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
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<String?> get(SecureStorageItem item) async {
    return _storage.read(key: item.asKey());
  }

  Future<void> set(SecureStorageItem item, String value) {
    return _storage.write(key: item.asKey(), value: value);
  }

  Future<void> delete(SecureStorageItem item) {
    return _storage.delete(key: item.asKey());
  }

  Future<void> clearAll() async {
    for (final item in SecureStorageItem.values) {
      await _storage.delete(key: item.asKey());
    }
  }

  Future<bool> hasMnemonics() {
    return get(SecureStorageItem.mnemonics).then((res) => res != null);
  }
}
