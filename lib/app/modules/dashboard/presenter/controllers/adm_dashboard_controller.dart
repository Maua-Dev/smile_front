import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';

part 'adm_dashboard_controller.g.dart';

class AdmDashboardController = _AdmDashboardControllerBase
    with _$AdmDashboardController;

abstract class _AdmDashboardControllerBase with Store {
  final ActivitiesRepositoryInterface repository;
  final String accessLevel;

  _AdmDashboardControllerBase({
    required this.accessLevel,
    required this.repository,
  }) {
    getAllActivities();
  }

  @observable
  List<ActivityModel> activitiesList = List.empty();

  // @action
  // Future getActivitiesByType() async {
  //   activitiesList =
  //       await repository.getActivitiesSelectedByType(activityType!);
  // }

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
      getAllActivities();
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
