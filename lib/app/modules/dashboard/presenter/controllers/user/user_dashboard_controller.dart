import 'package:mobx/mobx.dart';

import '../../../../../shared/models/activity_model.dart';
import '../../../domain/infra/activity_enum.dart';
import '../../../domain/repositories/activities_repository_interface.dart';

part '../user_dashboard_controller.g.dart';

class UserDashboardController = _UserDashboardControllerBase
    with _$UserDashboardController;

abstract class _UserDashboardControllerBase with Store {
  final ActivitiesRepositoryInterface repository;
  final ActivityEnum activityType;
  final String accessLevel;

  _UserDashboardControllerBase({
    required this.accessLevel,
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
            element.name.toLowerCase().startsWith(search.toLowerCase()))
        .toList();
    if (search == '') {
      getActivitiesByType();
    }
  }

  @action
  void orderByDate() {
    activitiesList.sort((a, b) => a.date.compareTo(b.date));
  }

  // @action
  // void orderByParticipants() {
  //   activitiesList.sort(
  //       (a, b) => a.enrolledUsers!.length.compareTo(b.enrolledUsers!.length));
  // }

  @action
  Future editActivity(
      String id,
      String description,
      String link,
      int totalPlaces,
      String location,
      String name,
      DateTime date,
      ActivityEnum type,
      int workload) async {
    await repository.editActivity(id, description, link, totalPlaces, location,
        name, date, type, workload);
  }
}
