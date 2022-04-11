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
    startIsRegistered();
  }

  @observable
  bool isRegistered = false;

  @action
  Future<void> startIsRegistered() async {
    if (controller.allActivitiesToCards
        .map((e) => e.id)
        .contains(activity.id)) {
      isRegistered = true;
    } else {
      isRegistered = false;
    }
  }

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

  Future<void> subscribeActivity() async {
    setIsLoading(true);
    await repository.subscribeActivity(activity.id, activity.date!);
    controller.allActivitiesToCards
        .insert(controller.allActivitiesToCards.length, activity);
    controller.getNextActivity();
    setIsLoading(false);
    setIsRegistered(true);
  }

  Future<void> unsubscribeActivity() async {
    setIsLoading(true);
    await repository.unsubscribeActivity(activity.id, activity.date!);
    controller.allActivitiesToCards
        .removeWhere((element) => element.id == activity.id);
    controller.getNextActivity();
    setIsLoading(false);
    setIsRegistered(false);
  }
}
