import 'package:smile_front/app/modules/register/domain/entities/register_informations.dart';
import 'package:smile_front/app/modules/register/domain/repositories/register_informations_repository.dart';

class RegisterUserRepositoryMock implements RegisterUserRepository {
  @override
  Future<String> registerUser(RegisterInformations registerInformations) async {
    return 'Registered';
  }
}
