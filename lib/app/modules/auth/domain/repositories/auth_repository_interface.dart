abstract class AuthRepositoryInterface {
  Future<Map<String, dynamic>> login(String user, String password);
  Future<Map<String, dynamic>> refreshToken(String token);
  Future<String> getAccessLevel(String user);
}
