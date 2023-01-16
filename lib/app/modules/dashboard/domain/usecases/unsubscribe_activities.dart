import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart';

abstract class UnsubscribeActivityInterface {
  Future<bool> call(String activityId, DateTime activityDate);
}

class UnsubscribeActivity implements UnsubscribeActivityInterface {
  final ActivitiesRepositoryInterface repository;

  UnsubscribeActivity({required this.repository});

  @override
  Future<bool> call(String activityId, DateTime activityDate) {
    return repository.unsubscribeActivity(activityId, activityDate);
  }
}
