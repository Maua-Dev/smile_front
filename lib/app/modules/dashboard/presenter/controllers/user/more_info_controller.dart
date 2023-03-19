import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/send_confirm_attendance.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/user_subscription_controller.dart';
import 'package:smile_front/app/shared/models/enrolls_activity_model.dart';
import '../../../../../shared/entities/infra/enrollment_state_enum.dart';
import '../../../../../shared/utils/utils.dart';
import '../../../../auth/domain/repositories/secure_storage_interface.dart';

part 'more_info_controller.g.dart';

class MoreInfoController = MoreInfoControllerBase with _$MoreInfoController;

abstract class MoreInfoControllerBase with Store {
  final UserEnrollmentController enrollmentController;
  final String activityCode;
  final ConfirmAttendanceUsecase sendConfirmAttendanceUsecase;
  final SecureStorageInterface storage;

  MoreInfoControllerBase({
    required this.sendConfirmAttendanceUsecase,
    required this.enrollmentController,
    required this.activityCode,
    required this.storage,
  }) {
    getActivity();
    checkCanViewConfirmAttendance();
  }

  @observable
  bool isLoading = false;

  @observable
  bool isLoadingGetActivity = false;

  @observable
  bool isLoadingConfirmAttendance = false;

  @observable
  EnrollmentStateEnum enrollmentState = EnrollmentStateEnum.NONE;

  @observable
  bool canViewConfirmAttendance = false;

  @observable
  EnrollsActivityModel activity = EnrollsActivityModel.newInstance();

  @action
  Future getActivity() async {
    isLoadingGetActivity = true;
    var activityCodeToSearch = activityCode;
    if (activityCodeToSearch == "") {
      activityCodeToSearch = await storage.getActivityCode() ?? '';
    } else {
      await storage.saveActivityCode(activityCodeToSearch);
    }
    if (activityCodeToSearch == '') {
      Modular.to.navigate('/user/home/all-activities');
    }
    if (enrollmentController.allActivitiesWithEnrollments.isEmpty) {
      await enrollmentController.getUserAllActivitiesWithEnrollment();
    }
    activity = enrollmentController.allActivitiesWithEnrollments
        .firstWhere((element) => element.activityCode == activityCodeToSearch);
    isLoadingGetActivity = false;
    if (activity.enrollments == null) {
      enrollmentState = EnrollmentStateEnum.NONE;
    } else {
      enrollmentState = activity.enrollments!.state;
    }

    await checkCanViewConfirmAttendance();
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
    } else {
      canViewConfirmAttendance = false;
    }
  }

  Future<void> subscribeUserActivity() async {
    setIsLoading(true);
    var requestDone =
        await enrollmentController.subscribeActivity(activity.activityCode);
    if (requestDone) {
      await enrollmentController.getUserAllActivitiesWithEnrollment();
      await getActivity();
    }
    await checkCanViewConfirmAttendance();
    setIsLoading(false);
  }

  Future<void> unsubscribeUserActivity() async {
    setIsLoading(true);
    var requestDone =
        await enrollmentController.unsubscribeActivity(activity.activityCode);
    if (requestDone) {
      await enrollmentController.getUserAllActivitiesWithEnrollment();
      await getActivity();
    }
    await checkCanViewConfirmAttendance();
    setIsLoading(false);
  }

  @action
  Future<void> onConfirmCode(String code) async {
    setIsLoadingConfirmAttendance(true);
    var activityCodeToConfirm = activityCode;
    if (activityCodeToConfirm == "") {
      activityCodeToConfirm = await storage.getActivityCode() ?? '';
    } else {
      await storage.saveActivityCode(activityCodeToConfirm);
    }
    if (activityCodeToConfirm == '') {
      Modular.to.navigate('/user/home/all-activities');
    }
    await sendConfirmAttendanceUsecase(code, activityCodeToConfirm);
    await enrollmentController.getUserAllActivitiesWithEnrollment();
    await getActivity();
    enrollmentState = EnrollmentStateEnum.COMPLETED;
    await checkCanViewConfirmAttendance();

    setIsLoadingConfirmAttendance(false);
  }
}
