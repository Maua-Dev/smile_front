import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/user_dashboard_controller.dart';

import '../../../../auth/domain/repositories/secure_storage_interface.dart';
import '../../../domain/usecases/subscribe_activities.dart';
import '../../../domain/usecases/unsubscribe_activities.dart';

part 'user_subscription_controller.g.dart';

class UserSubscriptionController = UserSubscriptionControllerBase
    with _$UserSubscriptionController;

abstract class UserSubscriptionControllerBase with Store {
  final UserDashboardController userDashboardController;
  final SecureStorageInterface secureStorage;
  final SubscribeActivityInterface subscribeActivity;
  final UnsubscribeActivityInterface unsubscribeActivity;

  UserSubscriptionControllerBase(
      {required this.secureStorage,
      required this.userDashboardController,
      required this.subscribeActivity,
      required this.unsubscribeActivity});

  Future<void> subscribeUserActivity(String activityCode) async {
    var userId = await secureStorage.getId();
    var requestDone = await subscribeActivity(userId!, activityCode);
    if (requestDone) {
      await userDashboardController.getUserSubscribedActivities();
      userDashboardController.getNextActivity();
    }
  }

  Future<void> unsubscribeUserActivity(String activityCode) async {
    var userId = await secureStorage.getId();
    var requestDone = await unsubscribeActivity(userId!, activityCode);
    if (requestDone) {
      await userDashboardController.getUserSubscribedActivities();
      userDashboardController.getNextActivity();
    }
  }
}
