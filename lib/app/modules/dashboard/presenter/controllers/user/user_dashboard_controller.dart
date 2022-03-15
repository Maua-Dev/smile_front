import 'package:mobx/mobx.dart';

import '../../../../../shared/models/activity_model.dart';
import '../../../domain/infra/activity_enum.dart';
import '../../../domain/repositories/activities_repository_interface.dart';

part 'user_dashboard_controller.g.dart';

class UserDashboardController = _UserDashboardControllerBase
    with _$UserDashboardController;

abstract class _UserDashboardControllerBase with Store {
  final ActivitiesRepositoryInterface repository;
  final ActivityEnum activityType;

  _UserDashboardControllerBase({
    required this.repository,
    required this.activityType,
  }) {
    getActivitiesByType();
  }

  @observable
  List<ActivityModel> activitiesList = List.empty();

  @action
  Future getActivitiesByType() async {
    activitiesList = await repository.getActivitiesSelectedByType(activityType);
  }

  @action
  Future getAllActivities() async {
    activitiesList = await repository.getAllActivities();
  }

  @action
  void searchActivityByName(String search) {
    activitiesList = activitiesList
        .where((element) =>
            element.title.toLowerCase().startsWith(search.toLowerCase()))
        .toList();
    if (search == '') {
      getActivitiesByType();
    }
  }

  // @action
  // void orderByDate() {
  //   activitiesList
  //       .sort((a, b) => a.schedule[0].date.compareTo(b.schedule[0].date));
  // }

  // @action
  // void orderByParticipants() {
  //   activitiesList.sort(
  //       (a, b) => a.enrolledUsers!.length.compareTo(b.enrolledUsers!.length));
  // }

}
