import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/auth/domain/repositories/secure_storage_interface.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/change_data.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/delete_user.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/user_subscription_controller.dart';
import 'package:smile_front/app/shared/models/enrolls_activity_model.dart';
import '../../../../../shared/entities/infra/enroll_button_enum.dart';
import '../../../../../shared/entities/infra/enrollment_state_enum.dart';
import '../../../../../shared/models/enrollments_model.dart';

part 'user_dashboard_controller.g.dart';

class UserDashboardController = UserDashboardControllerBase
    with _$UserDashboardController;

abstract class UserDashboardControllerBase with Store {
  final UserEnrollmentController enrollmentController;
  final ChangeDataInterface changeData;
  final SecureStorageInterface secureStorage;
  final DeleteUserInterface deleteUser;
  UserDashboardControllerBase(
      {required this.enrollmentController,
      required this.changeData,
      required this.secureStorage,
      required this.deleteUser}) {
    getUserSubscribedActivities();
    getUserName();
    getUserSocialName();
    getAcceptEmailNotifications();
    getEmail();
    getIdToken();
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

  @observable
  String emailTyped = '';

  @observable
  bool isEmailTypedCorrectly = false;

  @observable
  List<EnrollsActivityModel> subscribedActivitiesOnScreen = List.empty();

  @observable
  ActivityEnum? activityType;

  @observable
  ActivityEnum? typeFilter;

  @observable
  String? typeOnScreen;

  @observable
  bool acceptEmailNotifications = false;

  @observable
  bool initialWantSocialName = false;

  @observable
  String initialName = '';

  @observable
  bool initialAcceptEmailNotifications = false;

  @observable
  bool inititalCertificateWithSocialName = false;

  @observable
  String initialSocialName = '';

  @observable
  bool wasWantSocialNameUpdated = false;

  @observable
  bool wasNameUpdated = false;

  @observable
  bool wasAcceptEmailNotificationUpdated = false;

  @observable
  bool wasCertificateWithSocialNameUpdated = false;

  @observable
  bool wasSocialNameUpdated = false;

  @observable
  String? email;

  @observable
  String? idToken = '';

  @action
  void setTypeFilter(ActivityEnum value) {
    typeFilter = value;
    typeOnScreen = value.name;
    setAllFilters();
  }

  @observable
  EnrollButtonEnum? enrollmentFilter;

  @action
  void setEnrollmentFilter(EnrollButtonEnum value) {
    enrollmentFilter = value;
    setAllFilters();
  }

  Future<void> subscribeUserActivity(String activityCode) async {
    setIsLoading(true);
    await enrollmentController.subscribeActivity(activityCode);
    await getUserSubscribedActivities();
    setIsLoading(false);
    Modular.to.pop();
    setAllFilters();
  }

  Future<void> unsubscribeUserActivity(String activityCode) async {
    setIsLoading(true);
    await enrollmentController.unsubscribeActivity(activityCode);
    await getUserSubscribedActivities();
    setIsLoading(false);
    Modular.to.pop();
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
    var listActivities = allSubscribedActivitiesList;
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
    subscribedActivitiesOnScreen = listActivities;
  }

  @action
  resetFilters() {
    subscribedActivitiesOnScreen = allSubscribedActivitiesList;
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
  Future<void> getCertificateWithSocialName() async {
    certificateWithSocialName =
        (await secureStorage.getCertificateWithSocialName())!;
    inititalCertificateWithSocialName = certificateWithSocialName;
  }

  @action
  Future<void> getUserName() async {
    name = await secureStorage.getName();
    initialName = name!;
    setName(name ?? '');
  }

  @action
  Future<void> getAcceptEmailNotifications() async {
    acceptEmailNotifications =
        (await secureStorage.getAcceptEmailNotifications())!;
    initialAcceptEmailNotifications = acceptEmailNotifications;
  }

  @action
  Future<void> getEmail() async {
    email = (await secureStorage.getEmail());
  }

  @action
  Future<void> getIdToken() async {
    idToken = (await secureStorage.getIdToken());
  }

  @action
  Future<void> getUserSocialName() async {
    socialName = await secureStorage.getSocialName();
    initialSocialName = socialName!;
    setUserSocialName(socialName ?? '');
    if (socialName != null && socialName != '') {
      wantSocialName = true;
    } else {
      wantSocialName = false;
    }
    initialWantSocialName = wantSocialName;
  }

  @action
  Future<void> setWantSocialName(bool? value) async {
    if (value == initialWantSocialName) {
      wasWantSocialNameUpdated = false;
    } else {
      wasWantSocialNameUpdated = true;
    }
    if (value == false) {
      setCertificateWithSocialName(value!);
    }
    wantSocialName = value!;
    setUserSocialName('');
  }

  @action
  Future<void> setEmailNotifications(bool? value) async {
    if (value == initialAcceptEmailNotifications) {
      wasAcceptEmailNotificationUpdated = false;
    } else {
      wasAcceptEmailNotificationUpdated = true;
    }
    acceptEmailNotifications = value!;
  }

  @action
  void setName(String value) {
    if (value == initialName) {
      wasNameUpdated = false;
    } else {
      wasNameUpdated = true;
    }
    nameToChange = value;
  }

  @action
  void setUserSocialName(String value) {
    if (value == initialSocialName) {
      wasSocialNameUpdated = false;
    } else {
      wasSocialNameUpdated = true;
    }
    socialNameToChange = value;
  }

  @action
  void setCertificateWithSocialName(bool value) {
    if (value == inititalCertificateWithSocialName) {
      wasCertificateWithSocialNameUpdated = false;
    } else {
      wasCertificateWithSocialNameUpdated = true;
    }
    certificateWithSocialName = value;
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
  List<EnrollsActivityModel> allSubscribedActivitiesList = List.empty();

  @observable
  EnrollsActivityModel nextActivity = EnrollsActivityModel.newInstance();

  @observable
  String? requisitionError;

  @action
  Future getUserSubscribedActivities() async {
    setIsLoading(true);
    try {
      await enrollmentController.getUserAllActivitiesWithEnrollment();
      allSubscribedActivitiesList = enrollmentController.subscribedActivities;
      if (allSubscribedActivitiesList.isNotEmpty) {
        allSubscribedActivitiesList.sort(
          (a, b) => a.startDate!.compareTo(b.startDate!),
        );
        subscribedActivitiesOnScreen = allSubscribedActivitiesList;
        getNextActivity();
      }
    } on DioError catch (e) {
      requisitionError = e.response!.data;
    } catch (e) {
      requisitionError = 'Ocorreu algum erro ao carregar atividades :(';
    }

    setIsLoading(false);
  }

  @action
  void getNextActivity() {
    if (allSubscribedActivitiesList.isNotEmpty) {
      for (EnrollsActivityModel activity in allSubscribedActivitiesList) {
        var hour = activity.duration ~/ 60;
        var minutes = activity.duration - (hour * 60);
        var finalTime = DateTime(
            activity.startDate!.year,
            activity.startDate!.month,
            activity.startDate!.day,
            activity.startDate!.hour + hour.toInt(),
            activity.startDate!.minute + minutes.toInt());
        if (activity.startDate!.isAfter(DateTime.now()) &&
            finalTime.isAfter(DateTime.now())) {
          nextActivity = activity;
          break;
        }
      }
    } else {
      nextActivity = EnrollsActivityModel.newInstance();
    }
  }

  @action
  Future<void> changeUserData() async {
    setIsLoading(true);
    await changeData(nameToChange, socialNameToChange,
        certificateWithSocialName, acceptEmailNotifications);
    await secureStorage.saveName(nameToChange);
    await secureStorage.saveSocialName(socialNameToChange);
    await secureStorage
        .saveCertificateWithSocialName(certificateWithSocialName);
    await secureStorage.saveAcceptEmailNotifications(acceptEmailNotifications);
    getUserName();
    getUserSocialName();
    getUserSubscribedActivities();
    getAcceptEmailNotifications();
    setIsLoading(false);
  }

  @action
  void setIsEmailTypedCorrectly(bool value) {
    isEmailTypedCorrectly = value;
  }

  @action
  void validateEmailTyped(String value) {
    if (value == email) {
      isEmailTypedCorrectly = true;
    } else {
      isEmailTypedCorrectly = false;
    }
  }

  @action
  Future<void> deleteUserAccount() async {
    setIsLoading(true);
    await deleteUser();
    await secureStorage.deleteAll();
    Modular.to.pushReplacementNamed('/login');
    setIsLoading(false);
  }
}
