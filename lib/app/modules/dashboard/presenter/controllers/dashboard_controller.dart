import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';

part 'dashboard_controller.g.dart';

class DashboardController = _DashboardControllerBase with _$DashboardController;

abstract class _DashboardControllerBase with Store {
  final ActivitiesRepositoryInterface repository;
  final ActivityEnum activityType;

  _DashboardControllerBase({
    required this.repository,
    required this.activityType,
  }) {
    getActivities();
  }

  @observable
  List<ActivityModel> activitiesList = List.empty();

  @action
  Future getActivities() async {
    activitiesList = await repository.getActivitiesSelectedByType(activityType);
  }

  @action
  void searchActivityByName(String search) {
    activitiesList = activitiesList
        .where((element) =>
            element.name.toLowerCase().startsWith(search.toLowerCase()))
        .toList();
    if (search == '') {
      getActivities();
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
}
