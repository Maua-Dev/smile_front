import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import '../../../domain/repositories/activities_repository_interface.dart';
import '../../../infra/models/speaker_activity_model.dart';

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
    ActivityEnum type,
    String title,
    String description,
    DateTime date,
    DateTime hour,
    String location,
    int totalParticipants,
    SpeakerActivityModel speaker,
  ) async {
    await repository.editActivity(id, type, title, description, date, hour,
        location, totalParticipants, speaker);
  }

  @action
  Future deleteActivity(String id) async {
    await repository.removeActivity(id);
  }
}
