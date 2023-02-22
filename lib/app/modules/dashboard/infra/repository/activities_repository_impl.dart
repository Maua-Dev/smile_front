import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart';
import 'package:smile_front/app/modules/dashboard/infra/datasources/activities_datasource_interface.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';

import '../../../../shared/models/enrolls_activity_model.dart';

import 'package:smile_front/app/shared/models/admin_activity_model.dart';


class ActivitiesRepositoryImpl extends ActivitiesRepositoryInterface {
  final ActivitiesDatasourceInterface datasource;

  ActivitiesRepositoryImpl({required this.datasource});

  var activitiesList = List<ActivityModel>.empty();

  var allActivitiesWithEnrollments = List<EnrollsActivityModel>.empty();

  var admActivitiesList = List<AdminActivityModel>.empty();

  @override
  Future<List<ActivityModel>> getAllActivities() async {
    if (activitiesList.isEmpty) {
      activitiesList = await datasource.getAllActivities();
    }
    return Future.value(activitiesList);
  }

  @override
  Future<List<EnrollsActivityModel>> getUserSubscribedActivities() async {
    if (allActivitiesWithEnrollments.isEmpty) {
      allActivitiesWithEnrollments = await datasource.getAllActivitiesLogged();
    }
    return Future.value(allActivitiesWithEnrollments);
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

  @override
  Future<List<AdminActivityModel>> getAdminActivities() async {
    if (admActivitiesList.isEmpty) {
      admActivitiesList = await datasource.getAdminAllActivities();
    }
    return Future.value(admActivitiesList);
  }
}
