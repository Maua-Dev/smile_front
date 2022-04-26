import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart';
import 'package:smile_front/app/modules/dashboard/infra/datasources/activities_datasource_interface.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';

class ActivitiesRepositoryImpl extends ActivitiesRepositoryInterface {
  final ActivitiesDatasourceInterface datasource;

  ActivitiesRepositoryImpl({required this.datasource});

  List<ActivityModel> activitiesList = List.empty();

  List<ActivityModel> subscribedActivities = List.empty();

  @override
  Future<List<ActivityModel>> getAllActivities() async {
    if (activitiesList.isEmpty) {
      activitiesList = await datasource.getAllActivities();
    }
    return Future.value(activitiesList);
  }

  @override
  Future<List<ActivityModel>> getUserSubscribedActivities() async {
    if (subscribedActivities.isEmpty) {
      subscribedActivities = await datasource.getUserSubscribedActivities();
    }
    return Future.value(subscribedActivities);
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
  Future<bool> subscribeActivity(
      ActivityModel activity, String activityId, DateTime activityDate) async {
    subscribedActivities.add(activity);
    var requestDone = await datasource.postSubscribe(activityId, activityDate);
    return requestDone;
  }

  @override
  Future<bool> unsubscribeActivity(
      String activityId, DateTime activityDate) async {
    subscribedActivities.removeWhere((element) => element.id == activityId);
    var requestDone =
        await datasource.postUnsubscribe(activityId, activityDate);
    return requestDone;
  }
}
