import 'package:smile_front/app/modules/auth/domain/repositories/access_level_repository_interface.dart';
import 'package:smile_front/app/modules/auth/infra/repositories/auth_repository_interface.dart';
import 'package:smile_front/app/modules/auth/infra/repositories/secure_storage_interface.dart';

class AuthController {
  final IAuthRepository authRepository;
  final AccessLevelRepositoryInterface repository;
  final ISecureStorage storage;
  bool _loggedIn = false;
  String _accessLevel = 'USER';

  AuthController(
      {required this.authRepository,
      required this.storage,
      required this.repository});

  bool get isLogged => _loggedIn;
  String get accessLevel => _accessLevel;

  Future<void> loginWithCpfRne(
      String cpfRne, String password, bool persistence) async {
    var loginResponse = await authRepository.loginWithEmail(cpfRne, password);
    //_accessLevel = await repository.getAccessLevel(cpfRne);
    if (persistence) {
      await storage.saveToken(loginResponse['token']);
      await storage.saveAccessLevel(accessLevel);
    }
    _loggedIn = true;
    _accessLevel = loginResponse['accessLevel'];
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
