import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart';
import 'package:smile_front/app/modules/dashboard/infra/datasources/activities_datasource_interface.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';

class ActivitiesRepositoryImpl extends ActivitiesRepositoryInterface {
  final ActivitiesDatasourceInterface datasource;

  ActivitiesRepositoryImpl({required this.datasource});

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
    await datasource.postActivity(activityToCreate);
  }

  @override
  Future<List<ActivityModel>> getUserSubscribedActivities() async {
    final result = await datasource.getUserSubscribedActivities();
    return result;
  }

  @override
  Future subscribeActivity(String activityId, DateTime activityDate) async {
    await datasource.postSubscribe(activityId, activityDate);
  }

  @override
  Future unsubscribeActivity(String activityId, DateTime activityDate) async {
    await datasource.postUnsubscribe(activityId, activityDate);
  }
}
