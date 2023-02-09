import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/subscribe_activities.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/unsubscribe_activities.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/user_dashboard_controller.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';

part 'more_info_controller.g.dart';

class MoreInfoController = MoreInfoControllerBase with _$MoreInfoController;

abstract class MoreInfoControllerBase with Store {
  final ActivityModel activity;
  final bool registered;
  final UserDashboardController userDashboardController;
  final SubscribeActivityInterface subscribeActivity;
  final UnsubscribeActivityInterface unsubscribeActivity;

  MoreInfoControllerBase(
      {required this.userDashboardController,
      required this.registered,
      required this.activity,
      required this.subscribeActivity,
      required this.unsubscribeActivity}) {
    isRegistered = registered;
  }

  @observable
  bool isRegistered = false;

  @action
  Future<void> setIsRegistered(bool value) async {
    isRegistered = value;
  }

  @observable
  bool isLoading = false;

  @action
  Future<void> setIsLoading(bool value) async {
    isLoading = value;
  }
}
