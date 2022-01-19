import 'package:smile_front/app/modules/register/domain/entities/register_informations.dart';

abstract class RegisterUserRepository {
  Future<String> registerUser(RegisterInformations registerInformations);
}
