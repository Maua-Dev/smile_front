import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smile_front/app/modules/auth/infra/datasource/auth_datasource_interface.dart';
import 'package:smile_front/app/modules/auth/infra/repositories/auth_repository_impl.dart';

import 'auth_repository_impl_test.mocks.dart';

@GenerateMocks([AuthDatasourceInterface])
void main() {
  late AuthRepositoryImpl authRepository;
  AuthDatasourceInterface datasource = MockAuthDatasourceInterface();

  var accessLevel = '';

  Map<String, dynamic> map = {};

  setUpAll(() {
    when(datasource.login('', '')).thenAnswer((_) async => map);
    when(datasource.refreshToken('')).thenAnswer((_) async => map);
    when(datasource.getAccessLevel('')).thenAnswer((_) async => accessLevel);
    authRepository = AuthRepositoryImpl(datasource: datasource);
  });

  test('login', () async {
    var response = await authRepository.login('', '');
    expect(response, map);
  });

  test('refreshToken', () async {
    var response = await authRepository.refreshToken('');
    expect(response, map);
  });

  test('getAccessLevel', () async {
    var response = await authRepository.getAccessLevel('');
    expect(response, accessLevel);
  });
}
