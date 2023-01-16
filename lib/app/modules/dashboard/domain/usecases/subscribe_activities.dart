import 'package:smile_front/app/shared/models/activity_model.dart';

import '../repositories/activities_repository_interface.dart';

abstract class SubscribeActivityInterface {
  Future<bool> call(
      ActivityModel activity, String activityId, DateTime activityDate);
}

class SubscribeActivity implements SubscribeActivityInterface {
  final ActivitiesRepositoryInterface repository;

  SubscribeActivity({required this.repository});

  @override
  Future<bool> call(
      ActivityModel activity, String activityId, DateTime activityDate) {
    return repository.subscribeActivity(activity, activityId, activityDate);
  }
}
