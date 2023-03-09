import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart';

abstract class ManualDropActivityInterface {
  Future call(String activityCode, String userId);
}

class ManualDropActivity implements ManualDropActivityInterface {
  final ActivitiesRepositoryInterface repository;

  ManualDropActivity({required this.repository});

  @override
  Future call(String activityCode, String userId) {
    return repository.manualDropActivity(activityCode, userId);
  }
}
