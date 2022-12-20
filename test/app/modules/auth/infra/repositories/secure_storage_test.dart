import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smile_front/app/modules/auth/infra/repositories/secure_storage.dart';

import 'secure_storage_test.mocks.dart';

@GenerateMocks([Box, SecureStorage])
void main() {
  late SecureStorage secureStorage;
  Box storage = MockBox();
  var accessToken = '123';
  var refreshToken = '123';
  var accessLevel = 'ADMIN';
  var name = 'Teste';
  var socialName = 'Teste';
  var certificateWithSocialName = true;
  var id = '123';

  setUpAll(() async {
    secureStorage = MockSecureStorage();
    when(storage.get('accessToken')).thenAnswer((_) async => accessToken);
    when(storage.get('refreshToken')).thenAnswer((_) async => refreshToken);
    when(storage.get('accessLevel')).thenAnswer((_) async => accessLevel);
    when(storage.get('name')).thenAnswer((_) async => name);
    when(storage.get('socialName')).thenAnswer((_) async => socialName);
    when(storage.get('certificateWithSocialName'))
        .thenAnswer((_) async => certificateWithSocialName);
    when(storage.get('id')).thenAnswer((_) async => id);
  });

  test('saveAccessToken', () async {
    await secureStorage.saveAccessToken(accessToken);
    String response = await storage.get('accessToken');
    expect(response, accessToken);
  });

  test('saveRefreshToken', () async {
    await secureStorage.saveRefreshToken(refreshToken);
    String response = await storage.get('refreshToken');
    expect(response, refreshToken);
  });

  test('saveAccessLevel', () async {
    await secureStorage.saveAccessLevel(accessLevel);
    String response = await storage.get('accessLevel');
    expect(response, accessLevel);
  });

  test('saveName', () async {
    await secureStorage.saveName(name);
    String response = await storage.get('name');
    expect(response, name);
  });

  test('saveSocialName', () async {
    await secureStorage.saveSocialName(socialName);
    String response = await storage.get('socialName');
    expect(response, socialName);
  });

  test('saveCertificateWithSocialName', () async {
    await secureStorage
        .saveCertificateWithSocialName(certificateWithSocialName);
    bool response = await storage.get('certificateWithSocialName');
    expect(response, certificateWithSocialName);
  });

  test('saveId', () async {
    await secureStorage.saveId(id);
    String response = await storage.get('id');
    expect(response, id);
  });
}
