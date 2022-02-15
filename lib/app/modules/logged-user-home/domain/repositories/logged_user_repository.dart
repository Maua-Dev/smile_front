import 'package:smile_front/app/shared/entities/user.dart';

abstract class LoggedUserRepository {
  Future<User> getLoggedUser();
}
