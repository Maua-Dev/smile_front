import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/dashboard/infra/datasources/certificate_datasource_interface.dart';
import 'package:smile_front/app/shared/services/enviroment/enviroment_config.dart';

import '../../../shared/error/dio_exceptions.dart';
import '../../../shared/error/error_snackbar.dart';
import '../../auth/domain/repositories/secure_storage_interface.dart';
import '../../auth/presenter/controllers/auth_controller.dart';
import '../infra/models/certificate_model.dart';

class CertificateDatasourceImpl implements CertificateDatasourceInterface {
  final SecureStorageInterface storage;
  var authController = Modular.get<AuthController>();
  BaseOptions options = BaseOptions(
    baseUrl: EnvironmentConfig.MSS_CERTIFICATE_BASE_URL,
    responseType: ResponseType.json,
    connectTimeout: 30000,
    receiveTimeout: 30000,
  );
  Dio dio = Dio();

  CertificateDatasourceImpl({required this.storage});

  @override
  Future<List<CertificateModel>> getListDownloads() async {
    var token = await storage.getAccessToken();
    try {
      dio.options.headers["authorization"] = "Bearer $token";
      final res = await dio.get(
          'https://lqtdp4le7zlr5bhel4jamjszcy0dhrft.lambda-url.sa-east-1.on.aws/');
      if (res.statusCode == 200) {
        return CertificateModel.fromMaps(res.data);
      }
      throw Exception();
    } on DioError catch (e) {
      if (e.response.toString().contains('Authentication Error')) {
        await authController.refreshToken();
        await getListDownloads();
      }
      final errorMessage = DioExceptions.fromDioError(e).toString();
      showErrorSnackBar(errorMessage: errorMessage);
      // ignore: avoid_print
      print('get certificate, error: ' + errorMessage);
      rethrow;
    }
  }
}
