import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/user_dashboard_controller.dart';

import '../../../../../shared/entities/card_activity.dart';
import '../../../domain/repositories/activities_repository_interface.dart';

part 'more_info_controller.g.dart';

class MoreInfoController = _MoreInfoControllerBase with _$MoreInfoController;

abstract class _MoreInfoControllerBase with Store {
  final ActivitiesRepositoryInterface repository;
  final CardActivity activity;
  final controller = Modular.get<UserDashboardController>();

  _MoreInfoControllerBase({required this.activity, required this.repository}) {
    setIsRegistered();
  }

  @observable
  bool isRegistered = false;

  @action
  Future<void> setIsRegistered() async {
    if (controller.allActivitiesToCards
        .map((e) => e.id)
        .contains(activity.id)) {
      isRegistered = true;
    } else {
      isRegistered = false;
    }
  }

  @observable
  bool isLoading = false;

  @action
  Future<void> setIsLoading(bool value) async {
    isLoading = value;
  }

  Future<void> subscribeActivity() async {
    setIsLoading(true);
    await repository.subscribeActivity(activity.id, activity.date!);
    await controller.getUserSubscribedActivities();
    controller.getNextActivity();
    Modular.to.navigate('/user/home');
    setIsLoading(false);
  }

  Future<void> unsubscribeActivity() async {
    setIsLoading(true);
    await repository.unsubscribeActivity(activity.id, activity.date!);
    await controller.getUserSubscribedActivities();
    controller.getNextActivity();
    Modular.to.navigate('/user/home');
    setIsLoading(false);
  }
}
