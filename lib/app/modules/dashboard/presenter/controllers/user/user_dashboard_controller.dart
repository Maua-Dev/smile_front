import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/auth/domain/repositories/secure_storage_interface.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/change_data.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/user_subscription_controller.dart';
import 'package:smile_front/app/shared/models/enrolls_activity_model.dart';
import 'package:smile_front/app/shared/services/firebase-analytics/firebase_analytics_service.dart';

part 'user_dashboard_controller.g.dart';

class UserDashboardController = UserDashboardControllerBase
    with _$UserDashboardController;

abstract class UserDashboardControllerBase with Store {
  final UserEnrollmentController subscriptionController;
  final ChangeDataInterface changeData;
  final SecureStorageInterface secureStorage;
  final FirebaseAnalyticsService analytics;

  UserDashboardControllerBase({
    required this.subscriptionController,
    required this.analytics,
    required this.changeData,
    required this.secureStorage,
  }) {
    getUserSubscribedActivities();
    getUserName();
    getUserSocialName();
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
    await changeData(
        nameToChange, socialNameToChange, certificateWithSocialName);
    await secureStorage.saveName(nameToChange);
    await secureStorage.saveSocialName(socialNameToChange);
    await secureStorage
        .saveCertificateWithSocialName(certificateWithSocialName);
    getUserName();
    getUserSocialName();
    getUserSubscribedActivities();
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
  List<EnrollsActivityModel> subscribedActivitiesList = List.empty();

  @observable
  EnrollsActivityModel nextActivity = EnrollsActivityModel.newInstance();

  @action
  Future getActivities() async {
    subscribedActivitiesList = await subscriptionController.getUserActivities();
  }

  @action
  Future getUserSubscribedActivities() async {
    setIsLoading(true);
    subscribedActivitiesList = await subscriptionController.getUserActivities();
    if (subscribedActivitiesList.isNotEmpty) {
      subscribedActivitiesList.sort(
        (a, b) => a.startDate!.compareTo(b.startDate!),
      );
      getNextActivity();
    }
    setIsLoading(false);
  }

  @action
  void getNextActivity() {
    if (subscribedActivitiesList.isNotEmpty) {
      nextActivity = subscribedActivitiesList.first;
    } else {
      nextActivity = EnrollsActivityModel.newInstance();
    }
  }
}
