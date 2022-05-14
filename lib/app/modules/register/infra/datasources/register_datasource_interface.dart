import 'package:smile_front/app/shared/entities/user_registration.dart';

abstract class RegisterDatasourceInterface {
  Future<String> registerUser(UserRegistration userRegistration);
}
