import 'package:smile_front/app/modules/user_pages/domain/entities/activity.dart';
import 'package:smile_front/app/modules/user_pages/infra/datasources/activities_datasource.dart';
import 'package:smile_front/app/modules/user_pages/utils/mocks/activities_mock.dart';

class ActivitiesDatasourceImpl extends ActivitiesDatasource {
  @override
  Future<List<Activity>> getSubscribedActivities() {
    return Future.value(mockActivities);
    // aplicação do DIO
  }

  @override
  Future<List<Activity>> unsubscribeActivity(String activityId, String userId) {
    List<Activity> listActivities = [];
    for (int i = 0; i < mockActivities.length; i++) {
      if (mockActivities[i].id != activityId) {
        listActivities.add(mockActivities[i]);
      }
    }
    return Future.value(listActivities);
  }
}
