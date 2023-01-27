import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/get_all_activities.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/get_download_link_csv.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../auth/presenter/controllers/auth_controller.dart';
import '../../../domain/usecases/delete_activity.dart';
part 'adm_dashboard_controller.g.dart';

class AdmDashboardController = AdmDashboardControllerBase
    with _$AdmDashboardController;

abstract class AdmDashboardControllerBase with Store {
  final AuthController authController;
  final GetDownloadLinkCsvInterface getDownloadLinkCsv;
  final GetAllUserActivitiesInterface getAllUserActivities;
  final DeleteActivityInterface deleteActivity;

  AdmDashboardControllerBase(
      {required this.getDownloadLinkCsv,
      required this.authController,
      required this.getAllUserActivities,
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
  bool isFloatActionButtonOpen = false;

  @observable
  int? filterActivityChipIndexSelected;

  @observable
  List<ActivityModel> activitiesList = List.empty();

  @observable
  List<ActivityModel> allActivitiesList = List.empty();

  @action
  void toggleFloatActionButton() {
    isFloatActionButtonOpen = !isFloatActionButtonOpen;
  }

  @observable
  ActivityEnum? type;

  @action
  void setFilterType(ActivityEnum value) {
    type = value;
  }

  @observable
  DateTime? date;

  @action
  void setFilterDate(DateTime value) {
    date = value;
  }

  @observable
  DateTime? hour;

  @action
  void setFilterHour(DateTime value) {
    hour = value;
  }

  @action
  void allFilters() {
    var listActivities = allActivitiesList;
    if (type != null) {
      listActivities = filterActivitiesByType(type!, listActivities);
    }
    if (date != null) {
      listActivities = filterActivitiesByDate(date!, listActivities);
    }
    if (hour != null) {
      listActivities = filterActivitiesByHour(hour!, listActivities);
    }
    activitiesList = listActivities;
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
        .where((element) => isValidDateFilter(element.schedule.date!, date))
        .toList();
    return list;
  }

  @action
  List<ActivityModel> filterActivitiesByHour(
      DateTime hour, List<ActivityModel> activitiesToFilter) {
    var list = activitiesToFilter
        .where((element) => isValidHourFilter(element.schedule.date!, hour))
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
  Future getAllActivities() async {
    setIsLoading(true);
    activitiesList = await getAllUserActivities();
    allActivitiesList = activitiesList;
    setIsLoading(false);
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
}
