import 'package:mobx/mobx.dart';

import '../../../domain/repositories/activities_repository_interface.dart';

part 'more_info_controller.g.dart';

class MoreInfoController = _MoreInfoControllerBase with _$MoreInfoController;

abstract class _MoreInfoControllerBase with Store {
  final ActivitiesRepositoryInterface repository;

  _MoreInfoControllerBase({required this.repository});

  @observable
  bool isLoading = false;

  @action
  Future<void> setIsLoading(bool value) async {
    isLoading = value;
  }

  Future<void> subscribeActivity(
      String activityId, DateTime activityDate) async {
    setIsLoading(true);
    await repository.subscribeActivity(activityId, activityDate);
    setIsLoading(false);
  }
}
