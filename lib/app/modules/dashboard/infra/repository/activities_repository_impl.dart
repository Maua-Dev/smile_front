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
  Future editActivity(
      String id,
      String description,
      String link,
      int totalPlaces,
      String location,
      String name,
      DateTime date,
      ActivityEnum type,
      List<dynamic> enrolledUsers,
      List<dynamic> queue,
      String createdAt,
      String updatedAt,
      int workload) async {
    var activityToEdit = ActivityModel(
      name: name,
      description: description,
      date: date,
      createdAt: createdAt,
      id: id,
      updatedAt: updatedAt,
      workload: workload,
      location: location,
      totalPlaces: totalPlaces,
      queue: queue,
      link: link,
      enrolledUsers: [],
      type: type,
    );
    var json = jsonEncode(activityToEdit.toJson());
    await datasource.putActivity(id, json);
  }
}
