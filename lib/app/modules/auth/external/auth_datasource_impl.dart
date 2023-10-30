import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/shared/helpers/environment/environment_config.dart';
import '../../../shared/helpers/errors/error_snackbar.dart';
import '../../../shared/infra/models/user_model.dart';
import '../domain/repositories/secure_storage_interface.dart';
import '../errors/errors.dart';
import '../infra/datasource/auth_datasource_interface.dart';

class AuthDatasourceImpl implements AuthDatasourceInterface {
  final SecureStorageInterface storage;
  BaseOptions options = BaseOptions(
    baseUrl: EnvironmentConfig.MSS_USER_BASE_URL,
    responseType: ResponseType.json,
    connectTimeout: 30000,
    receiveTimeout: 30000,
  );
  Dio dio = Dio();

  AuthDatasourceImpl({required this.storage}) {
    dio = Dio(options);
  }

  @override
  Future<UserModel> login(email, password) async {
    try {
      final res = await dio.post('/login-user', data: {
        'login': email,
        'password': password,
      });
      if (res.statusCode == 200) {
        var response = res.data;
        return UserModel.fromMap(response['user']);
      }
      throw Exception();
    } on DioError catch (e) {
      throw LoginInvalid(e.response!.data);
    }
  }

  @override
  Future<Map<String, dynamic>> refreshToken() async {
    var token = await storage.getRefreshToken();
    try {
      dio.options.headers["authorization"] = "Bearer $token";
      final res = await dio.get("/refresh-token");
      if (res.statusCode == 200) {
        var tokens = res.data;
        return tokens;
      }
      throw Exception();
    } on DioError catch (e) {
      if (e.response == null || e.response!.statusCode == 401) {
        storage.cleanSecureStorage();
        Modular.to.navigate('/login');
      }
      showErrorSnackBar(errorMessage: e.response!.data);
      rethrow;
    }
  }
}
