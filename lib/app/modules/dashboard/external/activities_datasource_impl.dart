import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/dashboard/infra/datasources/activities_datasource_interface.dart';
import 'package:smile_front/app/shared/entities/infra/enrollment_state_enum.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';
import 'package:smile_front/app/shared/models/professor_activity_model.dart';
import '../../../shared/error/dio_exceptions.dart';
import '../../../shared/error/error_snackbar.dart';
import '../../../shared/models/admin_activity_model.dart';
import '../../../shared/models/enrollments_model.dart';
import '../../../shared/models/enrolls_activity_model.dart';
import '../../../shared/services/environment/environment_config.dart';
import '../../auth/domain/repositories/secure_storage_interface.dart';
import '../../auth/presenter/controllers/auth_controller.dart';

class ActivitiesDatasourceImpl extends ActivitiesDatasourceInterface {
  final SecureStorageInterface storage;
  var authController = Modular.get<AuthController>();
  static int requestCounter = 0;
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

  Future<Response> middleware(
      {required String url,
      String? http,
      bool needAutorization = true,
      dynamic data}) async {
    var token = await storage.getIdToken();
    try {
      needAutorization ? dio.options.headers["authorization"] = "$token" : null;
      Response res;
      switch (http) {
        case 'post':
          res = await dio.post(url, data: data);
          break;
        case 'put':
          res = await dio.put(url, data: data);
          break;
        default:
          res = await dio.get(url);
      }
      requestCounter = 0;
      return res;
    } on DioError catch (e) {
      if (e.response == null || e.response!.statusCode == 401) {
        await authController.refreshUserToken();
        requestCounter++;
        if (requestCounter < 2) {
          var res = await middleware(
              http: http,
              url: url,
              needAutorization: needAutorization,
              data: data);
          requestCounter = 0;
          return res.data;
        }
      }
      showErrorSnackBar(errorMessage: e.response!.data);
      return e.response!;
    }
  }

  @override
  Future<List<ActivityModel>> getAllActivities() async {
    final res =
        await middleware(url: '/get-all-activities', needAutorization: false);
    if (res.statusCode == 200) {
      return ActivityModel.fromMaps(res.data['all_activities']);
    }
    return [];
  }

  @override
  Future<List<AdminActivityModel>> getAdminAllActivities() async {
    final res = await middleware(url: '/get-all-activities-admin');
    if (res.statusCode == 200) {
      return AdminActivityModel.fromMaps(
          res.data['all_activities_with_enrollments']);
    }
    return [];
  }

  @override
  Future<List<EnrollsActivityModel>> getAllActivitiesLogged() async {
    final res = await middleware(url: '/get-all-activities-logged');
    if (res.statusCode == 200) {
      return EnrollsActivityModel.fromMaps(
          res.data['all_activities_and_user_enrollments']);
    }
    return [];
  }

  @override
  Future<ProfessorActivityModel> getActivityWithEnrollments(String code) async {
    final res =
        await middleware(url: '/get-activity-with-enrollments?code=$code');
    if (res.statusCode == 200) {
      return ProfessorActivityModel.fromMap(
          res.data['activity_with_enrollments']);
    }
    return ProfessorActivityModel.newInstance();
  }

  @override
  Future editActivity(String id, ActivityModel activity) async {
    await middleware(
        url: '/update-activity', data: activity.editToJson(), http: 'put');
  }

  @override
  Future createActivity(ActivityModel activity) async {
    await middleware(
        url: '/create-activity', data: activity.toJson(), http: 'post');
  }

  @override
  Future deleteActivity(String activityCode) async {
    var body = {"code": activityCode};
    await middleware(url: '/delete-activity', data: body, http: 'post');
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
    await middleware(url: '/confirm-attendance', http: 'post');
  }

  @override
  Future postDeleteAttendanceConfirmation(String activityCode) async {
    await middleware(url: '/delete-attendance-confirmation', http: 'post');
  }

  @override
  Future<String> postGenerateAttendanceConfirmation(String activityCode) async {
    var res =
        await middleware(url: '/delete-attendance-confirmation', http: 'post');
    if (res.statusCode == 200) {
      return res.data['confirmation_code'] as String;
    }
    throw Exception();
  }

  @override
  Future<EnrollmentsModel> postSubscribe(String activityCode) async {
    var body = {'code': activityCode};
    var res =
        await middleware(url: '/enroll-activity', data: body, http: 'post');
    if (res.statusCode == 200) {
      return EnrollmentsModel(
        state: EnrollmentStateEnumExtension.stringToEnumMap(res.data['state']),
        dateSubscribed:
            DateTime.fromMillisecondsSinceEpoch(res.data['date_subscribed']),
      );
    }
    return EnrollmentsModel.newInstance();
  }

  @override
  Future<bool> postUnsubscribe(String activityCode) async {
    var body = {'code': activityCode};
    var res = await middleware(url: '/drop-activity', data: body, http: 'post');
    if (res.statusCode == 200) {
      return true;
    }
    return false;
  }

  @override
  Future<ProfessorActivityModel> postManualChangeAttendance(
      String activityCode, String userId, EnrollmentStateEnum state) async {
    var body = {
      'code': activityCode,
      'user_id': userId,
      'new_state': state.name
    };
    var res = await middleware(
        url: '/manual-attendance-change', data: body, http: 'post');
    if (res.statusCode == 200) {
      return ProfessorActivityModel.fromMap(
          res.data['activity_with_enrollments']);
    }
    throw Exception();
  }

  @override
  Future<String> generateConfirmationCode(String activityCode) async {
    var body = {'code': activityCode};
    var response = await middleware(
        url: '/generate-attendance-confirmation', data: body, http: 'post');
    if (response.statusCode == 200) {
      return response.data['confirmation_code'];
    }
    throw Exception();
  }
}
