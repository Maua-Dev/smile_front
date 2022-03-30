import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smile_front/app/modules/register/infra/datasources/register_datasource.dart';
import 'package:smile_front/app/shared/entities/user_registration.dart';
import 'register_repository_impl_test.mocks.dart';

@GenerateMocks([RegisterDatasource])
void main() {
  RegisterDatasource datasource = MockRegisterDatasource();
  var userInformations = UserRegistration(
      name: 'Caio Toledo',
      email: 'caio@caio.com',
      cpfRne: '63480154085',
      password: 'Teste123!',
      acceptEmails: true);

  setUpAll(() {
    when(datasource.registerUser(userInformations))
        .thenAnswer((_) async => 'User Caio Toledo created.');
  });
}
