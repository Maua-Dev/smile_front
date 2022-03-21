import 'package:dio/dio.dart';

import '../infra/datasources/forgot_password_datasource.dart';
import 'errors.dart';

class ForgotPasswordDatasourceImpl implements ForgotPasswordDatasource {
  final Dio dioClient;

  ForgotPasswordDatasourceImpl({required this.dioClient});

  @override
  Future<String> forgotPassword(String username) async {
    var uri =
        "https://b574ab6867.execute-api.sa-east-1.amazonaws.com/dev/smile-mss-cognito";
    BaseOptions options = BaseOptions(
      baseUrl: uri,
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
      throw ForgotPasswordInvalid('Falha ao enviar o código, tente novamente.');
    }
  }
}
