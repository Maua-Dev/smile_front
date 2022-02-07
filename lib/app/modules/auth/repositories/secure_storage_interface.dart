abstract class ISecureStorage {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> saveAccessLevel(int accessLevel);
  Future<int?> getAccessLevel();
  Future<void> cleanSecureStorage();
}
