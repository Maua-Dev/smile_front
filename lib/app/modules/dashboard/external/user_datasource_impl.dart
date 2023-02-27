// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/dashboard/infra/datasources/user_datasource_interface.dart';
import 'package:smile_front/app/modules/dashboard/infra/models/user_change_data_model.dart';

import '../../../shared/error/dio_exceptions.dart';
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
    var token = await storage.getIdToken();
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
      if (e.response?.statusCode == 401) {
        await authController.refreshUserToken();
        var res = await dio.get(url);
        return res.data;
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
}
