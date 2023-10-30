import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/dashboard/infra/datasources/certificate_datasource_interface.dart';
import '../../../shared/helpers/errors/error_snackbar.dart';
import '../../../shared/helpers/environment/environment_config.dart';
import '../../auth/domain/repositories/secure_storage_interface.dart';
import '../../auth/presenter/controllers/auth_controller.dart';
import '../infra/models/certificate_model.dart';

class CertificateDatasourceImpl implements CertificateDatasourceInterface {
  final SecureStorageInterface storage;
  var authController = Modular.get<AuthController>();
  static int requestCounter = 0;
  BaseOptions options = BaseOptions(
    baseUrl: EnvironmentConfig.MSS_ACTIVITIES_BASE_URL,
    responseType: ResponseType.json,
    connectTimeout: 30000,
    receiveTimeout: 30000,
  );
  Dio dio = Dio();

  CertificateDatasourceImpl({required this.storage}) {
    dio = Dio(options);
  }

  @override
  Future<List<CertificateModel>> getListCertificates() async {
    var token = await storage.getIdToken();
    try {
      dio.options.headers["authorization"] = "$token";
      final res = await dio.get('/get-certificate');
      if (res.statusCode == 200) {
        return CertificateModel.fromMaps(res.data['certificates']);
      }
      throw Exception();
    } on DioError catch (e) {
      if (e.response == null || e.response!.statusCode == 401) {
        await authController.refreshUserToken();
        requestCounter++;
        if (requestCounter < 2) {
          final res = await dio.get('/get-certificate');
          requestCounter = 0;
          return res.data['certificates'] as List == []
              ? []
              : CertificateModel.fromMaps(res.data['certificates']);
        }
      }
      showErrorSnackBar(errorMessage: e.response!.data);
      rethrow;
    }
  }
}
