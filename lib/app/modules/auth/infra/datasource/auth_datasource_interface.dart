abstract class AuthDatasourceInterface {
  Future<String> getAccessLevel(String user);
  Future<Map<String, dynamic>> login(String user, String password);
  Future<Map<String, dynamic>> refreshToken(String token);
}
