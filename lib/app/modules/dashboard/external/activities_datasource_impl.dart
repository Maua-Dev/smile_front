import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/dashboard/infra/datasources/activities_datasource_interface.dart';
import 'package:smile_front/app/shared/domain/enum/enrollment_state_enum.dart';
import 'package:smile_front/app/shared/infra/models/activity_model.dart';
import 'package:smile_front/app/shared/infra/models/professor_activity_model.dart';
import '../../../shared/helpers/errors/dio_exceptions.dart';
import '../../../shared/helpers/errors/error_snackbar.dart';
import '../../../shared/infra/models/admin_activity_model.dart';
import '../../../shared/infra/models/enrollments_model.dart';
import '../../../shared/infra/models/enrolls_activity_model.dart';
import '../../../shared/helpers/environment/environment_config.dart';
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

  Future<Response> middleware(
      {required String url,
      String? http,
      bool needAutorization = true,
      dynamic data}) async {
    var token = await storage.getIdToken();
    needAutorization ? dio.options.headers["authorization"] = "$token" : null;
    Response? res;
    switch (http) {
      case 'post':
        res = await post(url, data);
        break;
      case 'put':
        res = await put(url, data);
        break;
      default:
        res = await get(url, data);
    }
    return res;
  }

  Future<Response> get(String url, dynamic data) async {
    return await _handleRequest(() => dio.get(url));
  }

  Future<Response> post(String url, dynamic data) async {
    return await _handleRequest(() => dio.post(url, data: data));
  }

  Future<Response> put(String url, dynamic data) async {
    return await _handleRequest(() => dio.put(url, data: data));
  }

  Future<Response> _handleRequest(Future<Response> Function() request) async {
    try {
      return await request();
    } on DioError catch (e) {
      return _handleError(e, request);
    }
  }

  Future<Response> _handleError(
      DioError e, Future<Response> Function() request) async {
    if (e.response == null || e.response!.statusCode == 401) {
      await authController.refreshUserToken();
      dio.options.headers["authorization"] = await storage.getIdToken();
      return await request();
    }
    showErrorSnackBar(errorMessage: e.response!.data);
    return Future.value(e.response);
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
  Future<ActivityModel?> editActivity(
      String id, AdminActivityModel activity) async {
    var res = await middleware(
        url: '/update-activity', data: activity.editToJson(), http: 'post');
    if (res.statusCode == 200) {
      return ActivityModel.fromMap(res.data["activity"]);
    }
    return null;
  }

  @override
  Future<ActivityModel?> createActivity(AdminActivityModel activity) async {
    var res = await middleware(
        url: '/create-activity', data: activity.toJson(), http: 'post');
    if (res.statusCode == 201) {
      return ActivityModel.fromMap(res.data['activity']);
    }
    return null;
  }

  @override
  Future deleteActivity(String activityCode) async {
    var body = {"code": activityCode};
    await middleware(url: '/delete-activity', data: body, http: 'post');
  }

  @override
  Future<AdminActivityModel> manualDropActivity(
      String activityCode, String userId) async {
    var body = {'code': activityCode, 'user_id': userId};
    var res = await middleware(
        url: '/manual-drop-activity', data: body, http: 'post');
    return AdminActivityModel.fromMap(res.data['activity_with_enrollments']);
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
  Future<ProfessorActivityModel> postManualChangeAttendance(
      String activityCode, String userId, EnrollmentStateEnum state) async {
    var body = {
      'code': activityCode,
      'user_id': userId,
      'new_state': state.key
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

  @override
  Future confirmAttendance(
      String confirmAttendanceCode, String activityCode) async {
    var body = {
      'code': activityCode,
      'confirmation_code': confirmAttendanceCode
    };

    await middleware(url: '/confirm-attendance', http: 'post', data: body);
  }

  @override
  Future deleteAttendanceCode(String activityCode) async {
    var body = {'code': activityCode};
    var response = await middleware(
        url: '/delete-attendance-confirmation', data: body, http: 'post');
    if (response.statusCode == 200) {
      return response.data['confirmation_code'];
    }
    throw Exception();
  }

  @override
  Future deleteUser() async {
    await middleware(url: '/delete-user', http: 'post');
  }
}
