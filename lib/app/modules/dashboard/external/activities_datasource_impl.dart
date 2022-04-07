import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smile_front/app/modules/dashboard/infra/datasources/activities_datasource.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';

import '../utils/mocks/subscribed_activities_mock.dart';

class ActivitiesDatasourceImpl extends ActivitiesDatasource {
  final Dio dioClient;

  ActivitiesDatasourceImpl(this.dioClient);

  @override
  Future<List<ActivityModel>> getAllActivities() async {
    try {
      final res = await dioClient.get('/smile_mss_activities/activity/getAll');
      if (res.statusCode == 200) {
        return ActivityModel.fromMaps(res.data);
      }
      throw Exception();
    } on Exception catch (e) {
      getMyDialog(
        title: 'Não foi possível se conectar com o Serviço' + e.toString(),
        content: 'Não foi possível se conectar com o Microsserviço, erro: ' +
            e.toString(),
      );
      rethrow;
    }
  }

  @override
  Future<List<ActivityModel>> getUserSubscribedActivities() async {
    return await Future.value(subscribedActivities);
    // try {
    //   final res = await dioClient.get('/smile_mss_activities/activity/getAll');
    //   if (res.statusCode == 200) {
    //     return ActivityModel.fromMaps(res.data);
    //   }
    //   throw Exception();
    // } on Exception catch (e) {
    //   // ignore: avoid_print
    //   print('Não foi possível se conectar com o Microsserviço, erro: ' +
    //       e.toString());
    //   rethrow;
    // }
  }

  @override
  Future putActivity(String id, ActivityModel activity) async {
    try {
      await dioClient.put('/smile_mss_activities/activity?id=$id',
          data: activity.toJson());
    } on Exception catch (e) {
      getMyDialog(
        title: 'Não foi possível se conectar com o Serviço' + e.toString(),
        content: 'Não foi possível se conectar com o Microsserviço, erro: ' +
            e.toString(),
      );
    }
  }

  @override
  Future postActivity(ActivityModel activity) async {
    try {
      await dioClient.post('/smile_mss_activities/activity',
          data: activity.toJson());
    } on Exception catch (e) {
      getMyDialog(
        title: 'Não foi possível se conectar com o Serviço' + e.toString(),
        content: 'Não foi possível se conectar com o Microsserviço, erro: ' +
            e.toString(),
      );
    }
  }

  @override
  Future removeActivity(String id) async {
    try {
      await dioClient.delete('/smile_mss_activities/activity?id=$id');
    } on Exception catch (e) {
      getMyDialog(
        title: 'Não foi possível se conectar com o Serviço' + e.toString(),
        content: 'Não foi possível se conectar com o Microsserviço, erro: ' +
            e.toString(),
      );
    }
  }
}

void getMyDialog({required String title, required String content}) {
  Get.defaultDialog(
    title: title,
    content: Text(content),
    textCancel: 'Fechar',
    cancelTextColor: AppColors.redButton,
    onCancel: () {
      if (Get.context != null) {
        Navigator.of(Get.context!).pop();
      }
    },
  );
}
