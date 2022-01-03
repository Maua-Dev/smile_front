import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/dashboard/domain/entities/activity.dart';
import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart';

part 'dashboard_controller.g.dart';

class DashboardController = _DashboardControllerBase with _$DashboardController;

abstract class _DashboardControllerBase with Store {
  final ActivitiesRepositoryInterface repository;

  _DashboardControllerBase({required this.repository}) {
    getActivities();
  }

  @observable
  List<Activity> activitiesList = List.empty();

  @action
  Future getActivities() async {
    activitiesList = await repository.getActivities();
  }
}
