import 'package:dio/dio.dart';

import '../../../shared/services/enviroment/enviroment_config.dart';
import '../infra/datasources/forgot_password_datasource.dart';
import 'errors.dart';

class ForgotPasswordDatasourceImpl implements ForgotPasswordDatasource {
  final Dio dioClient;

  ForgotPasswordDatasourceImpl({required this.dioClient});

  @override
  Future<String> forgotPassword(String username) async {
    BaseOptions options = BaseOptions(
      baseUrl: EnvironmentConfig.MSS_USER_BASE_URL,
      responseType: ResponseType.json,
      connectTimeout: 30000,
      receiveTimeout: 30000,
    );
    Dio dio = Dio(options);
    try {
      final res = await dio.put('/changePassword', data: {
        "login": username,
      });
      if (res.statusCode == 200) {
        return 'Código enviado com sucesso!';
      }
      throw Exception();
    } catch (e) {
      throw ForgotPasswordInvalid(
          'Falha ao enviar o código, e-mail não cadastrado ou não confirmado.');
    }
  }

  @override
  Future<String> changePassword(
      String username, String password, String code) async {
    BaseOptions options = BaseOptions(
      baseUrl: EnvironmentConfig.MSS_USER_BASE_URL,
      responseType: ResponseType.json,
      connectTimeout: 30000,
      receiveTimeout: 30000,
    );
    Dio dio = Dio(options);
    try {
      final res = await dio.post('/changePassword', data: {
        "login": username,
        "new_password": password,
        "confirmation_code": code
      });
      if (res.statusCode == 200) {
        return 'Senha alterada com sucesso!';
      }
      throw Exception();
    } catch (e) {
      throw ForgotPasswordInvalid(
          'Falha ao tentar alterar a senha, tente novamente.');
    }
  }
}
