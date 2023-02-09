import 'package:smile_front/app/shared/models/activity_model.dart';

abstract class ActivitiesRepositoryInterface {
  Future<List<ActivityModel>> getAllActivities();
  Future<List<ActivityModel>> getUserSubscribedActivities();
  Future<String> getDownloadLinkCsv();
  Future createActivity(ActivityModel activityToCreate);
  Future editActivity(ActivityModel activityToEdit);
  Future removeActivity(String id);
  Future<bool> subscribeActivity(String userId, String activityCode);
  Future<bool> unsubscribeActivity(String userId, String activityCode);
}
