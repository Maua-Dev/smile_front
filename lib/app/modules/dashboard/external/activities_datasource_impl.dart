// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/dashboard/infra/datasources/activities_datasource_interface.dart';
import 'package:smile_front/app/modules/dashboard/infra/models/subscription_activity_model.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';
import '../../../shared/error/dio_exceptions.dart';
import '../../../shared/error/error_dialog.dart';
import '../../../shared/services/enviroment/enviroment_config.dart';
import '../../auth/domain/repositories/secure_storage_interface.dart';
import '../../auth/presenter/controllers/auth_controller.dart';

class ActivitiesDatasourceImpl extends ActivitiesDatasourceInterface {
  final SecureStorageInterface storage;
  var authController = Modular.get<AuthController>();
  ActivitiesDatasourceImpl({
    required this.storage,
  });

  @override
  Future<List<ActivityModel>> getAllActivities() async {
    var token = await storage.getAccessToken();
    await storage.saveAccessToken(
        'eyJraWQiOiJlSTlJOR0praWg1MXVQdXVlUFVHWEI0MUJBPSIsImFsZyI6IlJTMjU2In0.eyJvcmlnaW5fanRpIjoiODU1OWRmZDgtZWUxMi00YjNiLThjNjAtZTZiNmNhOTQ2MWZhIiwic3ViIjoiNDE0ZjdlZjItMGE5My00NzE3LWFkYmMtOTJiNzZjNjFlZTBiIiwiZXZlbnRfaWQiOiJhMzc5NTZlNS03MTgxLTRhYzctOTg5MC0xMGUxYzhhMmIzNDkiLCJ0b2tlbl91c2UiOiJhY2Nlc3MiLCJzY29wZSI6ImF3cy5jb2duaXRvLnNpZ25pbi51c2VyLmFkbWluIiwiYXV0aF90aW1lIjoxNjUwNTE3MjAzLCJpc3MiOiJodHRwczpcL1wvY29nbml0by1pZHAuc2EtZWFzdC0xLmFtYXpvbmF3cy5jb21cL3NhLWVhc3QtMV85ZTNBRko3bEYiLCJleHAiOjE2NTA2MDM5OTgsImlhdCI6MTY1MDUxNzU5OCwianRpIjoiMDRkYjQ2ODEtZTA3OC00ZjVkLWJiNTUtMTZiN2NhMzVlM2JmIiwiY2xpZW50X2lkIjoiMW5zbHRmdXBwa2gyNWtkdHNrMjR1czBlZjciLCJ1c2VybmFtZSI6IjkzNzkyNjgwMDkyIn0.juJ2RnlBkq2zVfmo_SYqmgkfBYBJLJqbCDKM-dZe2ZxoVqyLdB_v-GzbTw01Nz0Exmya26-6NURBw769ZML1a-0UCRtiv7PTY0avQiUOK7GURfbFM2d3O0789o_utnNbEBUWJtRZazUmncSxJDu5HUzrdjSne6NBOUYBj-F316E05BjCzs7erphvamAdIADYx6QpcWJeBWm_RfTxkl1_11eli70CNq5ZdOGw-uSfrL7YO7mZt6Ou-NKw0Tv8pnZdV_OajLMA5XZyI312kSt_FrZWVBJzjOgRU93ACGwdDkdQIyH0oeYOVAWA21kTgzE5WIgqYETbH-3f0wTm9r2Z9g');
    print('troquei o accessToken');
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
    } on DioError catch (e) {
      if (e.response.toString().contains('Authentication Error')) {
        await authController.refreshToken();
        await getAllActivities();
      }
      final errorMessage = DioExceptions.fromDioError(e).toString();
      showErrorSnackBar(errorMessage);
      print('/activity/getAll, error: ' + errorMessage);
      rethrow;
    }
  }

  @override
  Future<List<ActivityModel>> getUserSubscribedActivities() async {
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
      final res = await dio.get('/activity/userisenrolled');
      if (res.statusCode == 200) {
        return ActivityModel.fromMaps(res.data);
      }
      throw Exception();
    } on DioError catch (e) {
      if (e.response.toString().contains('Authentication Error')) {
        await authController.refreshToken();
        await getUserSubscribedActivities();
      }
      final errorMessage = DioExceptions.fromDioError(e).toString();
      showErrorSnackBar(errorMessage);
      print('/activity/userisenrolled, error: ' + errorMessage);
      rethrow;
    }
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
    } on DioError catch (e) {
      if (e.response.toString().contains('Authentication Error')) {
        await authController.refreshToken();
        await postSubscribe(activityId, activityDate);
      }
      final errorMessage = DioExceptions.fromDioError(e).toString();
      showErrorSnackBar(errorMessage);
      print('/activity/enroll, error: ' + errorMessage);
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
    } on DioError catch (e) {
      print(e.message.toString());
      print(e.response.toString());
      if (e.response.toString().contains('Authentication Error')) {
        await authController.refreshToken();
        await putActivity(id, activity);
      }
      final errorMessage = DioExceptions.fromDioError(e).toString();
      showErrorSnackBar(errorMessage);
      print('/activity?id=$id, error: ' + errorMessage);
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
    } on DioError catch (e) {
      if (e.response.toString().contains('Authentication Error')) {
        await authController.refreshToken();
        await postActivity(activity);
      }
      final errorMessage = DioExceptions.fromDioError(e).toString();
      showErrorSnackBar(errorMessage);
      print('/activity, error: ' + errorMessage);
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
    } on DioError catch (e) {
      if (e.response.toString().contains('Authentication Error')) {
        await authController.refreshToken();
        await removeActivity(id);
      }
      final errorMessage = DioExceptions.fromDioError(e).toString();
      showErrorSnackBar(errorMessage);
      print('/activity?id=$id, error: ' + errorMessage);
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
    } on DioError catch (e) {
      if (e.response.toString().contains('Authentication Error')) {
        await authController.refreshToken();
        await postUnsubscribe(activityId, activityDate);
      }
      final errorMessage = DioExceptions.fromDioError(e).toString();
      showErrorSnackBar(errorMessage);
      print('/activity/unenroll, error: ' + errorMessage);
    }
  }
}
