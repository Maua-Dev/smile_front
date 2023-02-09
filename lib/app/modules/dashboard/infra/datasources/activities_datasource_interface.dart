import 'package:smile_front/app/shared/models/activity_model.dart';

abstract class ActivitiesDatasourceInterface {
  Future<List<ActivityModel>> getAllActivities();
  Future<List<ActivityModel>> getUserSubscribedActivities();
  Future<bool> postSubscribe(String userId, String activityCode);
  Future<bool> postUnsubscribe(String userId, String activityCode);
  Future putActivity(String id, ActivityModel activity);
  Future postActivity(ActivityModel activity);
  Future removeActivity(String id);
  Future<String> getLinkCsv();
}
