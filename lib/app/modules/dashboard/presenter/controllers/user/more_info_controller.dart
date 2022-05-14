import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/user_dashboard_controller.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';

import '../../../../../shared/entities/card_activity.dart';
import '../../../../../shared/utils/utils.dart';
import '../../../domain/repositories/activities_repository_interface.dart';
import '../../../infra/models/schedule_activity_model.dart';

part 'more_info_controller.g.dart';

class MoreInfoController = _MoreInfoControllerBase with _$MoreInfoController;

abstract class _MoreInfoControllerBase with Store {
  final ActivitiesRepositoryInterface repository;
  final CardActivity activity;
  final bool registered;
  final UserDashboardController userDashboardController;

  _MoreInfoControllerBase(
      {required this.userDashboardController,
      required this.registered,
      required this.activity,
      required this.repository}) {
    isRegistered = registered;
  }

  @observable
  bool isRegistered = false;

  @action
  Future<void> setIsRegistered(bool value) async {
    isRegistered = value;
  }

  @observable
  bool isLoading = false;

  @action
  Future<void> setIsLoading(bool value) async {
    isLoading = value;
  }

  @action
  bool checkIsOkForSubscribe() {
    var subscribedActivities = userDashboardController.allActivitiesToCards;
    for (var i = 0; i < subscribedActivities.length; i++) {
      var finalTime = DateFormat("yyyy-MM-dd hh:mm").parse(
          Utils.getActivityFullFinalTime(subscribedActivities[i].date!,
              subscribedActivities[i].duration!));
      if ((subscribedActivities[i].date!.day != activity.date!.day) ||
          activity.date! == finalTime) {
      } else if (((!activity.date!.isBefore(subscribedActivities[i].date!) &&
              !activity.date!.isAfter(subscribedActivities[i].date!)) ||
          (!activity.date!.isBefore(finalTime)) &&
              !activity.date!.isAfter(finalTime))) {
        return false;
      }
    }
    return true;
  }

  Future<void> subscribeActivity() async {
    setIsLoading(true);
    var cardToModel = ActivityModel(
      id: activity.id,
      activityCode: activity.activityCode,
      type: activity.type,
      title: activity.title,
      description: activity.description,
      schedule: [
        ScheduleActivityModel(
            date: activity.date,
            acceptSubscription: activity.acceptSubscription,
            duration: activity.duration,
            enrolledUsers: activity.enrolledUsers,
            link: activity.link,
            location: activity.location,
            totalParticipants: activity.totalParticipants)
      ],
      speakers: activity.speakers!,
    );
    var requestDone = await repository.subscribeActivity(
        cardToModel, activity.id, activity.date!);
    if (requestDone) {
      await userDashboardController.getUserSubscribedActivities();
      userDashboardController.getNextActivity();
      setIsRegistered(true);
    }
    setIsLoading(false);
  }

  Future<void> unsubscribeActivity() async {
    setIsLoading(true);
    var requestDone =
        await repository.unsubscribeActivity(activity.id, activity.date!);
    if (requestDone) {
      await userDashboardController.getUserSubscribedActivities();
      userDashboardController.getNextActivity();
      setIsRegistered(false);
    }
    setIsLoading(false);
  }
}
