import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/user_subscription_controller.dart';
import 'package:smile_front/app/shared/domain/enum/enroll_button_enum.dart';
import 'package:smile_front/app/shared/domain/enum/enrollment_state_enum.dart';
import 'package:smile_front/generated/l10n.dart';
import '../../../../../shared/infra/models/enrollments_model.dart';
import '../../../../../shared/infra/models/enrolls_activity_model.dart';

import '../../../../auth/presenter/controllers/auth_controller.dart';
import '../../../domain/infra/activity_enum.dart';

part 'all_activities_user_dashboard_controller.g.dart';

class AllActivitiesUserDashboardController = AllActivitiesUserDashboardControllerBase
    with _$AllActivitiesUserDashboardController;

abstract class AllActivitiesUserDashboardControllerBase with Store {
  final UserEnrollmentController enrollmentController;
  final AuthController authController;

  AllActivitiesUserDashboardControllerBase({
    required this.enrollmentController,
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
    await enrollmentController.subscribeActivity(activityCode);
    setIsLoading(false);
    Modular.to.pop();
    setAllFilters();
  }

  Future<void> unsubscribeUserActivity(String activityCode) async {
    setIsLoading(true);
    await enrollmentController.unsubscribeActivity(activityCode);
    setIsLoading(false);
    Modular.to.pop();
    setAllFilters();
  }

  Future<void> getInQueueUserActivity(String activityCode) async {
    setIsLoading(true);
    await enrollmentController.subscribeActivity(activityCode);
    setIsLoading(false);
    Modular.to.pop();
    setAllFilters();
  }

  Future<void> getOutQueueUserActivity(String activityCode) async {
    setIsLoading(true);
    await enrollmentController.unsubscribeActivity(activityCode);
    setIsLoading(false);
    Modular.to.pop();
    setAllFilters();
  }

  @observable
  List<EnrollsActivityModel> allActivitiesFromGet = List.empty();

  @observable
  List<EnrollsActivityModel> activitiesOnScreen = List.empty();

  @observable
  EnrollButtonEnum? enrollmentFilter;

  @observable
  ActivityEnum? typeFilter;

  @observable
  String? typeOnScreen;

  @action
  void setTypeFilter(ActivityEnum value) {
    typeFilter = value;
    typeOnScreen = value.name;
    setAllFilters();
  }

  @action
  void setEnrollmentFilter(EnrollButtonEnum value) {
    enrollmentFilter = value;
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
    if (enrollmentFilter != null) {
      listActivities =
          filterActivitiesByEnrollmentState(enrollmentFilter!, listActivities);
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
    enrollmentFilter = null;
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
  List<EnrollsActivityModel> filterActivitiesByEnrollmentState(
      EnrollButtonEnum type, List<EnrollsActivityModel> activitiesToFilter) {
    var list = activitiesToFilter.where((element) {
      var enroll = element.enrollments != null
          ? element.enrollments!.state
          : EnrollmentsModel(
              state: EnrollmentStateEnum.NONE, dateSubscribed: DateTime.now());
      switch (type) {
        case EnrollButtonEnum.COMPLETED:
          return enroll == EnrollmentStateEnum.COMPLETED;
        case EnrollButtonEnum.INSCRITO:
          return enroll == EnrollmentStateEnum.ENROLLED;
        case EnrollButtonEnum.INSCREVA_SE:
          return (element.takenSlots < element.totalSlots &&
              element.acceptingNewEnrollments == true &&
              enroll != EnrollmentStateEnum.COMPLETED &&
              enroll != EnrollmentStateEnum.ENROLLED);
        case EnrollButtonEnum.INDISPONIVEL:
          return (element.acceptingNewEnrollments != true &&
              enroll != EnrollmentStateEnum.ENROLLED &&
              enroll != EnrollmentStateEnum.COMPLETED);
        case EnrollButtonEnum.ENTRAR_NA_FILA:
          return (element.takenSlots >= element.totalSlots &&
              enroll != EnrollmentStateEnum.ENROLLED &&
              enroll != EnrollmentStateEnum.COMPLETED &&
              element.acceptingNewEnrollments == true);
        case EnrollButtonEnum.NA_FILA:
          return enroll == EnrollmentStateEnum.IN_QUEUE;
      }
    }).toList();

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

  @observable
  String? requisitionError;

  @action
  Future getActivities() async {
    setIsLoading(true);
    try {
      await enrollmentController.getUserAllActivitiesWithEnrollment();
      allActivitiesFromGet = enrollmentController.allActivitiesWithEnrollments;
      activitiesOnScreen = enrollmentController.allActivitiesWithEnrollments;
    } on DioError catch (e) {
      requisitionError = e.response!.data;
    } catch (e) {
      requisitionError = S.current.errorGenericGetActivities;
    }
    setIsLoading(false);
  }

  @action
  Future<void> logout() async {
    await authController.logout();
    Modular.to.navigate('/login');
  }
}
