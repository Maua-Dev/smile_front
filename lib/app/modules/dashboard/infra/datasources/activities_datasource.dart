import 'package:smile_front/app/shared/models/activity_model.dart';

abstract class ActivitiesDatasource {
  Future<List<ActivityModel>> getActivities();
}
