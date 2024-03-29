import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smile_front/app/modules/auth/infra/repositories/secure_storage.dart';
import 'package:smile_front/app/shared/entities/infra/user_roles_enum.dart';

import 'secure_storage_test.mocks.dart';

@GenerateMocks([Box])
void main() {
  late SecureStorage secureStorage;
  Box storage = MockBox();
  var accessToken = '123';
  var refreshToken = '123';
  var role = UserRolesEnum.STUDENT;
  var name = 'Teste';
  var socialName = 'Teste';
  var certificateWithSocialName = true;
  var id = '123';

  setUpAll(() async {
    secureStorage = await SecureStorage.instance();
    when(storage.get('accessToken')).thenAnswer((_) async => accessToken);
    when(storage.get('refreshToken')).thenAnswer((_) async => refreshToken);
    when(storage.get('accessLevel')).thenAnswer((_) async => role.name);
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

  test('saveRole', () async {
    await secureStorage.saveRole(role.name);
    String response = await storage.get('accessLevel');
    expect(response, role.name);
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
