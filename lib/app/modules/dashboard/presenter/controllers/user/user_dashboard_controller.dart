import 'package:dio/dio.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/auth/domain/repositories/secure_storage_interface.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/change_data.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/user_subscription_controller.dart';
import 'package:smile_front/app/shared/models/enrolls_activity_model.dart';
import 'package:smile_front/app/shared/services/firebase-analytics/firebase_analytics_service.dart';

import '../../../../../../generated/l10n.dart';

part 'user_dashboard_controller.g.dart';

class UserDashboardController = UserDashboardControllerBase
    with _$UserDashboardController;

abstract class UserDashboardControllerBase with Store {
  final UserEnrollmentController enrollmentController;
  final ChangeDataInterface changeData;
  final SecureStorageInterface secureStorage;
  final FirebaseAnalyticsService analytics;

  UserDashboardControllerBase({
    required this.enrollmentController,
    required this.analytics,
    required this.changeData,
    required this.secureStorage,
  }) {
    getUserSubscribedActivities();
    getUserName();
    getUserSocialName();
    getPhone();
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
  String phoneToChange = '';

  @observable
  bool wantSocialName = false;

  @observable
  List<EnrollsActivityModel> subscribedActivitiesOnScreen = List.empty();

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
    var listActivities = allSubscribedActivitiesList;
    if (typeFilter != null) {
      listActivities = filterActivitiesByType(typeFilter!, listActivities);
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
  }

  @action
  Future<void> getUserName() async {
    name = await secureStorage.getName();
    setName(name ?? '');
  }

  @action
  Future<void> getPhone() async {
    phone = await secureStorage.getPhone();
    phoneToChange = phone!.substring(3, 14);
    if (isBrazilianPhone) {
      phoneToChange =
          '(${phoneToChange.substring(0, 2)})${phoneToChange.substring(2, 7)}-${phoneToChange.substring(7, 11)}';
    }
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
    await changeData(nameToChange, socialNameToChange,
        certificateWithSocialName, phoneToChange);
    await secureStorage.saveName(nameToChange);
    await secureStorage.saveSocialName(socialNameToChange);
    await secureStorage
        .saveCertificateWithSocialName(certificateWithSocialName);
    getUserName();
    getUserSocialName();
    getUserSubscribedActivities();
    getPhone();
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
      nextActivity = allSubscribedActivitiesList.first;
    } else {
      nextActivity = EnrollsActivityModel.newInstance();
    }
  }

  @observable
  String? phone = '';

  @observable
  bool isBrazilianPhone = true;

  @observable
  bool isPhoneFieldFilled = false;

  @observable
  CountryCode? countryCode =
      const CountryCode(code: "BR", dialCode: "+55", name: "Brasil");

  @action
  void setBrazilianPhone(CountryCode? value) {
    if (value?.code == "BR") {
      isBrazilianPhone = true;
    } else {
      isBrazilianPhone = false;
    }
  }

  @action
  void setCountryCode(CountryCode? value) {
    countryCode = value;
  }

  @action
  Future<void> setPhone(String value) async {
    phoneToChange = '${countryCode?.dialCode}$value';
    if (countryCode?.code == "BR") {
      phoneToChange = phoneToChange.replaceAll('(', '');
      phoneToChange = phoneToChange.replaceAll(')', '');
      phoneToChange = phoneToChange.replaceAll(' ', '');
      phoneToChange = phoneToChange.replaceAll('-', '');
    }
    if (value.isNotEmpty) {
      isPhoneFieldFilled = true;
    }
  }

  @action
  String? validatePhone(String? value) {
    if (countryCode?.code == "BR" && phone!.length == 12) {
      return S.current.fieldDDDRequired;
    }
    if (countryCode?.code == "BR" && phone!.length != 14 && phone!.length > 3) {
      return S.current.fieldInvalid;
    }
    return null;
  }
}
