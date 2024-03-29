import '../repositories/activities_repository_interface.dart';

abstract class SubscribeActivityInterface {
  Future<bool> call(String activityCode);
}

class SubscribeActivity implements SubscribeActivityInterface {
  final ActivitiesRepositoryInterface repository;

  SubscribeActivity({required this.repository});

  @override
  Future<bool> call(String activityCode) {
    return repository.subscribeActivity(activityCode);
  }
}
