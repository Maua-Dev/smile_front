import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart';

abstract class EditActivityInterface {
  Future call(activityToEdit);
}

class EditActivity implements EditActivityInterface {
  final ActivitiesRepositoryInterface repository;

  EditActivity({required this.repository});

  @override
  Future call(activityToEdit) {
    return repository.editActivity(activityToEdit);
  }
}
