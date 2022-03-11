import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';

import '../../../domain/repositories/activities_repository_interface.dart';

part 'edit_activity_controller.g.dart';

class EditActivityController = _EditActivityControllerBase
    with _$EditActivityController;

abstract class _EditActivityControllerBase with Store {
  final ActivitiesRepositoryInterface repository;

  _EditActivityControllerBase({
    required this.repository,
  });

  @action
  Future editActivity(
      String id,
      String description,
      String link,
      int totalPlaces,
      String location,
      String name,
      DateTime date,
      ActivityEnum type,
      int workload) async {
    await repository.editActivity(id, description, link, totalPlaces, location,
        name, date, type, workload);
  }

  @action
  Future deleteActivity(String id) async {
    await repository.removeActivity(id);
  }
}
