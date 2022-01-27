abstract class ISecureStorage {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> cleanToken();
}
