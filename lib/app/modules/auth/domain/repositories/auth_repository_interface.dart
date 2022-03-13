abstract class AuthRepositoryInterface {
  Future<Map<String, dynamic>> login(String user, String password);
  Future<String> refreshToken(String token);
  Future<String> getAccessLevel(String user);
}
