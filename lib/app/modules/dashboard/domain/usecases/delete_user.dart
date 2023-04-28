import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart';

abstract class DeleteUserInterface {
  Future<void> call();
}

class DeleteUser implements DeleteUserInterface {
  final ActivitiesRepositoryInterface activitiesRepository;

  DeleteUser({required this.activitiesRepository});

  @override
  Future<void> call() {
    return activitiesRepository.deleteUser();
  }
}
