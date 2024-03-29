import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/auth/domain/repositories/secure_storage_interface.dart';
import 'package:smile_front/app/modules/auth/domain/usecases/login_with_email.dart';
import '../../domain/usecases/refresh_token.dart';

class AuthController {
  final RefreshTokenInterface refreshToken;
  final LoginWithEmailInterface loginWithEmail;
  final SecureStorageInterface storage;
  bool _loggedIn = false;
  String _role = '';
  String _name = '';
  String? _socialname = '';
  String? _id = '';
  String? _email = '';
  bool? _certificateWithSocialName = false;
  bool? _acceptEmailNotificiations = false;

  AuthController({
    required this.storage,
    required this.refreshToken,
    required this.loginWithEmail,
  });

  bool get acceptEmailNotificiations => _acceptEmailNotificiations ?? false;
  bool get isLogged => _loggedIn;
  String get role => _role;
  String get name => _name;
  String get socialname => _socialname ?? '';
  String get id => _id ?? '';
  String get email => _email ?? '';
  bool get certificateWithSocialName => _certificateWithSocialName ?? false;

  Future<void> loginWithUserEmail(String email, String password) async {
    var loginResponse = await loginWithEmail(email, password);
    _role = loginResponse.role.name.toUpperCase();
    _name = loginResponse.name;
    _socialname = loginResponse.socialName;
    _certificateWithSocialName = loginResponse.certificateWithSocialName;
    _acceptEmailNotificiations = loginResponse.acceptEmailNotifications;
    _id = loginResponse.userId;
    _email = loginResponse.email;

    await storage.saveAccessToken(loginResponse.accessToken);
    await storage.saveRefreshToken(loginResponse.refreshToken);
    await storage.saveIdToken(loginResponse.idToken);
    await storage.saveRole(_role);
    await storage.saveName(_name);
    await storage.saveSocialName(loginResponse.socialName ?? '');
    await storage.saveId(loginResponse.userId);
    await storage.saveIdToken(loginResponse.idToken);
    await storage
        .saveCertificateWithSocialName(_certificateWithSocialName ?? false);
    await storage
        .saveAcceptEmailNotifications(_acceptEmailNotificiations ?? false);
    await storage.saveEmail(_email ?? '');

    _loggedIn = true;
  }

  Future<void> refreshUserToken() async {
    var token = await storage.getRefreshToken();
    if (token == null) {
      _loggedIn = false;
      return;
    }
    try {
      var tokens = await refreshToken();
      await storage.saveAccessToken(tokens['access_token']);
      await storage.saveRefreshToken(tokens['refresh_token']);
      await storage.saveIdToken(tokens['id_token']);
      _loggedIn = true;

      var role = await storage.getRole();
      _role = role!;
    } catch (e) {
      _loggedIn = false;
      Modular.to.navigate("/login");
    }
  }

  Future<void> logout() async {
    await storage.cleanSecureStorage();
    _loggedIn = false;
  }

  Future<void> verifyIfHaveTokens() async {
    try {
      var accessLevel = await storage.getRole();
      var accessToken = await storage.getAccessToken();
      var refreshToken = await storage.getRefreshToken();
      if (accessToken!.isNotEmpty &&
          accessLevel!.isNotEmpty &&
          refreshToken!.isNotEmpty) {
        _loggedIn = true;
        _role = accessLevel;
      } else {
        _loggedIn = false;
        Modular.to.navigate("/login");
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
