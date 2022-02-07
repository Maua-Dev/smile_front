import 'package:smile_front/app/modules/logged-adm-home/domain/entities/logged_user.dart';

abstract class LoggedAdmRepository {
  Future<LoggedUser> getLoggedUser();
}
