import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../../shared/models/activity_model.dart';
import '../../../../../shared/models/user_model.dart';
import '../../../../auth/presenter/controllers/auth_controller.dart';
import '../../../domain/repositories/activities_repository_interface.dart';

part 'user_dashboard_controller.g.dart';

class UserDashboardController = _UserDashboardControllerBase
    with _$UserDashboardController;

abstract class _UserDashboardControllerBase with Store {
  final ActivitiesRepositoryInterface repository;
  final AuthController authController;

  _UserDashboardControllerBase(
      {required this.repository, required this.authController}) {
    getUserSubscribedActivities();
    getUser();
  }

  @observable
  List<ActivityModel> activitiesList = List.empty();

  @observable
  ActivityModel nextActivity = ActivityModel.newInstance();

  @observable
  UserModel user = UserModel.newInstance();

  @observable
  String userName = '';

  @action
  Future getUserSubscribedActivities() async {
    activitiesList = await repository.getUserSubscribedActivities();
    getNextActivity();
  }

  @action
  void getNextActivity() {
    nextActivity = activitiesList[0];
  }

  @action
  Future getUser() async {
    user = await repository.getUser();
    getUserFirstName();
  }

  @action
  void getUserFirstName() {
    userName = user.socialName.substring(0, user.socialName.indexOf(' '));
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

  @action
  Future<void> logout() async {
    await authController.logout();
    Modular.to.navigate('/login');
  }
}
