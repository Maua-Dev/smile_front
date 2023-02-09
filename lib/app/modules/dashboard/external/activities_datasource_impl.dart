// ignore_for_file: avoid_print
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/dashboard/infra/datasources/activities_datasource_interface.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';
import '../../../shared/error/dio_exceptions.dart';
import '../../../shared/error/error_snackbar.dart';
import '../../../shared/services/environment/environment_config.dart';
import '../../auth/domain/repositories/secure_storage_interface.dart';
import '../../auth/presenter/controllers/auth_controller.dart';
import '../utils/mocks/subscribed_activities_mock.dart';

class ActivitiesDatasourceImpl extends ActivitiesDatasourceInterface {
  final SecureStorageInterface storage;
  var authController = Modular.get<AuthController>();
  BaseOptions options = BaseOptions(
    baseUrl: EnvironmentConfig.MSS_ACTIVITIES_BASE_URL,
    responseType: ResponseType.json,
    connectTimeout: 30000,
    receiveTimeout: 30000,
  );
  Dio dio = Dio();
  ActivitiesDatasourceImpl({
    required this.storage,
  }) {
    dio = Dio(options);
  }

  @override
  Future<List<ActivityModel>> getAllActivities() async {
    var token = await storage.getAccessToken();
    try {
      dio.options.headers["authorization"] = "Bearer $token";
      final res = await dio.get('/get-all-activities');
      if (res.statusCode == 200) {
        return ActivityModel.fromMaps(res.data['all_activities']);
      }
      throw Exception();
    } on DioError catch (e) {
      if (e.response.toString().contains('Authentication Error')) {
        await authController.refreshToken(token.toString());
        await getAllActivities();
      }
      final errorMessage = DioExceptions.fromDioError(e).toString();
      showErrorSnackBar(errorMessage: errorMessage);
      rethrow;
    }
  }

  @override
  Future<List<ActivityModel>> getUserSubscribedActivities() async {
    var token = await storage.getAccessToken();
    try {
      // dio.options.headers["authorization"] = "Bearer $token";
      // final res = await dio.get('/activity/userisenrolled');
      // if (res.statusCode == 200) {
      //   return ActivityModel.fromMaps(res.data);
      // }
      return subscribedActivities;
    } on DioError catch (e) {
      if (e.response.toString().contains('Authentication Error')) {
        await authController.refreshToken(token.toString());
        await getUserSubscribedActivities();
      }
      final errorMessage = DioExceptions.fromDioError(e).toString();
      showErrorSnackBar(errorMessage: errorMessage);
      rethrow;
    }
  }

  @override
  Future<bool> postSubscribe(String userId, String activityCode) async {
    var token = await storage.getAccessToken();
    var body = {"user_id": userId, "code": activityCode};
    try {
      dio.options.headers["authorization"] = "Bearer $token";
      await dio.post('/enroll-activity', data: body);
      return true;
    } on DioError catch (e) {
      if (e.response.toString().contains('Authentication Error')) {
        await authController.refreshToken(token.toString());
        await postSubscribe(userId, activityCode);
      }
      final errorMessage = DioExceptions.fromDioError(e).toString();
      showErrorSnackBar(errorMessage: errorMessage);
      return false;
    }
  }

  @override
  Future putActivity(String id, ActivityModel activity) async {
    var token = await storage.getAccessToken();
    try {
      dio.options.headers["authorization"] = "Bearer $token";
      await dio.put('/activity?id=$id', data: activity.toJson());
    } on DioError catch (e) {
      if (e.response.toString().contains('Authentication Error')) {
        await authController.refreshToken(token.toString());
        await putActivity(id, activity);
      }
      final errorMessage = DioExceptions.fromDioError(e).toString();
      showErrorSnackBar(errorMessage: errorMessage);
    }
  }

  @override
  Future getEnrollmentByUserId(String userId) async {
    var token = await storage.getAccessToken();
    try {
      dio.options.headers["authorization"] = "Bearer $token";
      await dio.get('/get-enrollments-by-user-id?:$userId');
    } on DioError catch (e) {
      if (e.response.toString().contains('Authentication Error')) {
        await authController.refreshToken(token.toString());
        await getEnrollmentByUserId(userId);
      }
      final errorMessage = DioExceptions.fromDioError(e).toString();
      showErrorSnackBar(errorMessage: errorMessage);
    }
  }

  @override
  Future postActivity(ActivityModel activity) async {
    var token = await storage.getAccessToken();
    try {
      dio.options.headers["authorization"] = "Bearer $token";
      await dio.post('/activity', data: activity.toJson());
    } on DioError catch (e) {
      if (e.response.toString().contains('Authentication Error')) {
        await authController.refreshToken(token.toString());
        await postActivity(activity);
      }
      final errorMessage = DioExceptions.fromDioError(e).toString();
      showErrorSnackBar(errorMessage: errorMessage);
    }
  }

  @override
  Future removeActivity(String id) async {
    var token = await storage.getAccessToken();
    try {
      dio.options.headers["authorization"] = "Bearer $token";
      await dio.delete('/activity?id=$id');
    } on DioError catch (e) {
      if (e.response.toString().contains('Authentication Error')) {
        await authController.refreshToken(token.toString());
        await removeActivity(id);
      }
      final errorMessage = DioExceptions.fromDioError(e).toString();
      showErrorSnackBar(errorMessage: errorMessage);
    }
  }

  @override
  Future<bool> postUnsubscribe(String userId, String activityCode) async {
    var token = await storage.getAccessToken();
    var body = {"user_id": userId, "code": activityCode};
    try {
      dio.options.headers["authorization"] = "Bearer $token";
      await dio.post('/drop-activity', data: body);
      return true;
    } on DioError catch (e) {
      if (e.response.toString().contains('Authentication Error')) {
        await authController.refreshToken(token.toString());
        await postUnsubscribe(userId, activityCode);
      }
      final errorMessage = DioExceptions.fromDioError(e).toString();
      showErrorSnackBar(errorMessage: errorMessage);
      return false;
    }
  }

  @override
  Future<String> getLinkCsv() async {
    var token = await storage.getAccessToken();
    try {
      dio.options.headers["authorization"] = "Bearer $token";
      final res = await dio.get('/activity/download');
      if (res.statusCode == 200) {
        return res.data;
      }
      throw Exception();
    } on DioError catch (e) {
      if (e.response.toString().contains('Authentication Error')) {
        await authController.refreshToken(token.toString());
        await getUserSubscribedActivities();
      }
      final errorMessage = DioExceptions.fromDioError(e).toString();
      showErrorSnackBar(errorMessage: errorMessage);
      rethrow;
    }
  }
}
