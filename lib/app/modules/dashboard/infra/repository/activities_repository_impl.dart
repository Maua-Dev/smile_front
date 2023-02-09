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
    var index = activitiesList.indexWhere(
        (element) => element.activityCode == activityToEdit.activityCode);
    activitiesList.removeAt(index);
    activitiesList.insert(index, activityToEdit);
    await datasource.putActivity(activityToEdit.activityCode, activityToEdit);
  }

  @override
  Future removeActivity(String id) async {
    activitiesList.removeWhere((element) => element.activityCode == id);
    await datasource.removeActivity(id);
  }

  @override
  Future createActivity(ActivityModel activityToCreate) async {
    activitiesList.add(activityToCreate);
    await datasource.postActivity(activityToCreate);
  }

  @override
  Future<bool> subscribeActivity(String userId, String activityCode) async {
    var requestDone = await datasource.postSubscribe(userId, activityCode);
    return requestDone;
  }

  @override
  Future<bool> unsubscribeActivity(String userId, String activityCode) async {
    subscribedActivities
        .removeWhere((element) => element.activityCode == activityCode);
    var requestDone = await datasource.postUnsubscribe(userId, activityCode);
    return requestDone;
  }

  @override
  Future<String> getDownloadLinkCsv() async {
    var url = await datasource.getLinkCsv();
    return url;
  }

}
