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
  List<ActivityModel> saveActivitiesList = List.empty();

  @action
  void toggleFloatActionButton() {
    isFloatActionButtonOpen = !isFloatActionButtonOpen;
  }

  @action
  void toggleFilterActivityChipIndex(index) {
    if (index == filterActivityChipIndexSelected) {
      filterActivityChipIndexSelected = null;
      activitiesList = saveActivitiesList;
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
  }

  @action
  Future getAllActivities() async {
    setIsLoading(true);
    activitiesList = await getAllUserActivities();
    saveActivitiesList = activitiesList;
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
