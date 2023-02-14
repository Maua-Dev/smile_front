// ignore_for_file: avoid_print
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/dashboard/infra/datasources/activities_datasource_interface.dart';
import 'package:smile_front/app/modules/dashboard/infra/models/subscription_activity_model.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';
import '../../../shared/error/dio_exceptions.dart';
import '../../../shared/error/error_snackbar.dart';
import '../../../shared/models/admin_activity_model.dart';
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
  Future<List<AdminActivityModel>> getAdminAllActivities() async {
    var token = await storage.getAccessToken();
    try {
      dio.options.headers["authorization"] = "Bearer $token";
      final res = await dio.get('/get-all-activities');
      if (res.statusCode == 200) {
        return AdminActivityModel.fromMaps(
            res.data['all_activities_with_enrollments']);
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
  Future<bool> postSubscribe(String activityId, DateTime activityDate) async {
    var token = await storage.getAccessToken();
    var body = SubscriptionActivityModel(
        activityDate: activityDate, activityId: activityId);
    try {
      dio.options.headers["authorization"] = "Bearer $token";
      await dio.post('/activity/enroll', data: body.toJson());
      return true;
    } on DioError catch (e) {
      if (e.response.toString().contains('Authentication Error')) {
        await authController.refreshToken(token.toString());
        await postSubscribe(activityId, activityDate);
      }
      final errorMessage = DioExceptions.fromDioError(e).toString();
      showErrorSnackBar(errorMessage: errorMessage);
      return false;
    }
  }

  @override
  Future editActivity(String id, ActivityModel activity) async {
    var token = await storage.getIdToken();
    try {
      dio.options.headers["authorization"] = "$token";
      await dio.put('/update-activity', data: activity.editToJson());
    } on DioError catch (e) {
      if (e.response.toString().contains('Authentication Error')) {
        await authController.refreshToken(token.toString());
        await editActivity(id, activity);
      }
      final errorMessage = DioExceptions.fromDioError(e).toString();
      showErrorSnackBar(errorMessage: errorMessage);
    }
  }

  @override
  Future createActivity(ActivityModel activity) async {
    var token = await storage.getIdToken();
    try {
      dio.options.headers["authorization"] = "$token";
      await dio.post('/create-activity', data: activity.toJson());
    } on DioError catch (e) {
      if (e.response.toString().contains('Authentication Error')) {
        await authController.refreshToken(token.toString());
        await createActivity(activity);
      }
      final errorMessage = DioExceptions.fromDioError(e).toString();
      showErrorSnackBar(errorMessage: errorMessage);
    }
  }

  @override
  Future deleteActivity(String activityCode) async {
    var token = await storage.getIdToken();
    var body = {"code": activityCode};
    try {
      dio.options.headers["authorization"] = "$token";
      await dio.post('/delete-activity', data: body);
    } on DioError catch (e) {
      if (e.response.toString().contains('Authentication Error')) {
        await authController.refreshToken(token.toString());
        await deleteActivity(activityCode);
      }
      final errorMessage = DioExceptions.fromDioError(e).toString();
      showErrorSnackBar(errorMessage: errorMessage);
    }
  }

  @override
  Future<bool> postUnsubscribe(String activityId, DateTime activityDate) async {
    var token = await storage.getAccessToken();
    var body = SubscriptionActivityModel(
        activityDate: activityDate, activityId: activityId);
    try {
      dio.options.headers["authorization"] = "Bearer $token";
      await dio.post('/activity/unenroll', data: body.toJson());
      return true;
    } on DioError catch (e) {
      if (e.response.toString().contains('Authentication Error')) {
        await authController.refreshToken(token.toString());
        await postUnsubscribe(activityId, activityDate);
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
