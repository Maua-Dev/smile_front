import 'package:mobx/mobx.dart';

import '../../../domain/infra/activity_enum.dart';
import '../../../domain/repositories/activities_repository_interface.dart';
import '../../../infra/models/speaker_activity_model.dart';

part 'create_activity_controller.g.dart';

class CreateActivityController = _CreateActivityControllerBase
    with _$CreateActivityController;

abstract class _CreateActivityControllerBase with Store {
  final ActivitiesRepositoryInterface repository;

  _CreateActivityControllerBase({
    required this.repository,
  });

  @action
  Future createActivity(
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
    await repository.createActivity(id, type, title, description, date, hour,
        location, totalParticipants, speaker);
  }
}
