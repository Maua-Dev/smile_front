import 'package:smile_front/app/shared/models/activity_model.dart';
import 'package:smile_front/app/shared/models/user_model.dart';

abstract class ActivitiesDatasource {
  Future<List<ActivityModel>> getAllActivities();
  Future<List<ActivityModel>> getUserSubscribedActivities();
  Future<UserModel> getUser();
  Future putActivity(String id, ActivityModel activity);
  Future postActivity(ActivityModel activity);
  Future removeActivity(String id);
}
