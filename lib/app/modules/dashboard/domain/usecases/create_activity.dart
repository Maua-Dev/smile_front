import '../../../../shared/models/activity_model.dart';
import '../repositories/activities_repository_interface.dart';

abstract class CreateActivityInterface {
  Future call(ActivityModel activityToCreate);
}

class CreateActivity implements CreateActivityInterface {
  final ActivitiesRepositoryInterface repository;

  CreateActivity({required this.repository});

  @override
  Future call(ActivityModel activityToCreate) {
    return repository.createActivity(activityToCreate);
  }
}
