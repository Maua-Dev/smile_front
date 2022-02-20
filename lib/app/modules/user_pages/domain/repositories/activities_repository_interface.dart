import 'package:smile_front/app/modules/user_pages/domain/entities/activity.dart';

abstract class ActivitiesRepositoryInterface {
  Future<List<Activity>> getSubscribedActivities();
  Future<List<Activity>> unsubscribeActivity(String activityId, String userId);
}
