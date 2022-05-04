import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/auth/domain/repositories/auth_repository_interface.dart';
import 'package:smile_front/app/modules/auth/domain/repositories/secure_storage_interface.dart';

import '../../../../shared/services/firebase-analytics/firebase_analytics_service.dart';

class AuthController {
  final AuthRepositoryInterface authRepository;
  final SecureStorageInterface storage;
  final FirebaseAnalyticsService analytics;

  bool _loggedIn = false;
  String _accessLevel = '';
  String _name = '';
  String? _socialname = '';
  bool? _certificateWithSocialName = false;

  AuthController(
      {required this.authRepository,
      required this.storage,
      required this.analytics});

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
    await storage.saveSocialName(_socialname ?? '');
    await storage
        .saveCertificateWithSocialName(_certificateWithSocialName ?? false);
    await analytics.setUserProperties(loginResponse['access_token']);
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
