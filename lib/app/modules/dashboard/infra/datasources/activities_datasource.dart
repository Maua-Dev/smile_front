import 'package:smile_front/app/modules/dashboard/domain/entities/activity.dart';

abstract class ActivitiesDatasource {
  Future<List<Activity>> getActivities();
}
