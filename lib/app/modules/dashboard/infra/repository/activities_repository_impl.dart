import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart';
import 'package:smile_front/app/modules/dashboard/infra/datasources/activities_datasource_interface.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';

import '../models/user_enrolled_activities_model.dart';

class ActivitiesRepositoryImpl extends ActivitiesRepositoryInterface {
  final ActivitiesDatasourceInterface datasource;

  ActivitiesRepositoryImpl({required this.datasource});

  List<ActivityModel> activitiesList = List.empty();

  List<UserEnrolledActivitiesModel> subscribedActivities = List.empty();

  @override
  Future<List<ActivityModel>> getAllActivities() async {
    if (activitiesList.isEmpty) {
      activitiesList = await datasource.getAllActivities();
    }
    return Future.value(activitiesList);
  }

  @override
  Future<List<UserEnrolledActivitiesModel>>
      getUserSubscribedActivities() async {
    if (subscribedActivities.isEmpty) {
      subscribedActivities = await datasource.getEnrollmentByUserId();
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
  Future<bool> subscribeActivity(String activityCode) async {
    var requestDone = await datasource.postSubscribe(activityCode);
    return requestDone;
  }

  @override
  Future<bool> unsubscribeActivity(String activityCode) async {
    subscribedActivities.removeWhere(
        (element) => element.activity.activityCode == activityCode);
    var requestDone = await datasource.postUnsubscribe(activityCode);
    return requestDone;
  }

  @override
  Future<String> getDownloadLinkCsv() async {
    var url = await datasource.getLinkCsv();
    return url;
  }
}
