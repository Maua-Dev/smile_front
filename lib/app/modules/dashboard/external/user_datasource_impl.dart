// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/dashboard/infra/datasources/user_datasource_interface.dart';
import 'package:smile_front/app/modules/dashboard/infra/models/user_change_data_model.dart';

import '../../../shared/error/dio_exceptions.dart';
import '../../../shared/error/error_snackbar.dart';
import '../../../shared/models/responsible_professor_model.dart';
import '../../../shared/services/environment/environment_config.dart';
import '../../auth/domain/repositories/secure_storage_interface.dart';
import '../../auth/presenter/controllers/auth_controller.dart';

class UserDatasourceImpl extends UserDatasourceInterface {
  final SecureStorageInterface storage;

  var authController = Modular.get<AuthController>();
  BaseOptions options = BaseOptions(
    baseUrl: EnvironmentConfig.MSS_USER_BASE_URL,
    responseType: ResponseType.json,
    connectTimeout: 30000,
    receiveTimeout: 30000,
  );
  Dio dio = Dio();
  UserDatasourceImpl({required this.storage}) {
    dio = Dio(options);
  }

  @override
  Future putUser(UserChangeDataModel userChangeDataModel) async {
    var token = await storage.getAccessToken();
    try {
      dio.options.headers["authorization"] = "Bearer $token";
      await dio.put('/user', data: userChangeDataModel.toJson());
    } on Exception catch (e) {
      print(
          'Não foi possível se conectar com o Microsserviço na rota /user, erro: $e');
    }
  }

  @override
  Future<List<ResponsibleProfessorModel>> getResponsibleProfessors() async {
    var token = await storage.getAccessToken();
    try {
      final res = await dio.get('/list-professors');
      if (res.statusCode == 200) {
        return ResponsibleProfessorModel.fromMaps(res.data['professors']);
      }
      throw Exception();
    } on DioError catch (e) {
      if (e.response.toString().contains('Authentication Error')) {
        await authController.refreshToken(token.toString());
        await getResponsibleProfessors();
      }
      final errorMessage = DioExceptions.fromDioError(e).toString();
      showErrorSnackBar(errorMessage: errorMessage);
      rethrow;
    }
  }
}
