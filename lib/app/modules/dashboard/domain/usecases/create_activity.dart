import '../repositories/activities_repository_interface.dart';

abstract class CreateActivityInterface {
  Future call(activityToCreate);
}

class CreateActivity implements CreateActivityInterface {
  final ActivitiesRepositoryInterface repository;

  CreateActivity({required this.repository});

  @override
  Future call(activityToCreate) {
    return repository.createActivity(activityToCreate);
  }
}
