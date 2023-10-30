import 'package:dio/dio.dart';
import 'package:smile_front/app/shared/entities/user_registration.dart';
import '../../../shared/helpers/environment/environment_config.dart';
import '../infra/datasources/register_datasource_interface.dart';
import 'errors/errors.dart';

class RegisterDatasourceImpl implements RegisterDatasourceInterface {
  final Dio dioClient;

  RegisterDatasourceImpl({required this.dioClient});

  @override
  Future<String> registerUser(UserRegistration userRegistration) async {
    BaseOptions options = BaseOptions(
      baseUrl: EnvironmentConfig.MSS_USER_BASE_URL,
      responseType: ResponseType.json,
      connectTimeout: 30000,
      receiveTimeout: 30000,
    );
    Dio dio = Dio(options);
    try {
      var res = await dio.post('/create-user', data: userRegistration.toJson());
      if (res.statusCode == 201) {
        return 'Usuário criado com sucesso!';
      }
      throw Exception();
    } on DioError catch (e) {
      throw RegisterInvalid(e.response!.data);
    }
  }
}
