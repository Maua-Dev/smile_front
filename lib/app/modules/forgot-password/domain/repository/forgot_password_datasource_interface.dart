abstract class ForgotPasswordRepositoryInterface {
  Future<String> forgotPassword(String username);
  Future<String> changePassword(String username, String password, String code);
}
