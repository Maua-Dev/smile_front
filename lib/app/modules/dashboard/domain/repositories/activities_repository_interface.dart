import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';

abstract class ActivitiesRepositoryInterface {
  Future<List<ActivityModel>> getActivitiesSelectedByType(
      ActivityEnum activityEnum);
  Future<List<ActivityModel>> getAllActivities(ActivityEnum activityEnum);
  Future editActivity(
      String id,
      String description,
      String link,
      int totalPlaces,
      String location,
      String name,
      DateTime date,
      ActivityEnum type,
      List<dynamic> enrolledUsers,
      List<dynamic> queue,
      String createdAt,
      String updatedAt,
      int workload);
}
