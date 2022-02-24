import 'dart:convert';

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
    final result = await datasource.getActivities();
    var list = <ActivityModel>[];
    for (var i = 0; i < result.length; i++) {
      if (result[i].type == activityEnum) {
        list.add(result[i]);
      }
    }
    return Future.value(list);
  }

  @override
  Future<List<ActivityModel>> getAllActivities(
      ActivityEnum activityEnum) async {
    final result = await datasource.getActivities();
    return Future.value(result);
  }

  @override
  Future editActivity(String title, String description, String activityType,
      String id, int workload, int totalPlaces) async {
    var activityToEdit = ActivityModel(
        id: id,
        enrolledUsers: [],
        name: title,
        description: description,
        date: DateTime.now(),
        type: ActivityModel.stringToEnumMap(activityType),
        createdAt: '',
        updatedAt: '',
        workload: workload,
        link: '',
        location: '',
        queue: [],
        totalPlaces: totalPlaces);
    var json = jsonEncode(activityToEdit.toJson());
    await datasource.putActivity(id, json);
  }
}
