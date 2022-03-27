import 'package:mobx/mobx.dart';

import '../../../../../shared/entities/card_activity.dart';
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
  }

  @observable
  int filterActivityChipIndexSelected = 0;

  @observable
  List<ActivityModel> activitiesList = List.empty();

  @observable
  ActivityModel nextActivity = ActivityModel.newInstance();

  @observable
  List<CardActivity> weekActivitiesList = List.empty();

  @observable
  UserModel user = UserModel.newInstance();

  @observable
  String userName = '';

  @action
  Future getUserSubscribedActivities() async {
    activitiesList = await repository.getUserSubscribedActivities();
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
    toggleFilterActivityChipIndex(filterActivityChipIndexSelected);
    getNextActivity();
  }

  @action
  void getNextActivity() {
    nextActivity = activitiesList[0];
  }

  @action
  void getUserFirstName() {
    userName = user.socialName.substring(0, user.socialName.indexOf(' '));
  }

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
  }
}
