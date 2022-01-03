import 'package:smile_front/app/modules/dashboard/domain/entities/activity.dart';

abstract class ActivitiesRepositoryInterface {
  Future<List<Activity>> getActivities();
}
