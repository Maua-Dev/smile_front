// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:smile_front/app/modules/dashboard/infra/datasources/user_datasource_interface.dart';
import 'package:smile_front/app/modules/dashboard/infra/models/user_change_data_model.dart';

import '../../../shared/services/enviroment/enviroment_config.dart';
import '../../auth/domain/repositories/secure_storage_interface.dart';

class UserDatasourceImpl extends UserDatasourceInterface {
  final SecureStorageInterface storage;

  UserDatasourceImpl({required this.storage});

  @override
  Future putUser(UserChangeDataModel userChangeDataModel) async {
    var token = await storage.getAccessToken();
    try {
      BaseOptions options = BaseOptions(
        baseUrl: EnvironmentConfig.MSS_USER_BASE_URL,
        responseType: ResponseType.json,
        connectTimeout: 30000,
        receiveTimeout: 30000,
      );
      Dio dio = Dio(options);
      dio.options.headers["authorization"] = "Bearer $token";
      await dio.put('/user', data: userChangeDataModel.toJson());
    } on Exception catch (e) {
      print(
          'Não foi possível se conectar com o Microsserviço na rota /user, erro: $e');
    }
  }
}
