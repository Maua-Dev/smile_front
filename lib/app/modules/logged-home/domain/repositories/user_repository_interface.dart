import 'package:smile_front/app/shared/models/user_model.dart';

abstract class UserRepositoryInterface {
  Future<UserModel> getUser(String cpfRne);
}
