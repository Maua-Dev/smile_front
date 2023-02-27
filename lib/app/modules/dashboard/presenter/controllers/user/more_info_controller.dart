import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/user_dashboard_controller.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/user_subscription_controller.dart';
import 'package:smile_front/app/shared/entities/infra/enrollment_state_enum.dart';
import '../../../../../shared/entities/card_activity.dart';
import '../../../../../shared/utils/utils.dart';

part 'more_info_controller.g.dart';

class MoreInfoController = MoreInfoControllerBase with _$MoreInfoController;

abstract class MoreInfoControllerBase with Store {
  final UserEnrollmentController enrollmentController;
  final CardActivity activity;
  final EnrollmentStateEnum registered;
  final UserDashboardController userDashboardController;

  MoreInfoControllerBase({
    required this.enrollmentController,
    required this.userDashboardController,
    required this.registered,
    required this.activity,
  }) {
    isRegistered = registered;
  }

  @observable
  EnrollmentStateEnum isRegistered = EnrollmentStateEnum.NONE;

  @action
  Future<void> setIsRegistered(bool value) async {
    isRegistered = EnrollmentStateEnum.ENROLLED;
  }

  @observable
  bool isLoading = false;

  @action
  Future<void> setIsLoading(bool value) async {
    isLoading = value;
  }

  @action
  bool checkIsOkForSubscribe() {
    var subscribedActivities =
        userDashboardController.enrollmentController.subscribedActivities;
    for (var i = 0; i < subscribedActivities.length; i++) {
      var finalTime = DateFormat("yyyy-MM-dd hh:mm").parse(
          Utils.getActivityFullFinalTime(subscribedActivities[i].startDate!,
              subscribedActivities[i].duration));
      if ((subscribedActivities[i].startDate!.day != activity.date!.day) ||
          activity.date! == finalTime) {
      } else if (((!activity.date!
                  .isBefore(subscribedActivities[i].startDate!) &&
              !activity.date!.isAfter(subscribedActivities[i].startDate!)) ||
          (!activity.date!.isBefore(finalTime)) &&
              !activity.date!.isAfter(finalTime))) {
        return false;
      }
    }
    return true;
  }

  Future<void> subscribeUserActivity() async {
    setIsLoading(true);
    var requestDone =
        await enrollmentController.subscribeActivity(activity.activityCode);
    if (requestDone) {
      await userDashboardController.getUserSubscribedActivities();
      userDashboardController.getNextActivity();
      setIsRegistered(true);
    }
    setIsLoading(false);
  }

  Future<void> unsubscribeUserActivity() async {
    setIsLoading(true);
    var requestDone =
        await enrollmentController.unsubscribeActivity(activity.activityCode);
    if (requestDone) {
      await userDashboardController.getUserSubscribedActivities();
      userDashboardController.getNextActivity();
      setIsRegistered(false);
    }
    setIsLoading(false);
  }
}
