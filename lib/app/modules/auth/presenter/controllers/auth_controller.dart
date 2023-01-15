import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/auth/domain/repositories/secure_storage_interface.dart';
import 'package:smile_front/app/modules/auth/usecases/login_with_cpf_rne.dart';

import '../../../../shared/services/firebase-analytics/firebase_analytics_service.dart';
import '../../usecases/refresh_token.dart';

class AuthController {
  final RefreshTokenInterface refreshToken;
  final LoginWithCpfRneInterface loginWithCpfRne;
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
    required this.loginWithCpfRne,
  });

  bool get isLogged => _loggedIn;
  String get accessLevel => _accessLevel;
  String get name => _name;
  String get socialname => _socialname ?? '';
  String get id => _id ?? '';
  bool get certificateWithSocialName => _certificateWithSocialName ?? false;

  Future<void> loginWithUserCpfRne(String cpfRne, String password) async {
    var loginResponse = await loginWithCpfRne(cpfRne,password);
    _accessLevel = loginResponse['access_level'];
    _name = loginResponse['name'];
    _socialname = loginResponse['social_name'];
    _certificateWithSocialName = loginResponse['certificate_with_social_name'];
    _id = loginResponse['id'];

    await storage.saveAccessToken(loginResponse['access_token']);
    await storage.saveRefreshToken(loginResponse['refresh_token']);
    await storage.saveAccessLevel(_accessLevel);
    await storage.saveName(_name);
    await storage.saveSocialName(_socialname ?? '');
    await storage.saveId(_id ?? '');
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
