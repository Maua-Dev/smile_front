import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/get_all_activities.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/get_download_link_csv.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../auth/presenter/controllers/auth_controller.dart';
part 'adm_dashboard_controller.g.dart';

class AdmDashboardController = AdmDashboardControllerBase
    with _$AdmDashboardController;

abstract class AdmDashboardControllerBase with Store {
  final AuthController authController;
  final GetDownloadLinkCsvInterface getDownloadLinkCsv;
  final GetAllUserActivitiesInterface getAllUserActivities;

  AdmDashboardControllerBase(
      {required this.getDownloadLinkCsv,
      required this.authController,
      required this.getAllUserActivities}) {
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

  // @computed
  // List<CardActivity> get mondayActivitiesList => allActivitiesToCards
  //     .where((activity) => activity.date!.weekday == 1)
  //     .toList();

  // @computed
  // List<CardActivity> get tuesdayActivitiesList => allActivitiesToCards
  //     .where((activity) => activity.date!.weekday == 2)
  //     .toList();

  // @computed
  // List<CardActivity> get wednesdayActivitiesList => allActivitiesToCards
  //     .where((activity) => activity.date!.weekday == 3)
  //     .toList();

  // @computed
  // List<CardActivity> get thursdayActivitiesList => allActivitiesToCards
  //     .where((activity) => activity.date!.weekday == 4)
  //     .toList();

  // @computed
  // List<CardActivity> get fridayActivitiesList => allActivitiesToCards
  //     .where((activity) => activity.date!.weekday == 5)
  //     .toList();

  // @computed
  // List<CardActivity> get saturdayActivitiesList => allActivitiesToCards
  //     .where((activity) => activity.date!.weekday == 6)
  //     .toList();

  // @computed
  // List<CardActivity> get sundayActivitiesList => allActivitiesToCards
  //     .where((activity) => activity.date!.weekday == 7)
  //     .toList();

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
}
