import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smile_front/app/modules/dashboard/infra/datasources/activities_datasource.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';

import '../../../shared/services/enviroment/enviroment_config.dart';
import '../../auth/domain/repositories/secure_storage_interface.dart';
import '../utils/mocks/subscribed_activities_mock.dart';

class ActivitiesDatasourceImpl extends ActivitiesDatasource {
  final Dio dioClient;
  final SecureStorageInterface storage;

  ActivitiesDatasourceImpl(
    this.dioClient, {
    required this.storage,
  });

  @override
  Future<List<ActivityModel>> getAllActivities() async {
    var token = await storage.getAccessToken();
    try {
      BaseOptions options = BaseOptions(
        baseUrl: EnvironmentConfig.MSS_ACTIVITIES_BASE_URL,
        responseType: ResponseType.json,
        connectTimeout: 30000,
        receiveTimeout: 30000,
      );
      Dio dio = Dio(options);
      dio.options.headers["authorization"] = "Bearer $token";
      final res = await dio.get('/activity/getAll');
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
    //   final res = await dioClient.get('/activity/getAll');
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
    var token = await storage.getAccessToken();
    try {
      BaseOptions options = BaseOptions(
        baseUrl: EnvironmentConfig.MSS_ACTIVITIES_BASE_URL,
        responseType: ResponseType.json,
        connectTimeout: 30000,
        receiveTimeout: 30000,
      );
      Dio dio = Dio(options);
      dio.options.headers["authorization"] = "Bearer $token";
      await dio.put('/activity?id=$id', data: activity.toJson());
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
    var token = await storage.getAccessToken();
    try {
      BaseOptions options = BaseOptions(
        baseUrl: EnvironmentConfig.MSS_ACTIVITIES_BASE_URL,
        responseType: ResponseType.json,
        connectTimeout: 30000,
        receiveTimeout: 30000,
      );
      Dio dio = Dio(options);
      dio.options.headers["authorization"] = "Bearer $token";
      await dio.post('/activity', data: activity.toJson());
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
    var token = await storage.getAccessToken();
    try {
      BaseOptions options = BaseOptions(
        baseUrl: EnvironmentConfig.MSS_ACTIVITIES_BASE_URL,
        responseType: ResponseType.json,
        connectTimeout: 30000,
        receiveTimeout: 30000,
      );
      Dio dio = Dio(options);
      dio.options.headers["authorization"] = "Bearer $token";
      await dio.delete('/activity?id=$id');
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
