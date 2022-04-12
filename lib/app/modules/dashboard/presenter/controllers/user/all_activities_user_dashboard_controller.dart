import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/user_dashboard_controller.dart';

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
  final controller = Modular.get<UserDashboardController>();

  _AllActivitiesUserDashboardControllerBase({
    required this.repository,
    required this.authController,
  }) {
    getAllActivities();
  }

  @observable
  bool isLoading = false;

  @action
  Future<void> setIsLoading(bool value) async {
    isLoading = value;
  }

  @observable
  int filterActivityChipIndexSelected = 0;

  @observable
  List<CardActivity> weekActivitiesList = List.empty();

  @observable
  List<ActivityModel> activitiesList = List.empty();

  @observable
  List<CardActivity> allActivitiesToCards = List.empty();

  @observable
  ActivityEnum? activityType;

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

  @computed
  List<CardActivity> get saturdayActivitiesList => allActivitiesToCards
      .where((activity) => activity.date!.weekday == 6)
      .toList();

  @action
  void toggleFilterActivityChipIndex(index) {
    filterActivityChipIndexSelected = index;
    switch (filterActivityChipIndexSelected) {
      case 0:
        weekActivitiesList = mondayActivitiesList;
        break;
      case 1:
        weekActivitiesList = tuesdayActivitiesList;
        break;
      case 2:
        weekActivitiesList = wednesdayActivitiesList;
        break;
      case 3:
        weekActivitiesList = thursdayActivitiesList;
        break;
      case 4:
        weekActivitiesList = fridayActivitiesList;
        break;
      case 5:
        weekActivitiesList = saturdayActivitiesList;
        break;
    }
    getActivitiesByType(activityType);
  }

  @action
  Future getAllActivities() async {
    setIsLoading(true);
    activitiesList = await repository.getAllActivities();
    allActivitiesToCards = [];
    for (var activity in activitiesList) {
      for (var time in activity.schedule) {
        allActivitiesToCards.add(
          CardActivity(
            id: activity.id,
            activityCode: activity.activityCode,
            type: activity.type,
            title: activity.title,
            description: activity.description,
            date: time.date,
            duration: time.duration,
            totalParticipants: time.totalParticipants,
            speakers: activity.speakers,
            location: time.location,
            link: time.link,
            enrolledUsers: time.enrolledUsers,
            enableSubscription: time.enableSubscription,
          ),
        );
      }
    }
    toggleFilterActivityChipIndex(filterActivityChipIndexSelected);
    getActivitiesByType(activityType);
  }

  @action
  Future getActivitiesByType(ActivityEnum? typeActivity) async {
    setIsLoading(true);
    if (typeActivity != null) {
      switch (filterActivityChipIndexSelected) {
        case 0:
          weekActivitiesList = mondayActivitiesList;
          break;
        case 1:
          weekActivitiesList = tuesdayActivitiesList;
          break;
        case 2:
          weekActivitiesList = wednesdayActivitiesList;
          break;
        case 3:
          weekActivitiesList = thursdayActivitiesList;
          break;
        case 4:
          weekActivitiesList = fridayActivitiesList;
          break;
        case 5:
          weekActivitiesList = saturdayActivitiesList;
          break;
      }
      activityType = typeActivity;
      weekActivitiesList = weekActivitiesList
          .where((element) => element.type == activityType)
          .toList();
    }
    setIsLoading(false);
  }

  @action
  Future<void> logout() async {
    await authController.logout();
    Modular.to.navigate('/login');
  }
}
