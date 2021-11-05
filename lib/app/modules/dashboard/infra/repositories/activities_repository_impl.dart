import 'package:smile_front/app/modules/dashboard/domain/entities/activities.dart';
import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository.dart';
import 'package:smile_front/app/modules/dashboard/domain/service/presentation/activities_enum.dart';
import 'package:smile_front/app/modules/dashboard/infra/datasources/activities_datasource.dart';
import 'package:smile_front/app/modules/dashboard/infra/repositories/utils/activities_mock.dart';

class ActivitiesRepositoryImpl implements ActivitiesRepository {
  final ActivitiesDatasource datasource;

  ActivitiesRepositoryImpl(this.datasource);

  @override
  Future<List<Activities>> getActivities(ActivitiesEnum activitiesEnum) {
    //final result = datasource.getActivities(activitiesEnum);
    final result = mockActivities;
    return Future.value(result);
  }
}
