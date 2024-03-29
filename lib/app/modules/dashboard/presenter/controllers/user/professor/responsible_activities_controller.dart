import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:smile_front/app/shared/entities/infra/enrollment_state_enum.dart';
import '../../../../../../../generated/l10n.dart';
import '../../../../../../shared/entities/infra/enroll_button_enum.dart';
import '../../../../../../shared/models/enrollments_model.dart';
import '../../../../../../shared/models/enrolls_activity_model.dart';
import '../../../../../auth/domain/repositories/secure_storage_interface.dart';
import '../../../../domain/infra/activity_enum.dart';
import '../../../../domain/usecases/get_user_subscribed_activities.dart';

part 'responsible_activities_controller.g.dart';

class ResponsibleActivitiesController = ResponsibleActivitiesControllerBase
    with _$ResponsibleActivitiesController;

abstract class ResponsibleActivitiesControllerBase with Store {
  final GetUserSubscribedActivitiesInterface getUserSubscribedActivities;
  final SecureStorageInterface storage;

  ResponsibleActivitiesControllerBase(
      {required this.storage, required this.getUserSubscribedActivities}) {
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

  @observable
  List<EnrollsActivityModel> activitiesToShow = [];

  @observable
  String? requisitionError;

  @action
  Future<void> getFiltredActivities() async {
    setIsLoading(true);
    try {
      var allActivities = await getUserSubscribedActivities();
      var userId = await storage.getId();
      for (var activity in allActivities) {
        for (var professor in activity.responsibleProfessors) {
          if (professor.id == userId) {
            allResponsibleActivities.add(activity);
          }
        }
      }
      activitiesToShow = allResponsibleActivities;
    } on DioError catch (e) {
      requisitionError = e.response!.data;
    } catch (e) {
      requisitionError = S.current.errorGenericGetActivities;
    }
    setIsLoading(false);
  }

  @observable
  ActivityEnum? activityType;

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

  @observable
  EnrollButtonEnum? enrollmentFilter;

  @action
  void setEnrollmentFilter(EnrollButtonEnum value) {
    enrollmentFilter = value;
    setAllFilters();
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
  void setAllFilters() {
    var listActivities = allResponsibleActivities;
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
    activitiesToShow = listActivities;
  }

  @action
  resetFilters() {
    activitiesToShow = allResponsibleActivities;
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
