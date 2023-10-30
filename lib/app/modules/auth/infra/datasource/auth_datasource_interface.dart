import '../../../../shared/infra/models/user_model.dart';

abstract class AuthDatasourceInterface {
  Future<UserModel> login(String user, String password);
  Future<Map<String, dynamic>> refreshToken();
}
