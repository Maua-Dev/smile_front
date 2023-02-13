import '../../../../shared/models/user_model.dart';

abstract class AuthRepositoryInterface {
  Future<UserModel> login(String user, String password);
  Future<Map<String, dynamic>> refreshToken(String token);
  Future<String> getAccessLevel(String user);
}
