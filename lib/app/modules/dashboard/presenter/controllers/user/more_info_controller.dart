import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/dashboard/infra/models/speaker_activity_model.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/user_subscription_controller.dart';
import 'package:smile_front/app/shared/models/enrolls_activity_model.dart';
import 'package:smile_front/app/shared/models/responsible_professor_model.dart';
import '../../../../../shared/utils/utils.dart';

part 'more_info_controller.g.dart';

class MoreInfoController = MoreInfoControllerBase with _$MoreInfoController;

abstract class MoreInfoControllerBase with Store {
  final UserEnrollmentController enrollmentController;
  final String activityCode;

  MoreInfoControllerBase({
    required this.enrollmentController,
    required this.activityCode,
  }) {
    getActivity();
  }

  @observable
  bool isLoading = false;

  @observable
  EnrollsActivityModel activity = EnrollsActivityModel.newInstance();

  @action
  void getActivity() {
    activity = enrollmentController.allActivitiesWithEnrollments
        .firstWhere((element) => element.activityCode == activityCode,
            orElse: () => EnrollsActivityModel(
                  description: '',
                  activityCode: '',
                  title: '',
                  type: null,
                  speakers: [SpeakerActivityModel.newInstance()],
                  duration: 0,
                  isExtensive: false,
                  startDate: DateTime.now(),
                  deliveryEnum: null,
                  acceptingNewEnrollments: false,
                  responsibleProfessor: ResponsibleProfessorModel.newInstance(),
                  takenSlots: 0,
                  totalSlots: 0,
                ));
  }

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
              subscribedActivities[i].duration!));
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
      getActivity();
    }
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
    setIsLoading(false);
  }
}
