import 'package:dio/dio.dart';
import 'package:smile_front/app/shared/entities/user_registration.dart';
import '../../../shared/services/enviroment/enviroment_config.dart';
import '../infra/datasources/register_datasource.dart';
import 'errors/errors.dart';

class RegisterDatasourceImpl implements RegisterDatasource {
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
      final res = await dio.post('/user', data: {
        "access_level": "USER",
        "cpf_rne": userRegistration.cpfRne,
        "email": userRegistration.email,
        "name": userRegistration.name,
        "password": userRegistration.password,
        "ra": userRegistration.ra,
        "role": "STUDENT",
        "accepted_notifications": userRegistration.acceptEmails,
        "social_name": userRegistration.socialName,
        "accepted_terms": userRegistration.acceptTerms
      });
      if (res.statusCode == 200) {
        return 'Usuário criado com sucesso!';
      }
      throw Exception();
    } catch (e) {
      if (e.toString().contains('400')) {
        throw RegisterInvalid('Usuário já existente.');
      } else {
        throw RegisterInvalid('Falha ao realizar o cadastro, tente novamente.');
      }
    }
  }
}
