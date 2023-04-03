import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/get_admin_activities_interface.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/get_download_link_csv.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/manual_drop_activity.dart';
import 'package:smile_front/app/shared/models/admin_activity_model.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../shared/models/enrollments_model.dart';
import '../../../../auth/presenter/controllers/auth_controller.dart';
import '../../../domain/usecases/delete_activity.dart';
part 'adm_dashboard_controller.g.dart';

class AdmDashboardController = AdmDashboardControllerBase
    with _$AdmDashboardController;

abstract class AdmDashboardControllerBase with Store {
  final AuthController authController;
  final GetDownloadLinkCsvInterface getDownloadLinkCsv;
  final GetAdminActivitiesInterface getAdminActivities;
  final DeleteActivityInterface deleteActivity;
  final ManualDropActivityInterface manualDropActivity;

  AdmDashboardControllerBase(
      {required this.getDownloadLinkCsv,
      required this.manualDropActivity,
      required this.authController,
      required this.getAdminActivities,
      required this.deleteActivity}) {
    getAllActivities();
  }

  Future<void> downloadCsv() async {
    setIsLoadingCsv(true);
    var url = await getDownloadLinkCsv();
    var csvUrl = Uri.parse(url);
    if (!await launchUrl(
      csvUrl,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $csvUrl';
    }
    setIsLoadingCsv(false);
  }

  @computed
  String get emailLogDevCommunity => 'log.devmaua@gmail.com';

  @observable
  bool isLoadingCsv = false;

  @action
  Future<void> setIsLoadingCsv(bool value) async {
    isLoadingCsv = value;
  }

  @observable
  bool isLoading = false;

  @action
  Future<void> setIsLoading(bool value) async {
    isLoading = value;
  }

  @observable
  bool isManualDropLoading = false;

  @action
  Future<void> setManualDropIsLoading(bool value) async {
    isManualDropLoading = value;
  }

  @observable
  bool isFloatActionButtonOpen = false;

  @observable
  int? filterActivityChipIndexSelected;

  @observable
  List<AdminActivityModel> activitiesList = List.empty();

  @observable
  List<AdminActivityModel> allActivitiesList = List.empty();

  @action
  void toggleFloatActionButton() {
    isFloatActionButtonOpen = !isFloatActionButtonOpen;
  }

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

  @action
  void setAllFilters() {
    var listActivities = allActivitiesList;
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
    activitiesList = allActivitiesList;
    typeFilter = null;
    dateFilter = null;
    hourFilter = null;
  }

  @action
  List<AdminActivityModel> filterActivitiesByType(
      ActivityEnum type, List<AdminActivityModel> activitiesToFilter) {
    var list =
        activitiesToFilter.where((element) => element.type == type).toList();
    return list;
  }

  @action
  List<AdminActivityModel> filterActivitiesByDate(
      DateTime date, List<AdminActivityModel> activitiesToFilter) {
    var list = activitiesToFilter
        .where((element) => isValidDateFilter(element.startDate!, date))
        .toList();
    return list;
  }

  @action
  List<AdminActivityModel> filterActivitiesByHour(
      DateTime hour, List<AdminActivityModel> activitiesToFilter) {
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
  Future<void> logout() async {
    await authController.logout();
    Modular.to.navigate('/login');
  }

  @action
  Future deleteUserActivity(String id) async {
    setIsLoading(true);
    await deleteActivity(id);
    setIsLoading(false);
  }

  @action
  Future dropActivity(String activityCode, String userId) async {
    setIsLoading(true);
    await manualDropActivity(activityCode, userId);
    setIsLoading(false);
  }

  @action
  Future getAllActivities() async {
    setIsLoading(true);
    activitiesList = await getAdminActivities();
    allActivitiesList = await getAdminActivities();
    setIsLoading(false);
  }

  @action
  Future sendEmailToAll(List<EnrollmentsModel> enrollments) async {
    if (enrollments.isNotEmpty) {
      var allEmails =
          enrollments.map((enrollment) => enrollment.user!.email).join(',');
      launchUrl(
        Uri.parse('mailto:$allEmails?&bcc=$emailLogDevCommunity'),
        mode: LaunchMode.externalApplication,
      );
    }
  }
}
