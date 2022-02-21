abstract class SecureStorageInterface {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> saveAccessLevel(String accessLevel);
  Future<String?> getAccessLevel();
  Future<void> cleanSecureStorage();
}
