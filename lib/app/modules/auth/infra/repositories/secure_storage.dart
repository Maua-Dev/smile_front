import 'package:hive_flutter/hive_flutter.dart';
import '../../domain/repositories/secure_storage_interface.dart';

class SecureStorage implements SecureStorageInterface {
  final Box storage;

  SecureStorage._(this.storage);

  static Future<SecureStorage> instance() async {
    await Hive.initFlutter();
    return SecureStorage._(await Hive.openBox('box'));
  }

  @override
  Future<String?> getAccessToken() async {
    return await storage.get('accessToken') as String?;
  }

  @override
  Future<String?> getRefreshToken() async {
    return await storage.get('refreshToken') as String?;
  }

  @override
  Future<void> saveAccessToken(String token) async {
    await storage.put('accessToken', token);
  }

  @override
  Future<void> saveRefreshToken(String token) async {
    await storage.put('refreshToken', token);
  }

  @override
  Future<void> cleanSecureStorage() async {
    await storage.clear();
  }

  @override
  Future<String?> getRole() async {
    return await storage.get('role') as String?;
  }

  @override
  Future<void> saveRole(String role) async {
    await storage.put('role', role);
  }

  @override
  Future<String?> getName() async {
    return await storage.get('name') as String?;
  }

  @override
  Future<String?> getSocialName() async {
    return await storage.get('socialName') as String?;
  }

  @override
  Future<void> saveName(String name) async {
    await storage.put('name', name);
  }

  @override
  Future<void> saveSocialName(String socialName) async {
    await storage.put('socialName', socialName);
  }

  @override
  Future<bool?> getCertificateWithSocialName() async {
    return await storage.get('certificateWithSocialName') as bool?;
  }

  @override
  Future<void> saveCertificateWithSocialName(
      bool certificateWithSocialName) async {
    await storage.put('certificateWithSocialName', certificateWithSocialName);
  }

  @override
  Future<String?> getId() async {
    return await storage.get('id');
  }

  @override
  Future<void> saveId(String id) async {
    await storage.put('id', id);
  }

  @override
  Future<String?> getIdToken() async {
    return await storage.get('idToken');
  }

  @override
  Future<void> saveIdToken(String idToken) async {
    await storage.put('idToken', idToken);
  }

  @override
  Future<String?> getPhone() async {
    return await storage.get('phone');
  }

  @override
  Future<void> savePhone(String phone) async {
    await storage.put('phone', phone);
  }

  @override
  Future<void> saveAcceptSMSNotifications(bool acceptSMSNotifications) async {
    await storage.put('acceptSMSNotifications', acceptSMSNotifications);
  }

  @override
  Future<bool?> getAcceptSMSNotifications() async {
    return await storage.get('acceptSMSNotifications');
  }

  @override
  Future<void> saveAcceptEmailNotifications(
      bool acceptEmailNotifications) async {
    await storage.put('acceptEmailNotifications', acceptEmailNotifications);
  }

  @override
  Future<bool?> getAcceptEmailNotifications() async {
    return await storage.get('acceptEmailNotifications');
  }
}
