import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/send_confirm_attendance.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/user_subscription_controller.dart';
import 'package:smile_front/app/shared/models/enrolls_activity_model.dart';
import '../../../../../shared/entities/infra/enrollment_state_enum.dart';
import '../../../../../shared/utils/utils.dart';

part 'more_info_controller.g.dart';

class MoreInfoController = MoreInfoControllerBase with _$MoreInfoController;

abstract class MoreInfoControllerBase with Store {
  final UserEnrollmentController enrollmentController;
  final String activityCode;
  final ConfirmAttendanceUsecase sendConfirmAttendanceUseCase;

  MoreInfoControllerBase({
    required this.sendConfirmAttendanceUseCase,
    required this.enrollmentController,
    required this.activityCode,
  }) {
    getActivity();
    checkCanViewConfirmAttendance();
    getEnrollmentState();
  }

  @observable
  bool isLoading = false;

  @observable
  bool isLoadingConfirmAttendance = false;

  @observable
  EnrollmentStateEnum enrollmentState = EnrollmentStateEnum.NONE;

  @observable
  bool canViewConfirmAttendance = false;

  @observable
  EnrollsActivityModel activity = EnrollsActivityModel.newInstance();

  @action
  void getActivity() {
    activity = enrollmentController.allActivitiesWithEnrollments
        .firstWhere((element) => element.activityCode == activityCode);
  }

  @action
  Future<void> setIsLoading(bool value) async {
    isLoading = value;
  }

  @action
  Future<void> setIsLoadingConfirmAttendance(bool value) async {
    isLoadingConfirmAttendance = value;
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

  @action
  Future<void> checkCanViewConfirmAttendance() async {
    if (activity.enrollments != null) {
      if (activity.enrollments!.state == EnrollmentStateEnum.ENROLLED &&
          DateTime.now().isAfter(activity.startDate!)) {
        canViewConfirmAttendance = true;
      }
    }
    canViewConfirmAttendance = false;
  }

  @action
  Future<void> getEnrollmentState() async {
    if (activity.enrollments == null) {
      enrollmentState = EnrollmentStateEnum.NONE;
    }
    enrollmentState = activity.enrollments!.state;
  }

  Future<void> subscribeUserActivity() async {
    setIsLoading(true);
    var requestDone =
        await enrollmentController.subscribeActivity(activity.activityCode);
    if (requestDone) {
      await enrollmentController.getUserAllActivitiesWithEnrollment();
      getActivity();
    }
    checkCanViewConfirmAttendance();
    getEnrollmentState();
    setIsLoading(false);
  }

  Future<void> unsubscribeUserActivity() async {
    setIsLoading(true);
    var requestDone =
        await enrollmentController.unsubscribeActivity(activity.activityCode);
    if (requestDone) {
      await enrollmentController.getUserAllActivitiesWithEnrollment();
      getActivity();
    }
    checkCanViewConfirmAttendance();
    getEnrollmentState();
    setIsLoading(false);
  }

  @action
  Future<void> onConfirmCode(String code) async {
    setIsLoadingConfirmAttendance(true);
    await sendConfirmAttendanceUseCase(code, activityCode);
    setIsLoadingConfirmAttendance(false);
  }
}
