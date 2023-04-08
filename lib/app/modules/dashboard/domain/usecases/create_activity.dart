import 'package:smile_front/app/shared/models/admin_activity_model.dart';
import '../repositories/activities_repository_interface.dart';

abstract class CreateActivityInterface {
  Future call(AdminActivityModel activityToCreate);
}

class CreateActivity implements CreateActivityInterface {
  final ActivitiesRepositoryInterface repository;

  CreateActivity({required this.repository});

  @override
  Future call(AdminActivityModel activityToCreate) {
    return repository.createActivity(activityToCreate);
  }
}
