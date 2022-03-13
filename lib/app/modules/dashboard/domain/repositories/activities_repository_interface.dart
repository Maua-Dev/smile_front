import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';

abstract class ActivitiesRepositoryInterface {
  Future<List<ActivityModel>> getActivitiesSelectedByType(
      ActivityEnum activityEnum);
  Future<List<ActivityModel>> getAllActivities();
  Future editActivity(ActivityModel activityToEdit);
  Future removeActivity(String id);
}
