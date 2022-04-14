import 'package:smile_front/app/modules/auth/domain/repositories/auth_repository_interface.dart';
import 'package:smile_front/app/modules/auth/domain/repositories/secure_storage_interface.dart';

class AuthController {
  final AuthRepositoryInterface authRepository;
  final SecureStorageInterface storage;
  bool _loggedIn = false;
  String _accessLevel = '';
  String _name = '';
  String? _socialname = '';
  bool? _certificateWithSocialName = false;

  AuthController({
    required this.authRepository,
    required this.storage,
  });

  bool get isLogged => _loggedIn;
  String get accessLevel => _accessLevel;
  String get name => _name;
  String get socialname => _socialname ?? '';
  bool get certificateWithSocialName => _certificateWithSocialName ?? false;

  Future<void> loginWithCpfRne(String cpfRne, String password) async {
    var loginResponse = await authRepository.login(cpfRne, password);
    _accessLevel = loginResponse['access_level'];
    _name = loginResponse['name'];
    _socialname = loginResponse['social_name'];
    _certificateWithSocialName = loginResponse['certificate_with_social_name'];

    await storage.saveAccessToken(loginResponse['access_token']);
    await storage.saveRefreshToken(loginResponse['refresh_token']);
    await storage.saveAccessLevel(_accessLevel);
    await storage.saveName(_name);
    await storage
        .saveCertificateWithSocialName(_certificateWithSocialName ?? false);

    _loggedIn = true;
  }

  Future<void> refreshToken() async {
    var token = await storage.getRefreshToken();
    if (token == null) {
      _loggedIn = false;
      return;
    }
    try {
      var tokens = await authRepository.refreshToken(token);
      await storage.saveAccessToken(tokens['access_token']);
      await storage.saveRefreshToken(tokens['refresh_token']);
      _loggedIn = true;

      var accessLevel = await storage.getAccessLevel();
      _accessLevel = accessLevel!;
    } catch (e) {
      _loggedIn = false;
    }
  }

  Future<void> logout() async {
    await storage.cleanSecureStorage();
    _loggedIn = false;
  }
}
