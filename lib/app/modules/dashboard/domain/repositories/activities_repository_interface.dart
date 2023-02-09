import 'package:smile_front/app/shared/models/activity_model.dart';

import '../../infra/models/user_enrolled_activities_model.dart';

abstract class ActivitiesRepositoryInterface {
  Future<List<ActivityModel>> getAllActivities();
  Future<List<UserEnrolledActivitiesModel>> getUserSubscribedActivities();
  Future<String> getDownloadLinkCsv();
  Future createActivity(ActivityModel activityToCreate);
  Future editActivity(ActivityModel activityToEdit);
  Future removeActivity(String id);
  Future<bool> subscribeActivity(String activityCode);
  Future<bool> unsubscribeActivity(String activityCode);
}
