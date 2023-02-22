abstract class SecureStorageInterface {
  Future<void> saveAccessToken(String token);
  Future<void> saveRefreshToken(String token);
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
  Future<void> saveRole(String role);
  Future<void> saveId(String id);
  Future<void> saveIdToken(String idToken);
  Future<void> saveName(String name);
  Future<void> saveSocialName(String socialName);
  Future<void> saveCertificateWithSocialName(bool certificateWithSocialName);
  Future<String?> getRole();
  Future<String?> getId();
  Future<String?> getIdToken();
  Future<String?> getName();
  Future<String?> getSocialName();
  Future<bool?> getCertificateWithSocialName();
  Future<void> cleanSecureStorage();
}
