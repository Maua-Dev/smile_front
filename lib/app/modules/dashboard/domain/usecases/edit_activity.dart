import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart';

import '../../../../shared/models/activity_model.dart';

abstract class EditActivityInterface {
  Future call(ActivityModel activityToEdit);
}

class EditActivity implements EditActivityInterface {
  final ActivitiesRepositoryInterface repository;

  EditActivity({required this.repository});

  @override
  Future call(ActivityModel activityToEdit) {
    return repository.editActivity(activityToEdit);
  }
}
