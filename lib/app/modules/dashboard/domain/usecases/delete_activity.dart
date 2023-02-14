import '../repositories/activities_repository_interface.dart';

abstract class DeleteActivityInterface {
  Future call(String id);
}

class DeleteActivity implements DeleteActivityInterface {
  final ActivitiesRepositoryInterface repository;

  DeleteActivity({required this.repository});

  @override
  Future call(String id) {
    return repository.deleteActivity(id);
  }
}
