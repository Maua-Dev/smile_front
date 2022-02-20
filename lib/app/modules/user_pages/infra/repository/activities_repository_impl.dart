import 'package:smile_front/app/modules/user_pages/domain/entities/activity.dart';
import 'package:smile_front/app/modules/user_pages/domain/repositories/activities_repository_interface.dart';
import 'package:smile_front/app/modules/user_pages/infra/datasources/activities_datasource.dart';

class ActivitiesRepositoryImpl extends ActivitiesRepositoryInterface {
  final ActivitiesDatasource datasource;

  ActivitiesRepositoryImpl({required this.datasource});

  @override
  Future<List<Activity>> getSubscribedActivities() {
    final result = datasource.getSubscribedActivities();
    return Future.value(result);
  }

  @override
  Future<List<Activity>> unsubscribeActivity(String activityId, String userId) {
    final result = datasource.unsubscribeActivity(activityId, userId);
    return Future.value(result);
  }
}
