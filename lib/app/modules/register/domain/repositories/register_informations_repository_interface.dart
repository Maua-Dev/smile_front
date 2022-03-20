import '../../../../shared/entities/user_registration.dart';

abstract class RegisterRepositoryInterface {
  Future<String> registerUser(UserRegistration userRegistration);
}
