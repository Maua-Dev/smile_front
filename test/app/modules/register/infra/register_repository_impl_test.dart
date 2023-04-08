import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smile_front/app/modules/register/infra/datasources/register_datasource_interface.dart';
import 'package:smile_front/app/modules/register/infra/repository/register_repository_impl.dart';
import 'package:smile_front/app/shared/entities/infra/access_level_enum.dart';
import 'package:smile_front/app/shared/entities/infra/user_roles_enum.dart';
import 'package:smile_front/app/shared/entities/user_registration.dart';
import 'register_repository_impl_test.mocks.dart';

@GenerateMocks([RegisterDatasourceInterface])
void main() {
  late RegisterRepositoryImpl repository;
  RegisterDatasourceInterface datasource = MockRegisterDatasourceInterface();
  var userInformations = UserRegistration(
    name: 'name',
    socialName: 'socialName',
    email: 'email',
    ra: 'ra',
    password: 'password',
    acceptTerms: true,
    acceptEmailNotifications: true,
    accessLevel: AccessLevelEnum.USER,
    certificateWithSocialName: true,
    role: UserRolesEnum.STUDENT,
  );
  var res = 'User Caio Toledo created.';

  setUpAll(() {
    when(datasource.registerUser(userInformations))
        .thenAnswer((_) async => res);
    repository = RegisterRepositoryImpl(datasource: datasource);
  });

  test('registerUser', () async {
    var response = await repository.registerUser(userInformations);
    expect(response, res);
  });
}
