import 'package:smile_front/app/modules/dashboard/domain/entities/activities.dart';
import 'package:smile_front/app/modules/dashboard/domain/service/presentation/activities_enum.dart';

abstract class ActivitiesRepository {
  Future<List<Activities>> getActivities(ActivitiesEnum activitiesEnum);
}
