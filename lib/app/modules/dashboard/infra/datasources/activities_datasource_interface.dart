import 'package:smile_front/app/shared/models/activity_model.dart';

import '../models/user_enrolled_activities_model.dart';

abstract class ActivitiesDatasourceInterface {
  Future<List<ActivityModel>> getAllActivities();
  Future<List<UserEnrolledActivitiesModel>> getEnrollmentByUserId();
  Future<bool> postSubscribe(String activityCode);
  Future<bool> postUnsubscribe(String activityCode);
  Future putActivity(String id, ActivityModel activity);
  Future postActivity(ActivityModel activity);
  Future removeActivity(String id);
  Future<String> getLinkCsv();
}
