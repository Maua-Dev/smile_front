import 'package:firebase_analytics/firebase_analytics.dart';

class FirebaseAnalyticsService {
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  FirebaseAnalyticsObserver getAnalyticsObserver() =>
      FirebaseAnalyticsObserver(analytics: analytics);

  Future setUserProperties(String userId) async {
    await analytics.setUserId(id: userId);
  }

  Future logLogin() async {
    await analytics.logLogin(loginMethod: 'email');
  }

  Future logSignUp() async {
    await analytics.logSignUp(signUpMethod: 'email');
  }
}
