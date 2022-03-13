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
  bool isFloatActionButtonOpen = false;

  @observable
  int? filterActivityChipIndexSelected;

  @observable
  List<ActivityModel> activitiesList = List.empty();

  @observable
  List<ActivityModel> nextActivitiesList = List.empty();

  @computed
  List<ActivityModel> get mondayActivitiesList => activitiesList
      .where((activity) => activity.schedule[0].date!.weekday == 1)
      .toList();

  @computed
  List<ActivityModel> get tuesdayActivitiesList => activitiesList
      .where((activity) => activity.schedule[0].date!.weekday == 2)
      .toList();

  @computed
  List<ActivityModel> get wednesdayActivitiesList => activitiesList
      .where((activity) => activity.schedule[0].date!.weekday == 3)
      .toList();

  @computed
  List<ActivityModel> get thursdayActivitiesList => activitiesList
      .where((activity) => activity.schedule[0].date!.weekday == 4)
      .toList();

  @computed
  List<ActivityModel> get fridayActivitiesList => activitiesList
      .where((activity) => activity.schedule[0].date!.weekday == 5)
      .toList();

  @action
  void toggleFloatActionButton() {
    isFloatActionButtonOpen = !isFloatActionButtonOpen;
  }

  @action
  void toggleFilterActivityChipIndex(index) {
    if (index == filterActivityChipIndexSelected) {
      filterActivityChipIndexSelected = null;
      getAllActivities();
    } else {
      filterActivityChipIndexSelected = index;
      getActivitiesByType(index);
    }
  }

  @action
  Future getActivitiesByType(index) async {
    activitiesList = await repository
        .getActivitiesSelectedByType(ActivityEnum.values[index]);
  }

  @action
  Future getAllActivities() async {
    activitiesList = await repository.getAllActivities();
    nextActivitiesList = activitiesList.length >= 5
        ? activitiesList.sublist(0, 5)
        : activitiesList;
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

  // @action
  // void orderByDate(int index) {
  //   activitiesList.sort(
  //       (a, b) => a.schedule[index].date.compareTo(b.schedule[index].date));
  // }

  // @action
  // void orderByParticipants() {
  //   activitiesList.sort(
  //       (a, b) => a.enrolledUsers!.length.compareTo(b.enrolledUsers!.length));
  // }

}
