import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smile_front/app/modules/auth/infra/datasource/auth_datasource_interface.dart';
import 'package:smile_front/app/modules/auth/infra/repositories/auth_repository_impl.dart';
import 'package:smile_front/app/shared/entities/infra/access_level_enum.dart';
import 'package:smile_front/app/shared/entities/infra/user_roles_enum.dart';
import 'package:smile_front/app/shared/models/user_model.dart';

import 'auth_repository_impl_test.mocks.dart';

@GenerateMocks([AuthDatasourceInterface])
void main() {
  late AuthRepositoryImpl authRepository;
  AuthDatasourceInterface datasource = MockAuthDatasourceInterface();

  UserModel userMock = UserModel(
    socialName: '',
    accessLevel: AccessLevelEnum.USER,
    email: 'email',
    role: UserRolesEnum.student,
    name: 'name',
    accessToken: 'access_token',
    idToken: 'id_token',
    phone: 'phone',
    refreshToken: 'refresh',
    userId: 'id',
    ra: 'ra',
    certificateWithSocialName: true,
  );

  setUpAll(() {
    when(datasource.login('', '')).thenAnswer((_) async => userMock);
    when(datasource.refreshToken('')).thenAnswer((_) async => {});
    authRepository = AuthRepositoryImpl(datasource: datasource);
  });

  test('login', () async {
    var response = await authRepository.login('', '');
    expect(response, {});
  });

  test('refreshToken', () async {
    var response = await authRepository.refreshToken('');
    expect(response, {});
  });
}
