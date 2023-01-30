import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/auth/domain/repositories/secure_storage_interface.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/change_data.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/get_user_subscribed_activities.dart';
import 'package:smile_front/app/shared/services/firebase-analytics/firebase_analytics_service.dart';

import '../../../../../shared/entities/card_activity.dart';
import '../../../../../shared/models/activity_model.dart';

part 'user_dashboard_controller.g.dart';

class UserDashboardController = UserDashboardControllerBase
    with _$UserDashboardController;

abstract class UserDashboardControllerBase with Store {
  final GetUserSubscribedActivitiesInterface getUserActivities;
  final ChangeDataInterface changeData;
  final SecureStorageInterface secureStorage;
  final FirebaseAnalyticsService analytics;

  UserDashboardControllerBase({
    required this.analytics,
    required this.changeData,
    required this.secureStorage,
    required this.getUserActivities,
  }) {
    getUserSubscribedActivities();
    getUserName();
    getUserSocialName();
  }

  @observable
  String? error;

  @observable
  String? socialName = '';

  @observable
  String? name = '';

  @observable
  bool certificateWithSocialName = false;

  @observable
  String socialNameToChange = '';

  @observable
  String nameToChange = '';

  @observable
  bool wantSocialName = false;

  @action
  Future<void> getCertificateWithSocialName() async {
    certificateWithSocialName =
        (await secureStorage.getCertificateWithSocialName())!;
  }

  @action
  Future<void> getUserName() async {
    name = await secureStorage.getName();
    setName(name ?? '');
  }

  @action
  Future<void> getUserSocialName() async {
    socialName = await secureStorage.getSocialName();
    setUserSocialName(socialName ?? '');
    if (socialName != null && socialName != '') {
      wantSocialName = true;
    } else {
      wantSocialName = false;
    }
  }

  @action
  Future<void> setWantSocialName(bool? value) async {
    wantSocialName = value!;
    setCertificateWithSocialName(value);
    setUserSocialName('');
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
  Future<void> changeUserData() async {
    setIsLoading(true);
    await changeData(
        nameToChange, socialNameToChange, certificateWithSocialName);
    await secureStorage.saveName(nameToChange);
    await secureStorage.saveSocialName(socialNameToChange);
    await secureStorage
        .saveCertificateWithSocialName(certificateWithSocialName);
    getUserName();
    getUserSocialName();
    getUserSubscribedActivities();
    setIsLoading(false);
  }

  @action
  bool validateName() {
    if (nameToChange.isEmpty) {
      error = 'Campo "Nome" obrigatório!';
      return false;
    } else if (nameToChange.split(' ').length < 2) {
      error = 'Preencha seu nome completo!';
      return false;
    }
    return true;
  }

  @action
  bool validateSocialName() {
    if (wantSocialName && socialNameToChange.isEmpty) {
      error = 'Campo "Nome Social" obrigatório!';
      return false;
    }
    return true;
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
    subscribedActivitiesList = await getUserActivities();
  }

  @action
  Future getUserSubscribedActivities() async {
    setIsLoading(true);
    subscribedActivitiesList = await getUserActivities();
    allActivitiesToCards = [];
    if (subscribedActivitiesList.isNotEmpty) {
      for (var activity in subscribedActivitiesList) {
        allActivitiesToCards.add(CardActivity(
          id: activity.id,
          activityCode: activity.activityCode,
          type: activity.type,
          title: activity.title,
          description: activity.description,
          date: activity.schedule.date,
          duration: activity.schedule.duration,
          totalParticipants: activity.schedule.totalParticipants,
          speakers: activity.speakers,
          location: activity.schedule.location,
          link: activity.schedule.link,
          enrolledUsers: activity.schedule.enrolledUsers,
          acceptSubscription: activity.schedule.acceptSubscription,
        ));
      }
      allActivitiesToCards.sort(
        (a, b) => a.date!.compareTo(b.date!),
      );
      toggleFilterActivityChipIndex(filterActivityChipIndexSelected);
      getNextActivity();
    }
    setIsLoading(false);
  }

  @action
  void getNextActivity() {
    if (subscribedActivitiesList.isNotEmpty) {
      nextActivity = subscribedActivitiesList.first;
      cardNextActivity = CardActivity(
        id: nextActivity.id,
        activityCode: nextActivity.activityCode,
        type: nextActivity.type,
        title: nextActivity.title,
        description: nextActivity.description,
        date: nextActivity.schedule.date,
        duration: nextActivity.schedule.duration,
        totalParticipants: nextActivity.schedule.totalParticipants,
        speakers: nextActivity.speakers,
        location: nextActivity.schedule.location,
        link: nextActivity.schedule.link,
        enrolledUsers: nextActivity.schedule.enrolledUsers,
        acceptSubscription: nextActivity.schedule.acceptSubscription,
      );
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
