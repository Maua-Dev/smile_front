import 'package:smile_front/app/shared/infra/models/admin_activity_model.dart';

import '../repositories/activities_repository_interface.dart';

abstract class GetAdminActivitiesInterface {
  Future<List<AdminActivityModel>> call();
}

class GetAdminActivitiesImp implements GetAdminActivitiesInterface {
  final ActivitiesRepositoryInterface repository;

  GetAdminActivitiesImp({required this.repository});

  @override
  Future<List<AdminActivityModel>> call() {
    return repository.getAdminActivities();
  }
}
