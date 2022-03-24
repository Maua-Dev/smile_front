import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../../shared/entities/card_activity.dart';
import '../../../../../shared/models/activity_model.dart';
import '../../../../auth/presenter/controllers/auth_controller.dart';
import '../../../domain/infra/activity_enum.dart';
import '../../../domain/repositories/activities_repository_interface.dart';

part 'all_activities_user_dashboard_controller.g.dart';

class AllActivitiesUserDashboardController = _AllActivitiesUserDashboardControllerBase
    with _$AllActivitiesUserDashboardController;

abstract class _AllActivitiesUserDashboardControllerBase with Store {
  final ActivitiesRepositoryInterface repository;
  final AuthController authController;

  _AllActivitiesUserDashboardControllerBase({
    required this.repository,
    required this.authController,
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
  List<CardActivity> nextActivitiesList = List.empty();

  @observable
  List<CardActivity> allActivitiesToCards = List.empty();

  @computed
  List<CardActivity> get mondayActivitiesList => allActivitiesToCards
      .where((activity) => activity.date!.weekday == 1)
      .toList();

  @computed
  List<CardActivity> get tuesdayActivitiesList => allActivitiesToCards
      .where((activity) => activity.date!.weekday == 2)
      .toList();

  @computed
  List<CardActivity> get wednesdayActivitiesList => allActivitiesToCards
      .where((activity) => activity.date!.weekday == 3)
      .toList();

  @computed
  List<CardActivity> get thursdayActivitiesList => allActivitiesToCards
      .where((activity) => activity.date!.weekday == 4)
      .toList();

  @computed
  List<CardActivity> get fridayActivitiesList => allActivitiesToCards
      .where((activity) => activity.date!.weekday == 5)
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
    allActivitiesToCards = [];
    for (var activity in activitiesList) {
      for (var time in activity.schedule) {
        allActivitiesToCards.add(CardActivity(
          id: activity.id,
          activityCode: activity.activityCode,
          type: activity.type,
          title: activity.title,
          description: activity.description,
          date: time.date,
          duration: time.duration,
          totalParticipants: time.totalParticipants,
          location: time.location,
          link: time.link,
        ));
      }
    }
    nextActivitiesList = allActivitiesToCards.length >= 5
        ? allActivitiesToCards.sublist(0, 5)
        : allActivitiesToCards;
  }

  @action
  Future<void> logout() async {
    await authController.logout();
    Modular.to.navigate('/login');
  }
}
