import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/dashboard/infra/datasources/user_datasource_interface.dart';
import 'package:smile_front/app/modules/dashboard/infra/models/user_change_data_model.dart';
import 'package:smile_front/app/shared/error/dio_exceptions.dart';
import 'package:smile_front/app/shared/models/responsible_professor_model.dart';
import '../../../shared/error/error_snackbar.dart';
import '../../../shared/services/environment/environment_config.dart';
import '../../auth/domain/repositories/secure_storage_interface.dart';
import '../../auth/presenter/controllers/auth_controller.dart';

class UserDatasourceImpl extends UserDatasourceInterface {
  final SecureStorageInterface storage;
  var authController = Modular.get<AuthController>();

  BaseOptions options = BaseOptions(
    baseUrl: EnvironmentConfig.MSS_USER_BASE_URL,
    responseType: ResponseType.json,
    connectTimeout: 30000,
    receiveTimeout: 30000,
  );
  Dio dio = Dio();

  UserDatasourceImpl({required this.storage}) {
    dio = Dio(options);
  }

  Future<Response> middleware(
      {required String url,
      String? http,
      bool needAutorization = true,
      dynamic data}) async {
    var token = await storage.getAccessToken();
    try {
      needAutorization
          ? dio.options.headers["authorization"] = "Bearer $token"
          : null;
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
      return res;
    } on DioError catch (e) {
      if (e.response == null || e.response?.statusCode == 401) {
        await authController.refreshUserToken();
        var res = await middleware(
            url: url, needAutorization: needAutorization, data: data);
        return res.data;
      }
      showErrorSnackBar(errorMessage: e.response!.data);
      rethrow;
    }
  }

  @override
  Future<List<ResponsibleProfessorModel>> getResponsibleProfessors() async {
    try {
      final res = await dio.get('/list-professors');
      if (res.statusCode == 200) {
        return ResponsibleProfessorModel.fromMaps(res.data['professors']);
      }
      throw Exception();
    } on DioError catch (e) {
      if (e.response.toString().contains('Authentication Error')) {
        await authController.refreshToken();
        await getResponsibleProfessors();
      }
      final errorMessage = DioExceptions.fromDioError(e).toString();
      showErrorSnackBar(errorMessage: errorMessage);
      rethrow;
    }
  }

  @override
  Future putUser(UserChangeDataModel userChangeDataModel) async {
    await middleware(
        url: '/update-user', data: userChangeDataModel.toJson(), http: 'post');
  }

  @override
  Future deleteUser(String code) async {
    await middleware(url: '/delete-user/$code', http: 'delete');
  }
}
