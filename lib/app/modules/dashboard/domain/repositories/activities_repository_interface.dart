import 'package:smile_front/app/shared/models/activity_model.dart';

abstract class ActivitiesRepositoryInterface {
  Future<List<ActivityModel>> getAllActivities();
  Future<List<ActivityModel>> getUserSubscribedActivities();
  Future createActivity(ActivityModel activityToCreate);
  Future editActivity(ActivityModel activityToEdit);
  Future removeActivity(String id);
  Future subscribeActivity(String activityId, DateTime activityDate);
  Future unsubscribeActivity(String activityId, DateTime activityDate);
}
