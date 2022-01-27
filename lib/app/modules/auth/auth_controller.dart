import 'package:smile_front/app/modules/auth/repositories/auth_repository_interface.dart';
import 'package:smile_front/app/modules/auth/repositories/secure_storage_interface.dart';

class AuthController {
  final IAuthRepository repository;
  final ISecureStorage storage;
  bool _loggedIn = false;

  AuthController({required this.repository, required this.storage});

  bool get isLogged => _loggedIn;

  Future<void> loginWithEmail(
      String email, String password, bool persistence) async {
    var token = await repository.loginWithEmail(email, password);
    if (persistence) {
      await storage.saveToken(token);
    }
    _loggedIn = true;
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
    } catch (e) {
      _loggedIn = false;
    }
  }

  Future<void> logout() async {
    await storage.cleanToken();
    _loggedIn = false;
  }
}
