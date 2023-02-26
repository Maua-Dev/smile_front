import 'package:smile_front/app/shared/models/activity_model.dart';
import 'package:smile_front/app/shared/models/admin_activity_model.dart';
import 'package:smile_front/app/shared/models/enrolls_activity_model.dart';

abstract class ActivitiesRepositoryInterface {
  Future<List<ActivityModel>> getAllActivities();
  Future<List<EnrollsActivityModel>> getUserSubscribedActivities();
  Future<String> getDownloadLinkCsv();
  Future createActivity(ActivityModel activityToCreate);
  Future<List<AdminActivityModel>> getAdminActivities();
  Future editActivity(ActivityModel activityToEdit);
  Future deleteActivity(String activityCode);
  Future<bool> subscribeActivity(String activityCode);
  Future<bool> unsubscribeActivity(String activityCode);
}
