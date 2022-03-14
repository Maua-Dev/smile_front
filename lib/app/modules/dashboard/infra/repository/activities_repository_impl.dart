import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart';
import 'package:smile_front/app/modules/dashboard/infra/datasources/activities_datasource.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';

class ActivitiesRepositoryImpl extends ActivitiesRepositoryInterface {
  final ActivitiesDatasource datasource;

  ActivitiesRepositoryImpl({required this.datasource});

  @override
  Future<List<ActivityModel>> getActivitiesSelectedByType(
      ActivityEnum activityEnum) async {
    final result = await datasource.getAllActivities();
    var list = <ActivityModel>[];
    for (var i = 0; i < result.length; i++) {
      if (result[i].type == activityEnum) {
        list.add(result[i]);
      }
    }
    return Future.value(list);
  }

  @override
  Future<List<ActivityModel>> getAllActivities() async {
    final result = await datasource.getAllActivities();
    return Future.value(result);
  }

  @override
  Future editActivity(ActivityModel activityToEdit) async {
    await datasource.putActivity(activityToEdit.id, activityToEdit);
  }

  @override
  Future removeActivity(String id) async {
    await datasource.removeActivity(id);
  }

  @override
  Future createActivity(ActivityModel activityToCreate) async {
    await datasource.postActivity(activityToCreate.id, activityToCreate);
  }
}
