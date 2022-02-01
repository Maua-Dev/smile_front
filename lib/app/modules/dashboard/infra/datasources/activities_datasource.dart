import 'package:smile_front/app/modules/dashboard/domain/entities/activity.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';

abstract class ActivitiesDatasource {
  Future<List<Activity>> getActivities(ActivityEnum activityEnum);
}
