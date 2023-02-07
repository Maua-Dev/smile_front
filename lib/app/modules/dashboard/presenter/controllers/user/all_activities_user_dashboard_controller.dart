import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/get_all_activities.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/user_dashboard_controller.dart';
import '../../../../../shared/entities/card_activity.dart';
import '../../../../../shared/models/activity_model.dart';
import '../../../../../shared/services/firebase-analytics/firebase_analytics_service.dart';
import '../../../../auth/presenter/controllers/auth_controller.dart';
import '../../../domain/infra/activity_enum.dart';

part 'all_activities_user_dashboard_controller.g.dart';

class AllActivitiesUserDashboardController = AllActivitiesUserDashboardControllerBase
    with _$AllActivitiesUserDashboardController;

abstract class AllActivitiesUserDashboardControllerBase with Store {
  final GetAllUserActivitiesInterface getAllActivities;
  final AuthController authController;
  final UserDashboardController controller;
  final FirebaseAnalyticsService analytics;

  AllActivitiesUserDashboardControllerBase({
    required this.analytics,
    required this.controller,
    required this.getAllActivities,
    required this.authController,
  }) {
    getActivities();
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

  @observable
  ActivityEnum? typeFilter;

  @action
  void setTypeFilter(ActivityEnum value) {
    typeFilter = value;
    setAllFilters();
  }

  @observable
  DateTime? dateFilter;

  @action
  void setDateFilter(DateTime value) {
    dateFilter = value;
    setAllFilters();
  }

  @observable
  DateTime? hourFilter;

  @action
  void setHourFilter(DateTime value) {
    hourFilter = value;
    setAllFilters();
  }

  @action
  void setAllFilters() {
    var listActivities = activitiesList;
    if (typeFilter != null) {
      listActivities = filterActivitiesByType(typeFilter!, listActivities);
    }
    if (dateFilter != null) {
      listActivities = filterActivitiesByDate(dateFilter!, listActivities);
    }
    if (hourFilter != null) {
      listActivities = filterActivitiesByHour(hourFilter!, listActivities);
    }
    activitiesList = listActivities;
  }

  @action
  resetFilters() {
    activitiesList = activitiesList;
    typeFilter = null;
    dateFilter = null;
    hourFilter = null;
  }

  @action
  List<ActivityModel> filterActivitiesByType(
      ActivityEnum type, List<ActivityModel> activitiesToFilter) {
    var list =
        activitiesToFilter.where((element) => element.type == type).toList();
    return list;
  }

  @action
  List<ActivityModel> filterActivitiesByDate(
      DateTime date, List<ActivityModel> activitiesToFilter) {
    var list = activitiesToFilter
        .where((element) => isValidDateFilter(element.startDate!, date))
        .toList();
    return list;
  }

  @action
  List<ActivityModel> filterActivitiesByHour(
      DateTime hour, List<ActivityModel> activitiesToFilter) {
    var list = activitiesToFilter
        .where((element) => isValidHourFilter(element.startDate!, hour))
        .toList();
    return list;
  }

  bool isValidDateFilter(DateTime activityDate, DateTime dateToFilter) {
    if (activityDate.day == dateToFilter.day &&
        activityDate.month == dateToFilter.month &&
        activityDate.year == dateToFilter.year) {
      return true;
    }
    return false;
  }

  bool isValidHourFilter(DateTime activityDate, DateTime dateToFilter) {
    if (activityDate.hour == dateToFilter.hour &&
        activityDate.minute == dateToFilter.minute) {
      return true;
    }
    return false;
  }

  @action
  Future getActivities() async {
    setIsLoading(true);
    activitiesList = await getAllActivities();
    allActivitiesToCards = [];
    for (var activity in activitiesList) {
      allActivitiesToCards.add(
        CardActivity(
          id: '',
          activityCode: activity.activityCode,
          type: activity.type,
          title: activity.title,
          description: activity.description,
          date: activity.startDate,
          duration: 0,
          totalParticipants: activity.totalSlots,
          speakers: activity.speakers,
          location: activity.place,
          link: activity.link,
          enrolledUsers: activity.takenSlots,
          acceptSubscription: activity.acceptingNewEnrollments,
        ),
      );
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
