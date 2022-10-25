import 'package:dio/dio.dart';

import '../../../shared/services/environment/environment_config.dart';
import '../infra/datasources/resend_confirmation_datasource.dart';
import 'errors.dart';

class ResendConfirmationDatasourceImpl implements ResendConfirmationDatasource {
  final Dio dioClient;

  ResendConfirmationDatasourceImpl({required this.dioClient});

  @override
  Future<String> resendConfirmation(String username) async {
    BaseOptions options = BaseOptions(
      baseUrl: EnvironmentConfig.MSS_USER_BASE_URL,
      responseType: ResponseType.json,
      connectTimeout: 30000,
      receiveTimeout: 30000,
    );
    Dio dio = Dio(options);
    try {
      final res = await dio.put('/resendCreationConfirmation', data: {
        "cpf_rne": username,
      });
      if (res.statusCode == 200) {
        return 'E-mail enviado com sucesso!';
      }
      throw Exception();
    } catch (e) {
      throw ResendConfirmationInvalid(
          'Falha ao enviar o e-mail de\nconfirmação, tente novamente.');
    }
  }
}
