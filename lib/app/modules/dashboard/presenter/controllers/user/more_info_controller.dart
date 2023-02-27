import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/user_subscription_controller.dart';
import 'package:smile_front/app/shared/entities/infra/enrollment_state_enum.dart';
import 'package:smile_front/app/shared/models/enrolls_activity_model.dart';
import '../../../../../shared/utils/utils.dart';

part 'more_info_controller.g.dart';

class MoreInfoController = MoreInfoControllerBase with _$MoreInfoController;

abstract class MoreInfoControllerBase with Store {
  final UserEnrollmentController enrollmentController;
  final EnrollsActivityModel activity;
  final EnrollmentStateEnum registered;

  MoreInfoControllerBase({
    required this.enrollmentController,
    required this.registered,
    required this.activity,
  }) {
    isRegistered = registered;
  }

  @observable
  EnrollmentStateEnum isRegistered = EnrollmentStateEnum.NONE;

  @action
  Future<void> setIsRegistered(EnrollmentStateEnum value) async {
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
    var subscribedActivities = enrollmentController.subscribedActivities;
    for (var i = 0; i < subscribedActivities.length; i++) {
      var finalTime = DateFormat("yyyy-MM-dd hh:mm").parse(
          Utils.getActivityFullFinalTime(subscribedActivities[i].startDate!,
              subscribedActivities[i].duration));
      if ((subscribedActivities[i].startDate!.day != activity.startDate!.day) ||
          activity.startDate! == finalTime) {
      } else if (((!activity.startDate!
                  .isBefore(subscribedActivities[i].startDate!) &&
              !activity.startDate!
                  .isAfter(subscribedActivities[i].startDate!)) ||
          (!activity.startDate!.isBefore(finalTime)) &&
              !activity.startDate!.isAfter(finalTime))) {
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
      await enrollmentController.getUserAllActivitiesWithEnrollment();
      setIsRegistered(EnrollmentStateEnum.ENROLLED);
    }
    setIsLoading(false);
  }

  Future<void> unsubscribeUserActivity() async {
    setIsLoading(true);
    var requestDone =
        await enrollmentController.unsubscribeActivity(activity.activityCode);
    if (requestDone) {
      await enrollmentController.getUserAllActivitiesWithEnrollment();
      setIsRegistered(EnrollmentStateEnum.DROPPED);
    }
    setIsLoading(false);
  }
}
