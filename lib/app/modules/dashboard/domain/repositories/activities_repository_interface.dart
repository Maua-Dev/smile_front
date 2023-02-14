import 'package:smile_front/app/shared/models/activity_model.dart';

import '../../infra/models/user_enrolled_activities_model.dart';

abstract class ActivitiesRepositoryInterface {
  Future<List<ActivityModel>> getAllActivities();
  Future<List<UserEnrolledActivitiesModel>> getUserSubscribedActivities();
  Future<String> getDownloadLinkCsv();
  Future createActivity(ActivityModel activityToCreate);
  Future editActivity(ActivityModel activityToEdit);
  Future deleteActivity(String activityCode);
  Future<bool> subscribeActivity(
      ActivityModel activity, String activityId, DateTime activityDate);
  Future<bool> unsubscribeActivity(String activityId, DateTime activityDate);
}
