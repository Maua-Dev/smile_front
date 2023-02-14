import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart';
import 'package:smile_front/app/modules/dashboard/infra/datasources/activities_datasource_interface.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';
import '../../../../shared/models/enrolls_activity_model.dart';

class ActivitiesRepositoryImpl extends ActivitiesRepositoryInterface {
  final ActivitiesDatasourceInterface datasource;

  ActivitiesRepositoryImpl({required this.datasource});

  List<ActivityModel> activitiesList = List.empty();

  List<EnrollsActivityModel> subscribedActivities = List.empty();

  @override
  Future<List<ActivityModel>> getAllActivities() async {
    if (activitiesList.isEmpty) {
      activitiesList = await datasource.getAllActivities();
    }
    return Future.value(activitiesList);
  }

  @override
  Future<List<EnrollsActivityModel>> getUserSubscribedActivities() async {
    if (subscribedActivities.isEmpty) {
      var allActivitiesLogged = await datasource.getAllActivitiesLogged();
      for (var activity in allActivitiesLogged) {
        if (activity.enrollments != null) {
          subscribedActivities.add(activity);
        }
      }
    }
    return Future.value(subscribedActivities);
  }

  @override
  Future editActivity(ActivityModel activityToEdit) async {
    var index = activitiesList.indexWhere(
        (element) => element.activityCode == activityToEdit.activityCode);
    activitiesList.removeAt(index);
    activitiesList.insert(index, activityToEdit);
    await datasource.editActivity(activityToEdit.activityCode, activityToEdit);
  }

  @override
  Future deleteActivity(String activityCode) async {
    activitiesList
        .removeWhere((element) => element.activityCode == activityCode);
    await datasource.deleteActivity(activityCode);
  }

  @override
  Future createActivity(ActivityModel activityToCreate) async {
    await datasource.createActivity(activityToCreate);
  }

  @override
  Future<bool> subscribeActivity(String activityCode) async {
    var requestDone = await datasource.postSubscribe(activityCode);
    return requestDone;
  }

  @override
  Future<bool> unsubscribeActivity(String activityCode) async {
    var requestDone = await datasource.postUnsubscribe(activityCode);
    return requestDone;
  }

  @override
  Future<String> getDownloadLinkCsv() async {
    var url = await datasource.getLinkCsv();
    return url;
  }
}
