// ignore_for_file: avoid_print
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/dashboard/infra/datasources/activities_datasource_interface.dart';
import 'package:smile_front/app/shared/entities/infra/enrollment_state_enum.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';
import '../../../shared/error/dio_exceptions.dart';
import '../../../shared/error/error_snackbar.dart';
import '../../../shared/models/admin_activity_model.dart';
import '../../../shared/models/enrolls_activity_model.dart';
import '../../../shared/services/environment/environment_config.dart';
import '../../auth/domain/repositories/secure_storage_interface.dart';
import '../../auth/presenter/controllers/auth_controller.dart';

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
    try {
      final res = await dio.get('/get-all-activities');
      if (res.statusCode == 200) {
        return ActivityModel.fromMaps(res.data['all_activities']);
      }
      throw Exception();
    } on DioError catch (e) {
      if (e.response.toString().contains('Authentication Error')) {
        await authController.refreshToken();
        await getAllActivities();
      }
      final errorMessage = DioExceptions.fromDioError(e).toString();
      print(errorMessage);
      showErrorSnackBar(errorMessage: errorMessage);
      rethrow;
    }
  }

  @override
  Future<List<AdminActivityModel>> getAdminAllActivities() async {
    var token = await storage.getIdToken();
    try {
      dio.options.headers["authorization"] = "$token";
      final res = await dio.get('/get-all-activities-admin');
      if (res.statusCode == 200) {
        return AdminActivityModel.fromMaps(
            res.data['all_activities_with_enrollments']);
      }
      throw Exception();
    } on DioError catch (e) {
      if (e.response.toString().contains('Authentication Error')) {
        await authController.refreshToken();
        await getAdminAllActivities();
      }
      final errorMessage = DioExceptions.fromDioError(e).toString();
      showErrorSnackBar(errorMessage: errorMessage);
      rethrow;
    }
  }

  @override
  Future<List<EnrollsActivityModel>> getAllActivitiesLogged() async {
    var token = await storage.getIdToken();
    try {
      dio.options.headers["authorization"] = "$token";
      final res = await dio.get('/get-all-activities-logged');
      if (res.statusCode == 200) {
        return EnrollsActivityModel.fromMaps(
            res.data['all_activities_and_user_enrollments']);
      }
      throw Exception();
    } on DioError catch (e) {
      if (e.response.toString().contains('Authentication Error')) {
        await authController.refreshToken();
        await getAllActivitiesLogged();
      }
      final errorMessage = DioExceptions.fromDioError(e).toString();
      showErrorSnackBar(errorMessage: errorMessage);
      rethrow;
    }
  }

  @override
  Future<List<EnrollsActivityModel>> getActivityWithEnrollments(
      String code) async {
    var token = await storage.getIdToken();
    try {
      dio.options.headers["authorization"] = "$token";
      final res = await dio.get('/get-activity-with-enrollments?code=$code');
      if (res.statusCode == 200) {
        return EnrollsActivityModel.fromMaps(
            res.data['activity_with_enrollments']);
      }
      throw Exception();
    } on DioError catch (e) {
      if (e.response.toString().contains('Authentication Error')) {
        await authController.refreshToken();
        await getActivityWithEnrollments(code);
      }
      final errorMessage = DioExceptions.fromDioError(e).toString();
      showErrorSnackBar(errorMessage: errorMessage);
      rethrow;
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
        await authController.refreshToken();
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
        await authController.refreshToken();
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
        await authController.refreshToken();
        await deleteActivity(activityCode);
      }
      final errorMessage = DioExceptions.fromDioError(e).toString();
      showErrorSnackBar(errorMessage: errorMessage);
    }
  }

  @override
  Future<bool> postSubscribe(String activityCode) async {
    var token = await storage.getIdToken();
    var body = {'code': activityCode};
    try {
      dio.options.headers["authorization"] = "$token";
      await dio.post('/enroll-activity', data: body);
      return true;
    } on DioError catch (e) {
      if (e.response.toString().contains('Authentication Error')) {
        await authController.refreshToken();
        await postSubscribe(activityCode);
      }
      final errorMessage = DioExceptions.fromDioError(e).toString();
      showErrorSnackBar(errorMessage: errorMessage);
      return false;
    }
  }

  @override
  Future<bool> postUnsubscribe(String activityCode) async {
    var token = await storage.getIdToken();
    var body = {'code': activityCode};
    try {
      dio.options.headers["authorization"] = "$token";
      await dio.post('/drop-activity', data: body);
      return true;
    } on DioError catch (e) {
      if (e.response.toString().contains('Authentication Error')) {
        await authController.refreshToken();
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
        await authController.refreshToken();
        await getAllActivitiesLogged();
      }
      final errorMessage = DioExceptions.fromDioError(e).toString();
      showErrorSnackBar(errorMessage: errorMessage);
      rethrow;
    }
  }

  @override
  Future postConfirmAttendance(
      String activityCode, String confirmationCode) async {
    var token = await storage.getIdToken();
    try {
      dio.options.headers["authorization"] = "$token";
      await dio.post('/confirm-attendance');
      throw Exception();
    } on DioError catch (e) {
      if (e.response.toString().contains('Authentication Error')) {
        await authController.refreshToken();
        await postConfirmAttendance(activityCode, confirmationCode);
      }
      final errorMessage = DioExceptions.fromDioError(e).toString();
      showErrorSnackBar(errorMessage: errorMessage);
    }
  }

  @override
  Future postDeleteAttendanceConfirmation(String activityCode) async {
    var token = await storage.getIdToken();
    try {
      dio.options.headers["authorization"] = "$token";
      await dio.post('/delete-attendance-confirmation');
      throw Exception();
    } on DioError catch (e) {
      if (e.response.toString().contains('Authentication Error')) {
        await authController.refreshToken();
        await postDeleteAttendanceConfirmation(activityCode);
      }
      final errorMessage = DioExceptions.fromDioError(e).toString();
      showErrorSnackBar(errorMessage: errorMessage);
    }
  }

  @override
  Future<String> postGenerateAttendanceConfirmation(String activityCode) async {
    var token = await storage.getIdToken();
    try {
      dio.options.headers["authorization"] = "$token";
      var res = await dio.post('/delete-attendance-confirmation');
      if (res.statusCode == 200) {
        return res.data['confirmation_code'] as String;
      }
      throw Exception();
    } on DioError catch (e) {
      if (e.response.toString().contains('Authentication Error')) {
        await authController.refreshToken();
        await postGenerateAttendanceConfirmation(activityCode);
      }
      final errorMessage = DioExceptions.fromDioError(e).toString();
      showErrorSnackBar(errorMessage: errorMessage);
      rethrow;
    }
  }

  @override
  Future<EnrollsActivityModel> postManualChangeAttendance(
      String activityCode, String userId, EnrollmentStateEnum state) async {
    var token = await storage.getIdToken();
    try {
      dio.options.headers["authorization"] = "$token";
      var res = await dio.post('/delete-attendance-confirmation');
      if (res.statusCode == 200) {
        return EnrollsActivityModel.fromMap(
            res.data['activity_with_enrollments']);
      }
      throw Exception();
    } on DioError catch (e) {
      if (e.response.toString().contains('Authentication Error')) {
        await authController.refreshToken();
        await postGenerateAttendanceConfirmation(activityCode);
      }
      final errorMessage = DioExceptions.fromDioError(e).toString();
      showErrorSnackBar(errorMessage: errorMessage);
      rethrow;
    }
  }
}
