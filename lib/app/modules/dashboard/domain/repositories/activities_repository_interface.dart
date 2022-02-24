import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';

abstract class ActivitiesRepositoryInterface {
  Future<List<ActivityModel>> getActivitiesSelectedByType(
      ActivityEnum activityEnum);
  Future<List<ActivityModel>> getAllActivities(ActivityEnum activityEnum);
  Future editActivity(String title, String description, String activityType,
      String id, int workload, int totalPlaces);
}
