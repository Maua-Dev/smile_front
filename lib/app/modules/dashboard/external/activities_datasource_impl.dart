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
import '../infra/models/user_enrolled_activities_model.dart';

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
  Future<bool> postSubscribe(String activityCode) async {
    var token = await storage.getAccessToken();
    var userId = await storage.getId();
    var body = {"user_id": userId, "code": activityCode};
    try {
      dio.options.headers["authorization"] = "Bearer $token";
      await dio.post('/enroll-activity', data: body);
      return true;
    } on DioError catch (e) {
      if (e.response.toString().contains('Authentication Error')) {
        await authController.refreshToken(token.toString());
        await postSubscribe(activityCode);
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
  Future<List<UserEnrolledActivitiesModel>> getEnrollmentByUserId() async {
    var token = await storage.getAccessToken();
    // var userId = await storage.getId();
    try {
      dio.options.headers["authorization"] = "Bearer $token";
      var response = await dio.get(
          '/get-enrollments-by-user-id?user_id=0355573c-a110-11ed-a8fc-0242ac120002');
      if (response.statusCode == 200) {
        return UserEnrolledActivitiesModel.fromMaps(
            response.data['enrollments']);
      }
      throw Exception();
    } on DioError catch (e) {
      if (e.response.toString().contains('Authentication Error')) {
        await authController.refreshToken(token.toString());
        await getEnrollmentByUserId();
      }
      final errorMessage = DioExceptions.fromDioError(e).toString();
      showErrorSnackBar(errorMessage: errorMessage);
      rethrow;
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
  Future<bool> postUnsubscribe(String activityCode) async {
    var token = await storage.getAccessToken();
    var userId = await storage.getId();
    var body = {"user_id": userId, "code": activityCode};
    try {
      dio.options.headers["authorization"] = "Bearer $token";
      await dio.post('/drop-activity', data: body);
      return true;
    } on DioError catch (e) {
      if (e.response.toString().contains('Authentication Error')) {
        await authController.refreshToken(token.toString());
        await postUnsubscribe(activityCode);
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
        await getEnrollmentByUserId();
      }
      final errorMessage = DioExceptions.fromDioError(e).toString();
      showErrorSnackBar(errorMessage: errorMessage);
      rethrow;
    }
  }
}
