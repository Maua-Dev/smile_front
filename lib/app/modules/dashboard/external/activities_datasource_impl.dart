// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:smile_front/app/modules/dashboard/infra/datasources/activities_datasource.dart';
import 'package:smile_front/app/modules/dashboard/infra/models/subscription_activity_model.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';
import '../../../shared/services/enviroment/enviroment_config.dart';
import '../../auth/domain/repositories/secure_storage_interface.dart';
import '../utils/mocks/subscribed_activities_mock.dart';

class ActivitiesDatasourceImpl extends ActivitiesDatasource {
  final SecureStorageInterface storage;

  ActivitiesDatasourceImpl({
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
      print(
          'Não foi possível se conectar com o Microsserviço na rota /activity/getAll, erro: ' +
              e.toString());
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
  Future postSubscribe(String activityId, DateTime activityDate) async {
    var token = await storage.getAccessToken();
    var body = SubscriptionActivityModel(
        activityDate: activityDate, activityId: activityId);
    try {
      BaseOptions options = BaseOptions(
        baseUrl: EnvironmentConfig.MSS_ACTIVITIES_BASE_URL,
        responseType: ResponseType.json,
        connectTimeout: 30000,
        receiveTimeout: 30000,
      );
      Dio dio = Dio(options);
      dio.options.headers["authorization"] = "Bearer $token";
      await dio.post('/activity/enroll', data: body.toJson());
    } on Exception catch (e) {
      print(
          'Não foi possível se conectar com o Microsserviço na rota /activity/enroll, erro: ' +
              e.toString());
    }
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
      print(
          'Não foi possível se conectar com o Microsserviço na rota /activity?id=$id, erro: ' +
              e.toString());
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
      print(
          'Não foi possível se conectar com o Microsserviço na rota /activity, erro: ' +
              e.toString());
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
      print(
          'Não foi possível se conectar com o Microsserviçona rota /activity?id=$id, erro: ' +
              e.toString());
    }
  }

  @override
  Future postUnsubscribe(String activityId, DateTime activityDate) async {
    var token = await storage.getAccessToken();
    var body = SubscriptionActivityModel(
        activityDate: activityDate, activityId: activityId);
    try {
      BaseOptions options = BaseOptions(
        baseUrl: EnvironmentConfig.MSS_ACTIVITIES_BASE_URL,
        responseType: ResponseType.json,
        connectTimeout: 30000,
        receiveTimeout: 30000,
      );
      Dio dio = Dio(options);
      dio.options.headers["authorization"] = "Bearer $token";
      await dio.post('/activity/unenroll', data: body.toJson());
    } on Exception catch (e) {
      print(
          'Não foi possível se conectar com o Microsserviço na rota /activity/unenroll, erro: ' +
              e.toString());
    }
  }
}
