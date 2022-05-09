import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/shared/services/enviroment/enviroment_config.dart';

import '../../../shared/models/user_model.dart';
import '../domain/repositories/secure_storage_interface.dart';
import '../errors/errors.dart';
import '../infra/datasource/auth_datasource.dart';

class AuthDatasourceImpl implements AuthDatasource {
  final Dio dioClient;
  final SecureStorageInterface storage;

  AuthDatasourceImpl({required this.dioClient, required this.storage});
  @override
  Future<String> getAccessLevel(cpfRne) async {
    try {
      final res = await dioClient.get(
        '/user/$cpfRne',
      );
      if (res.statusCode == 200) {
        var user = UserModel.fromMap(res.data);
        return user.accessLevel;
      }
      throw Exception();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> login(cpfRne, password) async {
    BaseOptions options = BaseOptions(
      baseUrl: EnvironmentConfig.MSS_USER_BASE_URL,
      responseType: ResponseType.json,
      connectTimeout: 30000,
      receiveTimeout: 30000,
    );
    Dio dio = Dio(options);
    try {
      final res = await dio.post('/login', data: {
        'login': cpfRne,
        'password': password,
      });
      if (res.statusCode == 200) {
        var response = res.data;
        return response;
      }
      throw Exception();
    } on DioError catch (e) {
      if (e.response.toString().contains('User is not confirmed')) {
        Modular.to.navigate('/login/reenviar-email');
      } else if (e.response.toString().contains('User not found')) {
        throw LoginInvalid(
            'Não foi possível realizar o login. \n- Tente fazer o login novamente \n utilizando seu CPF\n- Realize seu cadastro clicando \n no botão "Não tenho cadastro"');
      }
      throw LoginInvalid('Login ou Senha inválida');
    }
  }

  @override
  Future<Map<String, dynamic>> refreshToken(String token) async {
    try {
      BaseOptions options = BaseOptions(
        baseUrl: EnvironmentConfig.MSS_USER_BASE_URL,
        responseType: ResponseType.json,
        connectTimeout: 30000,
        receiveTimeout: 30000,
      );
      Dio dio = Dio(options);
      dio.options.headers["authorization"] = "Bearer $token";
      final res = await dio.get("/refreshToken");
      if (res.statusCode == 200) {
        var tokens = res.data;
        return tokens;
      }
      throw Exception();
    } catch (e) {
      if (e.toString().contains('400')) {
        storage.cleanSecureStorage();
        Modular.to.navigate('/login');
      }
      rethrow;
    }
  }
}
