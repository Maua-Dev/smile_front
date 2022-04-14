import 'package:smile_front/app/shared/models/activity_model.dart';

abstract class ActivitiesDatasourceInterface {
  Future<List<ActivityModel>> getAllActivities();
  Future<List<ActivityModel>> getUserSubscribedActivities();
  Future postSubscribe(String activityId, DateTime activityDate);
  Future postUnsubscribe(String activityId, DateTime activityDate);
  Future putActivity(String id, ActivityModel activity);
  Future postActivity(ActivityModel activity);
  Future removeActivity(String id);
}
