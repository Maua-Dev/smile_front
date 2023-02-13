import '../../../../shared/models/user_model.dart';

abstract class AuthDatasourceInterface {
  Future<String> getAccessLevel(String user);
  Future<UserModel> login(String user, String password);
  Future<Map<String, dynamic>> refreshToken(String token);
}
