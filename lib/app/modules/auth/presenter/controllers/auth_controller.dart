import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/auth/domain/repositories/secure_storage_interface.dart';
import 'package:smile_front/app/modules/auth/domain/usecases/login_with_email.dart';
import '../../../../shared/services/firebase-analytics/firebase_analytics_service.dart';
import '../../domain/usecases/refresh_token.dart';

class AuthController {
  final RefreshTokenInterface refreshToken;
  final LoginWithEmailInterface loginWithEmail;
  final SecureStorageInterface storage;
  final FirebaseAnalyticsService analytics;
  bool _loggedIn = false;
  String _accessLevel = '';
  String _name = '';
  String? _socialname = '';
  String? _id = '';
  bool? _certificateWithSocialName = false;

  AuthController({
    required this.analytics,
    required this.storage,
    required this.refreshToken,
    required this.loginWithEmail,
  });

  bool get isLogged => _loggedIn;
  String get accessLevel => _accessLevel;
  String get name => _name;
  String get socialname => _socialname ?? '';
  String get id => _id ?? '';
  bool get certificateWithSocialName => _certificateWithSocialName ?? false;

  Future<void> loginWithUserEmail(String email, String password) async {
    var loginResponse = await loginWithEmail(email, password);
    _accessLevel = loginResponse.accessLevel.name;
    _name = loginResponse.name;
    _socialname = loginResponse.socialName;
    _certificateWithSocialName = loginResponse.certificateWithSocialName;
    _id = loginResponse.userId;

    await storage.saveAccessToken(loginResponse.accessToken);
    await storage.saveRefreshToken(loginResponse.refreshToken);
    await storage.saveAccessLevel(_accessLevel);
    await storage.saveName(_name);
    await storage.saveSocialName(_socialname ?? '');
    await storage.saveId(_id ?? '');
    await storage.saveIdToken(loginResponse.idToken);
    await storage
        .saveCertificateWithSocialName(_certificateWithSocialName ?? false);
    await analytics.setUserProperties(await storage.getId() ?? '');

    _loggedIn = true;
  }

  Future<void> refreshUserToken() async {
    var token = await storage.getRefreshToken();
    if (token == null) {
      _loggedIn = false;
      return;
    }
    try {
      var tokens = await refreshToken(token);
      await storage.saveAccessToken(tokens['access_token']);
      await storage.saveRefreshToken(tokens['refresh_token']);
      _loggedIn = true;

      var accessLevel = await storage.getAccessLevel();
      _accessLevel = accessLevel!;
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
      var accessLevel = await storage.getAccessLevel();
      var accessToken = await storage.getAccessToken();
      var refreshToken = await storage.getRefreshToken();
      if (accessToken!.isNotEmpty &&
          accessLevel!.isNotEmpty &&
          refreshToken!.isNotEmpty) {
        _loggedIn = true;
        _accessLevel = accessLevel;
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
