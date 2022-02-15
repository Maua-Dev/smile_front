import 'package:smile_front/app/shared/entities/user.dart';

abstract class LoggedAdmRepository {
  Future<User> getLoggedUser();
}
