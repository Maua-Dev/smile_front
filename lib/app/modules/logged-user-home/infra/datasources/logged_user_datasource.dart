import 'package:smile_front/app/shared/entities/user.dart';

abstract class LoggedUserDatasource {
  Future<User> getLoggedUser();
}
