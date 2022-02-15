import 'package:smile_front/app/modules/dashboard/infra/models/activity_model.dart';

abstract class ActivitiesDatasource {
  Future<List<ActivityModel>> getActivities();
}
