abstract class IAuthRepository {
  Future<String> loginWithEmail(String email, String password);
  Future<String> refreshToken(String token);
}
