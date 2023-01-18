import 'package:dio/dio.dart';
import 'package:smile_front/generated/l10n.dart';

import '../../../shared/services/environment/environment_config.dart';
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
        return S.current.successSendingCode;
      }
      throw Exception();
    } catch (e) {
      throw ForgotPasswordInvalid(S.current.errorSendingCode);
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
        return S.current.successChangePassword;
      }
      throw Exception();
    } catch (e) {
      throw ForgotPasswordInvalid(S.current.errorChangePassword);
    }
  }
}
