import 'package:smile_front/app/shared/domain/entities/user_registration.dart';

abstract class RegisterDatasourceInterface {
  Future<String> registerUser(UserRegistration userRegistration);
}
