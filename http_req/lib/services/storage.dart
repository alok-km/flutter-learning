import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final _storage = FlutterSecureStorage();

  void writeSecureData(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  Future readSecureData(String key) async {
    return await _storage.read(key: key);
  }

  void deleteSecureData(String key) async {
    await _storage.delete(key: key);
  }

  void readAllData() async {
    await _storage.readAll();
  }
}
