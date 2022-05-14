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

  Future logViewActivity(String activityCode) async {
    await analytics.logEvent(
        name: 'view_activity', parameters: {'activity_code': activityCode});
  }

  Future logChangePassword() async {
    await analytics.logEvent(name: 'change_password');
  }

  Future logFaq(int id) async {
    await analytics.logEvent(name: 'faq_open', parameters: {'faq_id': id});
  }
}
