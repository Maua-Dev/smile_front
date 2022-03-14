import 'package:smile_front/app/shared/models/activity_model.dart';

abstract class ActivitiesDatasource {
  Future<List<ActivityModel>> getAllActivities();
  Future putActivity(String id, ActivityModel activity);
  Future postActivity(String id, ActivityModel activity);
  Future removeActivity(String id);
}
