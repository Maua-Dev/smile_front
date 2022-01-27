import 'package:hive_flutter/hive_flutter.dart';
import 'package:smile_front/app/modules/auth/repositories/secure_storage_interface.dart';

class SecureStorage implements ISecureStorage {
  final Box storage;

  SecureStorage._(this.storage);

  static Future<SecureStorage> instance() async {
    await Hive.initFlutter();
    return SecureStorage._(await Hive.openBox('box'));
  }

  @override
  Future<String?> getToken() async {
    return await storage.get('accessToken') as String?;
  }

  @override
  Future<void> saveToken(String token) async {
    await storage.put('accessToken', token);
  }

  @override
  Future<void> cleanToken() async {
    await storage.clear();
  }
}
