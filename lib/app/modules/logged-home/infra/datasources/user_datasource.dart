import 'package:smile_front/app/shared/models/user_model.dart';

abstract class UserDatasource {
  Future<UserModel> getLoggedUser(String cpfRne);
}
