import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/get_all_activities.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/user_subscription_controller.dart';
import 'package:smile_front/app/shared/entities/infra/enrollment_state_enum.dart';
import '../../../../../shared/models/enrolls_activity_model.dart';
import '../../../../../shared/services/firebase-analytics/firebase_analytics_service.dart';
import '../../../../auth/presenter/controllers/auth_controller.dart';
import '../../../domain/infra/activity_enum.dart';

part 'all_activities_user_dashboard_controller.g.dart';

class AllActivitiesUserDashboardController = AllActivitiesUserDashboardControllerBase
    with _$AllActivitiesUserDashboardController;

abstract class AllActivitiesUserDashboardControllerBase with Store {
  final GetAllUserActivitiesInterface getAllActivities;
  final UserSubscriptionController subscriptionController;
  final AuthController authController;

  final FirebaseAnalyticsService analytics;

  AllActivitiesUserDashboardControllerBase({
    required this.subscriptionController,
    required this.analytics,
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

  Future<void> subscribeUserActivity(String activityCode) async {
    setIsLoading(true);
    var requestDone =
        await subscriptionController.subscribeActivity(activityCode);
    if (requestDone) {}
    setIsLoading(false);
  }

  Future<void> unsubscribeUserActivity(String activityCode) async {
    setIsLoading(true);
    var requestDone =
        await subscriptionController.unsubscribeActivity(activityCode);
    if (requestDone) {}
    setIsLoading(false);
  }

  @observable
  List<EnrollsActivityModel> allActivitiesFromGet = List.empty();

  @observable
  List<EnrollsActivityModel> activitiesOnScreen = List.empty();

  @observable
  ActivityEnum? activityType;

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
    var listActivities = allActivitiesFromGet;
    if (typeFilter != null) {
      listActivities = filterActivitiesByType(typeFilter!, listActivities);
    }
    if (dateFilter != null) {
      listActivities = filterActivitiesByDate(dateFilter!, listActivities);
    }
    if (hourFilter != null) {
      listActivities = filterActivitiesByHour(hourFilter!, listActivities);
    }
    activitiesOnScreen = listActivities;
  }

  @action
  resetFilters() {
    activitiesOnScreen = allActivitiesFromGet;
    typeFilter = null;
    dateFilter = null;
    hourFilter = null;
  }

  @action
  List<EnrollsActivityModel> filterActivitiesByType(
      ActivityEnum type, List<EnrollsActivityModel> activitiesToFilter) {
    var list =
        activitiesToFilter.where((element) => element.type == type).toList();
    List<EnrollsActivityModel> enrolledList = [];
    for (var enrolledActivity in list) {
      enrolledList.add(EnrollsActivityModel(
        acceptingNewEnrollments: enrolledActivity.acceptingNewEnrollments,
        activityCode: enrolledActivity.activityCode,
        description: enrolledActivity.description,
        duration: enrolledActivity.duration,
        isExtensive: enrolledActivity.isExtensive,
        responsibleProfessors: enrolledActivity.responsibleProfessors,
        speakers: enrolledActivity.speakers,
        takenSlots: enrolledActivity.takenSlots,
        title: enrolledActivity.title,
        totalSlots: enrolledActivity.totalSlots,
        type: enrolledActivity.type,
        deliveryEnum: enrolledActivity.deliveryEnum,
        enrollments: enrolledActivity.enrollments,
        link: enrolledActivity.link,
        place: enrolledActivity.place,
        startDate: enrolledActivity.startDate,
        stopAcceptingNewEnrollmentsBefore:
            enrolledActivity.stopAcceptingNewEnrollmentsBefore,
      ));
    }
    return enrolledList;
  }

  @action
  List<EnrollsActivityModel> filterActivitiesByDate(
      DateTime date, List<EnrollsActivityModel> activitiesToFilter) {
    var list = activitiesToFilter
        .where((element) => isValidDateFilter(element.startDate!, date))
        .toList();
    List<EnrollsActivityModel> enrolledList = [];
    for (var enrolledActivity in list) {
      enrolledList.add(EnrollsActivityModel(
        acceptingNewEnrollments: enrolledActivity.acceptingNewEnrollments,
        activityCode: enrolledActivity.activityCode,
        description: enrolledActivity.description,
        duration: enrolledActivity.duration,
        isExtensive: enrolledActivity.isExtensive,
        responsibleProfessors: enrolledActivity.responsibleProfessors,
        speakers: enrolledActivity.speakers,
        takenSlots: enrolledActivity.takenSlots,
        title: enrolledActivity.title,
        totalSlots: enrolledActivity.totalSlots,
        type: enrolledActivity.type,
        deliveryEnum: enrolledActivity.deliveryEnum,
        enrollments: enrolledActivity.enrollments,
        link: enrolledActivity.link,
        place: enrolledActivity.place,
        startDate: enrolledActivity.startDate,
        stopAcceptingNewEnrollmentsBefore:
            enrolledActivity.stopAcceptingNewEnrollmentsBefore,
      ));
    }
    return enrolledList;
  }

  @action
  List<EnrollsActivityModel> filterActivitiesByHour(
      DateTime hour, List<EnrollsActivityModel> activitiesToFilter) {
    var list = activitiesToFilter
        .where((element) => isValidHourFilter(element.startDate!, hour))
        .toList();
    List<EnrollsActivityModel> enrolledList = [];
    for (var enrolledActivity in list) {
      enrolledList.add(EnrollsActivityModel(
        acceptingNewEnrollments: enrolledActivity.acceptingNewEnrollments,
        activityCode: enrolledActivity.activityCode,
        description: enrolledActivity.description,
        duration: enrolledActivity.duration,
        isExtensive: enrolledActivity.isExtensive,
        responsibleProfessors: enrolledActivity.responsibleProfessors,
        speakers: enrolledActivity.speakers,
        takenSlots: enrolledActivity.takenSlots,
        title: enrolledActivity.title,
        totalSlots: enrolledActivity.totalSlots,
        type: enrolledActivity.type,
        deliveryEnum: enrolledActivity.deliveryEnum,
        enrollments: enrolledActivity.enrollments,
        link: enrolledActivity.link,
        place: enrolledActivity.place,
        startDate: enrolledActivity.startDate,
        stopAcceptingNewEnrollmentsBefore:
            enrolledActivity.stopAcceptingNewEnrollmentsBefore,
      ));
    }
    return enrolledList;
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
    var allActivities = await getAllActivities();
    var enrolledActivities = subscriptionController.userEnrolledActivities;
    List<EnrollsActivityModel> finalList = [];
    for (var activity in allActivities) {
      finalList.add(EnrollsActivityModel(
        acceptingNewEnrollments: activity.acceptingNewEnrollments,
        activityCode: activity.activityCode,
        description: activity.description,
        duration: activity.duration,
        isExtensive: activity.isExtensive,
        responsibleProfessors: activity.responsibleProfessors,
        speakers: activity.speakers,
        takenSlots: activity.takenSlots,
        title: activity.title,
        totalSlots: activity.totalSlots,
        type: activity.type,
        deliveryEnum: activity.deliveryEnum,
        link: activity.link,
        place: activity.place,
        startDate: activity.startDate,
        stopAcceptingNewEnrollmentsBefore:
            activity.stopAcceptingNewEnrollmentsBefore,
      ));
    }
    // for (var activity in finalList) {
    //   for (var element in enrolledActivities) {
    //     element.activity.activityCode == activity.activityCode
    //         ? activity.copyWith(state: EnrollmentStateEnum.ENROLLED)
    //         : null;
    //   }
    // }
    allActivitiesFromGet = finalList;
    activitiesOnScreen = allActivitiesFromGet;
    setIsLoading(false);
  }

  @action
  Future<void> logout() async {
    await authController.logout();
    Modular.to.navigate('/login');
  }
}
