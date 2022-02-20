import 'package:smile_front/app/modules/auth/repositories/auth_repository_interface.dart';
import 'package:smile_front/app/modules/auth/repositories/secure_storage_interface.dart';

class AuthController {
  final IAuthRepository repository;
  final ISecureStorage storage;
  bool _loggedIn = false;
  int _accessLevel = 0;

  AuthController({required this.repository, required this.storage});

  bool get isLogged => _loggedIn;
  int get accessLevel => _accessLevel;

  Future<void> loginWithEmail(
      String email, String password, bool persistence) async {
    var loginResponse = await repository.loginWithEmail(email, password);
    if (persistence) {
      await storage.saveToken(loginResponse['token']);
    }
    _loggedIn = true;
    _accessLevel = loginResponse['accessLevel'];
    await storage.saveAccessLevel(loginResponse['accessLevel']);
  }

  Future<void> refreshToken() async {
    var token = await storage.getToken();
    if (token == null) {
      _loggedIn = false;
      return;
    }
    try {
      token = await repository.refreshToken(token);
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
