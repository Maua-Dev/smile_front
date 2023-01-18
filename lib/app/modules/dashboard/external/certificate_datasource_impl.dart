import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/dashboard/infra/datasources/certificate_datasource_interface.dart';
import 'package:flutter/foundation.dart';
import '../../../shared/error/dio_exceptions.dart';
import '../../../shared/error/error_snackbar.dart';
import '../../auth/domain/repositories/secure_storage_interface.dart';
import '../../auth/presenter/controllers/auth_controller.dart';
import '../infra/models/certificate_model.dart';

class CertificateDatasourceImpl implements CertificateDatasourceInterface {
  final SecureStorageInterface storage;
  var authController = Modular.get<AuthController>();

  CertificateDatasourceImpl({required this.storage});

  @override
  Future<List<CertificateModel>> getListDownloads() async {
    Dio dio = Dio();
    var urlCertificate = '';
    if (kDebugMode) {
      urlCertificate =
          'https://lqtdp4le7zlr5bhel4jamjszcy0dhrft.lambda-url.sa-east-1.on.aws/';
    } else {
      urlCertificate =
          'https://gywf2oepfesleyuhgpwj5humz40bguxi.lambda-url.sa-east-1.on.aws/';
    }
    var token = await storage.getAccessToken();
    try {
      dio.options.headers["authorization"] = "Bearer $token";
      final res = await dio.get(urlCertificate);
      if (res.statusCode == 200) {
        return CertificateModel.fromMaps(res.data);
      }
      throw Exception();
    } on DioError catch (e) {
      if (e.response.toString().contains('Authentication Error')) {
        await authController.refreshToken(token.toString());
        await getListDownloads();
      }
      final errorMessage = DioExceptions.fromDioError(e).toString();
      showErrorSnackBar(errorMessage: errorMessage);
      rethrow;
    }
  }
}
