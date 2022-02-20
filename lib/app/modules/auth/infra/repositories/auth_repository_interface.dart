abstract class IAuthRepository {
  Future<Map<String, dynamic>> loginWithEmail(String email, String password);
  Future<String> refreshToken(String token);
}
