import 'package:smile_front/app/modules/register/domain/entities/register_informations.dart';
import 'package:smile_front/app/modules/register/domain/repositories/register_informations_repository.dart';

class RegisterUserController {
  final RegisterUserRepository repository;

  RegisterUserController({
    required this.repository,
  });

  Future<void> registerUser(RegisterInformations registerInformations) async {
    await repository.registerUser(registerInformations);
  }
}
