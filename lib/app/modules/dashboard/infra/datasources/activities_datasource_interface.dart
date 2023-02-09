import 'package:smile_front/app/shared/models/activity_model.dart';

abstract class ActivitiesDatasourceInterface {
  Future<List<ActivityModel>> getAllActivities();
  Future<List<ActivityModel>> getUserSubscribedActivities();
  Future<bool> postSubscribe(String activityId, DateTime activityDate);
  Future<bool> postUnsubscribe(String activityId, DateTime activityDate);
  Future putActivity(String id, ActivityModel activity);
  Future createActivity(ActivityModel activity);
  Future deleteActivity(String activityCode);
  Future<String> getLinkCsv();
}
