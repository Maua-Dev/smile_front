import 'package:smile_front/app/modules/auth/domain/repositories/auth_repository_interface.dart';
import 'package:smile_front/app/modules/auth/domain/repositories/secure_storage_interface.dart';

class AuthController {
  final AuthRepositoryInterface authRepository;
  final SecureStorageInterface storage;
  bool _loggedIn = false;
  String _accessLevel = '';

  AuthController({
    required this.authRepository,
    required this.storage,
  });

  bool get isLogged => _loggedIn;
  String get accessLevel => _accessLevel;

  Future<void> loginWithCpfRne(String cpfRne, String password) async {
    var loginResponse = await authRepository.login(cpfRne, password);
    _accessLevel = loginResponse.entries.last.toString();

    await storage.saveToken(loginResponse['access_token']);
    await storage.saveAccessLevel(_accessLevel);

    _loggedIn = true;
    _accessLevel = loginResponse['access_level'];
  }

  Future<void> refreshToken() async {
    var token = await storage.getToken();
    if (token == null) {
      _loggedIn = false;
      return;
    }
    try {
      token = await authRepository.refreshToken(token);
      await storage.saveToken(token);
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
