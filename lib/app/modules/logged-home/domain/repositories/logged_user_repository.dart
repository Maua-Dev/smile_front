import 'package:smile_front/app/modules/logged-home/domain/entities/logged_user.dart';

abstract class LoggedUserRepository {
  Future<LoggedUser> getLoggedUser();
}
