import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart';

abstract class UnsubscribeActivityInterface {
  Future<bool> call(String activityCode);
}

class UnsubscribeActivity implements UnsubscribeActivityInterface {
  final ActivitiesRepositoryInterface repository;

  UnsubscribeActivity({required this.repository});

  @override
  Future<bool> call(String activityCode) {
    return repository.unsubscribeActivity(activityCode);
  }
}
