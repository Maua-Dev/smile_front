import 'package:mobx/mobx.dart';

import '../../../../../../shared/models/enrolls_activity_model.dart';
import '../../../../../auth/presenter/controllers/auth_controller.dart';
import '../../../../domain/infra/activity_enum.dart';
import '../../../../domain/usecases/get_user_subscribed_activities.dart';

part 'responsible_activities_controller.g.dart';

class ResponsibleActivitiesController = ResponsibleActivitiesControllerBase
    with _$ResponsibleActivitiesController;

abstract class ResponsibleActivitiesControllerBase with Store {
  final GetUserSubscribedActivitiesInterface getUserSubscribedActivities;
  final AuthController authController;

  ResponsibleActivitiesControllerBase(
      {required this.authController,
      required this.getUserSubscribedActivities}) {
    getFiltredActivities();
  }

  @observable
  bool isLoading = false;

  @action
  Future<void> setIsLoading(bool value) async {
    isLoading = value;
  }

  @observable
  List<EnrollsActivityModel> allResponsibleActivities = [];

  @action
  Future<void> getFiltredActivities() async {
    setIsLoading(true);
    var allActivities = await getUserSubscribedActivities();
    var userId = authController.id;
    for (var activity in allActivities) {
      for (var professor in activity.responsibleProfessors) {
        if (professor.id == userId) {
          allResponsibleActivities.add(activity);
        }
      }
    }
    setIsLoading(false);
  }

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
    var listActivities = allResponsibleActivities;
    if (typeFilter != null) {
      listActivities = filterActivitiesByType(typeFilter!, listActivities);
    }
    if (dateFilter != null) {
      listActivities = filterActivitiesByDate(dateFilter!, listActivities);
    }
    if (hourFilter != null) {
      listActivities = filterActivitiesByHour(hourFilter!, listActivities);
    }
    allResponsibleActivities = listActivities;
  }

  @action
  resetFilters() {
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
}
