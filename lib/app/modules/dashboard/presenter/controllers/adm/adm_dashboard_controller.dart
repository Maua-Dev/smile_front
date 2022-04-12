import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart';
import 'package:smile_front/app/shared/entities/card_activity.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';

import '../../../../auth/presenter/controllers/auth_controller.dart';

part 'adm_dashboard_controller.g.dart';

class AdmDashboardController = _AdmDashboardControllerBase
    with _$AdmDashboardController;

abstract class _AdmDashboardControllerBase with Store {
  final ActivitiesRepositoryInterface repository;
  final AuthController authController;

  _AdmDashboardControllerBase(
      {required this.repository, required this.authController}) {
    getAllActivities();
  }

  @observable
  bool isLoading = false;

  @action
  Future<void> setIsLoading(bool value) async {
    isLoading = value;
  }

  @observable
  bool isFloatActionButtonOpen = false;

  @observable
  int? filterActivityChipIndexSelected;

  @observable
  List<ActivityModel> activitiesList = List.empty();

  @observable
  List<ActivityModel> saveActivitiesList = List.empty();

  @observable
  List<CardActivity> allActivitiesToCards = List.empty();

  @observable
  List<CardActivity> nextActivitiesList = List.empty();

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
      activitiesList = saveActivitiesList;
      changeFormatToCards();
    } else {
      filterActivityChipIndexSelected = index;
      getActivitiesByType(index);
    }
  }

  @action
  Future getActivitiesByType(index) async {
    var list = activitiesList
        .where((element) => element.type == ActivityEnum.values[index])
        .toList();

    allActivitiesToCards = [];
    for (var activity in list) {
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
            enrolledUsers: time.enrolledUsers,
            enableSubscription: time.enableSubscription));
      }
    }
  }

  @action
  Future getAllActivities() async {
    setIsLoading(true);
    activitiesList = await repository.getAllActivities();
    saveActivitiesList = activitiesList;
    changeFormatToCards();
    nextActivitiesList = allActivitiesToCards.length >= 5
        ? allActivitiesToCards.sublist(0, 5)
        : allActivitiesToCards;
  }

  @action
  Future<void> logout() async {
    await authController.logout();
    Modular.to.navigate('/login');
  }

  @action
  void changeFormatToCards() {
    setIsLoading(true);
    allActivitiesToCards = [];
    for (var activity in activitiesList) {
      for (var time in activity.schedule) {
        allActivitiesToCards.add(CardActivity(
          enrolledUsers: time.enrolledUsers,
          id: activity.id,
          activityCode: activity.activityCode,
          type: activity.type,
          title: activity.title,
          description: activity.description,
          date: time.date,
          duration: time.duration,
          speakers: activity.speakers,
          totalParticipants: time.totalParticipants,
          location: time.location,
          link: time.link,
          enableSubscription: time.enableSubscription,
        ));
      }
    }
    setIsLoading(false);
  }
}
