import 'package:smile_front/app/shared/entities/user_registration.dart';

import '../domain/repositories/register_informations_repository_interface.dart';

abstract class RegisterUserInterface {
  Future<String> call(UserRegistration registerInformations);
}

class RegisterUser implements RegisterUserInterface {
  final RegisterRepositoryInterface repository;

  RegisterUser({required this.repository});

  @override
  Future<String> call(UserRegistration registerInformation) {
    return repository.registerUser(registerInformation);
  }
}
