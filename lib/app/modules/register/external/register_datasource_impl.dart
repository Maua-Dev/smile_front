import 'package:dio/dio.dart';
import 'package:smile_front/app/shared/entities/user_registration.dart';
import 'package:smile_front/generated/l10n.dart';
import '../../../shared/services/environment/environment_config.dart';
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
      var res = await dio.post('/create-user', data: {
        "email": userRegistration.email,
        "name": userRegistration.name,
        "password": userRegistration.password,
        "role": userRegistration.role.name.toUpperCase(),
        "access_level": userRegistration.accessLevel.name.toUpperCase(),
        "accepted_terms": userRegistration.acceptTerms,
        "ra": userRegistration.ra,
        "accepted_notifications": userRegistration.acceptEmailNotifications,
        "certificate_with_social_name":
            userRegistration.certificateWithSocialName,
        "social_name": userRegistration.socialName,
        "phone": '+5511991273092',
      });
      if (res.statusCode == 201) {
        return 'Usuário criado com sucesso!';
      }
      throw Exception();
    } catch (e) {
      if (e.toString().contains('400')) {
        throw RegisterInvalid(S.current.errorUserAlreadyExist);
      } else {
        throw RegisterInvalid(S.current.errorRegister);
      }
    }
  }
}
