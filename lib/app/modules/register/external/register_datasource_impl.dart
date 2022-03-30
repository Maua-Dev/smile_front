import 'package:dio/dio.dart';
import 'package:smile_front/app/shared/entities/user_registration.dart';
import '../infra/datasources/register_datasource.dart';
import 'errors/errors.dart';

class RegisterDatasourceImpl implements RegisterDatasource {
  final Dio dioClient;

  RegisterDatasourceImpl({required this.dioClient});

  @override
  Future<String> registerUser(UserRegistration userRegistration) async {
    var uri =
        "https://b574ab6867.execute-api.sa-east-1.amazonaws.com/dev/smile-mss-cognito";
    BaseOptions options = BaseOptions(
      baseUrl: uri,
      responseType: ResponseType.json,
      connectTimeout: 30000,
      receiveTimeout: 30000,
    );
    Dio dio = Dio(options);
    try {
      final res = await dio.post('/user', data: {
        "name": userRegistration.name,
        "social_name": userRegistration.socialName,
        "cpf_rne": userRegistration.cpfRne,
        "ra": userRegistration.ra,
        "role": "STUDENT",
        "access_level": "USER",
        "email": userRegistration.email,
        "password": userRegistration.password
      });
      if (res.statusCode == 200) {
        return 'Usuário criado com sucesso!';
      }
      throw Exception();
    } catch (e) {
      throw RegisterInvalid('Falha ao realizar o cadastro, tente novamente.');
    }
  }
}
