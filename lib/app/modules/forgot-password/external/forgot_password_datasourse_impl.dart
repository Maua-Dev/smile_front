import 'package:dio/dio.dart';
import 'package:smile_front/generated/l10n.dart';

import '../../../shared/services/environment/environment_config.dart';
import '../infra/datasources/forgot_password_datasource.dart';
import 'errors.dart';

class ForgotPasswordDatasourceImpl
    implements ForgotPasswordDatasourceInterface {
  BaseOptions options = BaseOptions(
    baseUrl: EnvironmentConfig.MSS_USER_BASE_URL,
    responseType: ResponseType.json,
    connectTimeout: 30000,
    receiveTimeout: 30000,
  );
  Dio dio = Dio();

  ForgotPasswordDatasourceImpl() {
    dio = Dio(options);
  }

  @override
  Future<String> forgotPassword(String username) async {
    try {
      final res = await dio.post('/change-password', data: {
        "email": username,
      });
      if (res.statusCode == 200) {
        return S.current.successSendingCode;
      }
      throw Exception();
    } on DioError catch (e) {
      throw ForgotPasswordInvalid(e.response!.data);
    }
  }

  @override
  Future<String> changePassword(
      String username, String password, String code) async {
    try {
      final res = await dio.post('/confirm-change-password', data: {
        "email": username,
        "new_password": password,
        "confirmation_code": code
      });
      if (res.statusCode == 200) {
        return S.current.successChangePassword;
      }
      throw Exception();
    } on DioError catch (e) {
      throw ForgotPasswordInvalid(e.response!.data);
    }
  }
}
