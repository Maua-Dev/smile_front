import 'package:mobx/mobx.dart';

import '../../../../../shared/models/activity_model.dart';
import '../../../domain/repositories/activities_repository_interface.dart';

part 'user_dashboard_controller.g.dart';

class UserDashboardController = _UserDashboardControllerBase
    with _$UserDashboardController;

abstract class _UserDashboardControllerBase with Store {
  final ActivitiesRepositoryInterface repository;

  _UserDashboardControllerBase({
    required this.repository,
  }) {
    getUserSubscribedActivities();
  }

  @observable
  List<ActivityModel> activitiesList = List.empty();

  @observable
  ActivityModel nextActivity = ActivityModel.newInstance();

  @action
  Future getUserSubscribedActivities() async {
    activitiesList = await repository.getUserSubscribedActivities();
    nextActivity = activitiesList[0];
  }

  @computed
  List<ActivityModel> get mondayActivitiesList => activitiesList
      .where((activity) =>
          activity.schedule.map((e) => e.date!.weekday == 1).contains(true))
      .toList();

  @computed
  List<ActivityModel> get tuesdayActivitiesList => activitiesList
      .where((activity) =>
          activity.schedule.map((e) => e.date!.weekday == 2).contains(true))
      .toList();

  @computed
  List<ActivityModel> get wednesdayActivitiesList => activitiesList
      .where((activity) =>
          activity.schedule.map((e) => e.date!.weekday == 3).contains(true))
      .toList();

  @computed
  List<ActivityModel> get thursdayActivitiesList => activitiesList
      .where((activity) =>
          activity.schedule.map((e) => e.date!.weekday == 4).contains(true))
      .toList();

  @computed
  List<ActivityModel> get fridayActivitiesList => activitiesList
      .where((activity) =>
          activity.schedule.map((e) => e.date!.weekday == 5).contains(true))
      .toList();
}
