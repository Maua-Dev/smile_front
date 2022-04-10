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
  bool isLoading = false;

  @action
  Future<void> setIsLoading(bool value) async {
    isLoading = value;
  }

  @observable
  int filterActivityChipIndexSelected = 0;

  @observable
  List<ActivityModel> activitiesList = List.empty();

  @observable
  ActivityModel nextActivity = ActivityModel.newInstance();

  @observable
  CardActivity cardNextActivity = CardActivity.newInstance();

  @observable
  List<CardActivity> weekActivitiesList = List.empty();

  @observable
  UserModel user = UserModel.newInstance();

  @observable
  String userName = '';

  @action
  Future getUserSubscribedActivities() async {
    setIsLoading(true);
    activitiesList = await repository.getUserSubscribedActivities();
    if (activitiesList.isNotEmpty) {
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
            speakers: activity.speakers,
            location: time.location,
            link: time.link,
            enrolledUsers: time.enrolledUsers,
            queue: time.queue,
          ));
        }
      }
      toggleFilterActivityChipIndex(filterActivityChipIndexSelected);
      getNextActivity();
    }
    setIsLoading(false);
  }

  @action
  void getNextActivity() {
    nextActivity = activitiesList[0];
    for (var time in activitiesList[0].schedule) {
      cardNextActivity = CardActivity(
        id: nextActivity.id,
        activityCode: nextActivity.activityCode,
        type: nextActivity.type,
        title: nextActivity.title,
        description: nextActivity.description,
        date: time.date,
        duration: time.duration,
        totalParticipants: time.totalParticipants,
        speakers: nextActivity.speakers,
        location: time.location,
        link: time.link,
        enrolledUsers: time.enrolledUsers,
        queue: time.queue,
      );
    }
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
