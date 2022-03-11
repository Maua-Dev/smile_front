import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';

import '../../infra/models/speaker_activity_model.dart';

abstract class ActivitiesRepositoryInterface {
  Future<List<ActivityModel>> getActivitiesSelectedByType(
      ActivityEnum activityEnum);
  Future<List<ActivityModel>> getAllActivities();
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
  );
  Future removeActivity(String id);
}
