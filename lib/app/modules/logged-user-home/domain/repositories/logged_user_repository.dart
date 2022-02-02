import 'package:smile_front/app/modules/logged-adm-home/domain/entities/logged_user.dart';

abstract class LoggedUserRepository {
  Future<LoggedUser> getLoggedUser();
}
