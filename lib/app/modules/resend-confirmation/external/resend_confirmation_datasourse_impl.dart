import 'package:dio/dio.dart';

import '../../../../generated/l10n.dart';
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
      final res = await dio.post('/resend-creation-confirmation', data: {
        "email": username,
      });
      if (res.statusCode == 200) {
        return S.current.successEmailSend;
      }
      throw Exception();
    } catch (e) {
      throw ResendConfirmationInvalid(S.current.errorSendingCode);
    }
  }
}
