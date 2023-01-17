import '../repositories/activities_repository_interface.dart';

abstract class DeleteActivityInterface {
  Future<dynamic> call(id);
}

class DeleteActivity implements DeleteActivityInterface {
  final ActivitiesRepositoryInterface repository;

  DeleteActivity({required this.repository});

  @override
  Future call(id) {
    return repository.removeActivity(id);
  }
}
