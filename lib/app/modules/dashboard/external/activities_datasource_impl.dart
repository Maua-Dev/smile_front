import 'package:smile_front/app/modules/dashboard/domain/entities/activity.dart';
import 'package:smile_front/app/modules/dashboard/infra/datasources/activities_datasource.dart';
import 'package:smile_front/app/modules/dashboard/utils/mocks/activities_mock.dart';

class ActivitiesDatasourceImpl extends ActivitiesDatasource {
  @override
  Future<List<Activity>> getActivities() {
    return Future.value(mockActivities);
    // aplicação do DIO
  }
}
