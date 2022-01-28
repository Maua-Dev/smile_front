import 'package:smile_front/app/modules/dashboard/domain/entities/activity.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/infra/datasources/activities_datasource.dart';
import 'package:smile_front/app/modules/dashboard/utils/mocks/activities_mock.dart';

class ActivitiesDatasourceImpl extends ActivitiesDatasource {
  @override
  Future<List<Activity>> getActivities(ActivityEnum activityEnum) {
    List<Activity> listActivities = [];
    for (int i = 0; i < mockActivities.length; i++) {
      mockActivities[i].activityType == activityEnum;
      listActivities.add(mockActivities[i]);
    }
    return Future.value(listActivities);
    // aplicação do DIO
  }
}
