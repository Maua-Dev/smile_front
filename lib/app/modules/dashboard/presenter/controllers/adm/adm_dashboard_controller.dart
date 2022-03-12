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

  @computed
  List<ActivityModel> get nextActivitiesList => activitiesList.length >= 5
      ? activitiesList.sublist(0, 5)
      : activitiesList;

  @computed
  List<ActivityModel> get mondayActivitiesList =>
      activitiesList.where((activity) => activity.date.weekday == 1).toList();

  @computed
  List<ActivityModel> get tuesdayActivitiesList =>
      activitiesList.where((activity) => activity.date.weekday == 2).toList();

  @computed
  List<ActivityModel> get wednesdayActivitiesList =>
      activitiesList.where((activity) => activity.date.weekday == 3).toList();

  @computed
  List<ActivityModel> get thursdayActivitiesList =>
      activitiesList.where((activity) => activity.date.weekday == 4).toList();

  @computed
  List<ActivityModel> get fridayActivitiesList =>
      activitiesList.where((activity) => activity.date.weekday == 5).toList();

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
  void orderByDate() {
    activitiesList.sort((a, b) => a.date.compareTo(b.date));
  }

  // @action
  // void orderByParticipants() {
  //   activitiesList.sort(
  //       (a, b) => a.enrolledUsers!.length.compareTo(b.enrolledUsers!.length));
  // }

}
