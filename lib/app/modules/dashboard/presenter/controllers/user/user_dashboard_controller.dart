import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/auth/domain/repositories/secure_storage_interface.dart';

import '../../../../../shared/entities/card_activity.dart';
import '../../../../../shared/models/activity_model.dart';
import '../../../domain/repositories/activities_repository_interface.dart';

part 'user_dashboard_controller.g.dart';

class UserDashboardController = _UserDashboardControllerBase
    with _$UserDashboardController;

abstract class _UserDashboardControllerBase with Store {
  final ActivitiesRepositoryInterface repository;
  final SecureStorageInterface secureStorage;

  _UserDashboardControllerBase({
    required this.secureStorage,
    required this.repository,
  }) {
    getUserSubscribedActivities();
    getUserName();
    getUserSocialName();
  }

  @observable
  String? socialName = '';

  @observable
  String? name = '';

  @observable
  bool? certificateWithSocialName = false;

  @observable
  String socialNameToChange = '';

  @observable
  String nameToChange = '';

  @observable
  bool wantSocialName = false;

  @action
  Future<void> getCertificateWithSocialName() async {
    certificateWithSocialName =
        await secureStorage.getCertificateWithSocialName();
    wantSocialName = certificateWithSocialName!;
  }

  @action
  Future<void> getUserName() async {
    name = await secureStorage.getName();
    nameToChange = name ?? '';
  }

  @action
  Future<void> getUserSocialName() async {
    socialName = await secureStorage.getSocialName();
    socialNameToChange = socialName ?? '';
  }

  @action
  Future<void> setWantSocialName(bool? value) async {
    wantSocialName = value!;
    certificateWithSocialName = value;
    socialNameToChange = '';
  }

  @action
  void setName(String value) {
    nameToChange = value;
  }

  @action
  void setUserSocialName(String value) {
    socialNameToChange = value;
  }

  @action
  void setCertificateWithSocialName(bool value) {
    certificateWithSocialName = value;
  }

  @action
  String? validateName(String? value) {
    if (value!.isEmpty) {
      return "         Campo obrigatório";
    } else if (value.split(' ').length < 2) {
      return "         Insira seu nome completo";
    }
    return null;
  }

  @action
  String? validateSocialName(String? value) {
    if (wantSocialName && value!.isEmpty) {
      return "         Campo obrigatório";
    }
    return null;
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
  List<ActivityModel> subscribedActivitiesList = List.empty();

  @observable
  ActivityModel nextActivity = ActivityModel.newInstance();

  @observable
  CardActivity cardNextActivity = CardActivity.newInstance();

  @observable
  List<CardActivity> weekActivitiesList = List.empty();

  @observable
  List<CardActivity> allActivitiesToCards = List.empty();

  @action
  Future getActivities() async {
    subscribedActivitiesList = await repository.getUserSubscribedActivities();
  }

  @action
  Future getUserSubscribedActivities() async {
    setIsLoading(true);
    subscribedActivitiesList = await repository.getUserSubscribedActivities();
    if (subscribedActivitiesList.isNotEmpty) {
      allActivitiesToCards = [];
      for (var activity in subscribedActivitiesList) {
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
    if (subscribedActivitiesList.isNotEmpty) {
      nextActivity = subscribedActivitiesList.first;
      for (var time in subscribedActivitiesList.first.schedule) {
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
        );
      }
    } else {
      nextActivity = ActivityModel.newInstance();
    }
  }

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
