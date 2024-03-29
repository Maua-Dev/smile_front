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
  Future<void> savePhone(String phone);
  Future<void> saveCertificateWithSocialName(bool certificateWithSocialName);
  Future<void> saveAcceptSMSNotifications(bool acceptSMSNotifications);
  Future<void> saveAcceptEmailNotifications(bool acceptEmailNotifications);
  Future<void> saveEmail(String email);
  Future<String?> getRole();
  Future<String?> getId();
  Future<String?> getIdToken();
  Future<String?> getName();
  Future<String?> getSocialName();
  Future<String?> getPhone();
  Future<String?> getEmail();
  Future<void> deleteAll();
  Future<bool?> getAcceptSMSNotifications();
  Future<bool?> getAcceptEmailNotifications();
  Future<bool?> getCertificateWithSocialName();
  Future<void> cleanSecureStorage();
  Future<void> saveActivityCode(String activityCode);
  Future<String?> getActivityCode();
  Future<void> saveNavBarIndex(int navBarIndex);
  Future<int?> getNavBarIndex();
}
