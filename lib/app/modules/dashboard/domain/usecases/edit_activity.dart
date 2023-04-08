import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart';
import 'package:smile_front/app/shared/models/admin_activity_model.dart';

abstract class EditActivityInterface {
  Future call(AdminActivityModel activityToEdit);
}

class EditActivity implements EditActivityInterface {
  final ActivitiesRepositoryInterface repository;

  EditActivity({required this.repository});

  @override
  Future call(AdminActivityModel activityToEdit) {
    return repository.editActivity(activityToEdit);
  }
}
