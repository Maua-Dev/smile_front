import 'package:mobx/mobx.dart';
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
  bool isFloatActionButtonOpen = false;

  @observable
  List<ActivityModel> activitiesList = List.empty();

  @action
  void toggleFloatActionButton() {
    isFloatActionButtonOpen = !isFloatActionButtonOpen;
  }

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
            element.title.toLowerCase().startsWith(search.toLowerCase()))
        .toList();
    if (search == '') {
      getAllActivities();
    }
  }

  @action
  void orderByDate(int index) {
    activitiesList.sort(
        (a, b) => a.schedule[index].date.compareTo(b.schedule[index].date));
  }

  // @action
  // void orderByParticipants() {
  //   activitiesList.sort(
  //       (a, b) => a.enrolledUsers!.length.compareTo(b.enrolledUsers!.length));
  // }

}
