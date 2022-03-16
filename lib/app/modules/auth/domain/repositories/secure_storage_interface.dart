abstract class SecureStorageInterface {
  Future<void> saveAccessToken(String token);
  Future<void> saveRefreshToken(String token);
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
  Future<void> saveAccessLevel(String accessLevel);
  Future<String?> getAccessLevel();
  Future<void> cleanSecureStorage();
}
