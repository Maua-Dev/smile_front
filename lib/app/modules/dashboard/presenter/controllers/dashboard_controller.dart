import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';

part 'dashboard_controller.g.dart';

class DashboardController = _DashboardControllerBase with _$DashboardController;

abstract class _DashboardControllerBase with Store {
  final ActivitiesRepositoryInterface repository;
  final ActivityEnum activityType;
  final String accessLevel;

  _DashboardControllerBase({
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

  @action
  void orderByParticipants() {
    activitiesList.sort(
        (a, b) => a.enrolledUsers.length.compareTo(b.enrolledUsers.length));
  }

  @action
  void editActivity(
      String id,
      String description,
      String link,
      int totalPlaces,
      String location,
      String name,
      DateTime date,
      ActivityEnum type,
      List<dynamic> enrolledUsers,
      List<dynamic> queue,
      String createdAt,
      String updatedAt,
      int workload) async {
    await repository.editActivity(id, description, link, totalPlaces, location,
        name, date, type, enrolledUsers, queue, createdAt, updatedAt, workload);
  }
}
