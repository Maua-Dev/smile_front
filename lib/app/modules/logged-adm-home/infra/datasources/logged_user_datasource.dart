import 'package:smile_front/app/shared/entities/user.dart';

abstract class LoggedAdmDatasource {
  Future<User> getLoggedUser();
}
