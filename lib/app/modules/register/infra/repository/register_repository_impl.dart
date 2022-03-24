import 'package:smile_front/app/modules/register/infra/datasources/register_datasource.dart';
import '../../../../shared/entities/user_registration.dart';
import '../../domain/repositories/register_informations_repository_interface.dart';

class RegisterRepositoryImpl extends RegisterRepositoryInterface {
  final RegisterDatasource datasource;

  RegisterRepositoryImpl({required this.datasource});

  @override
  Future<String> registerUser(UserRegistration userRegistration) async {
    final response = datasource.registerUser(userRegistration);
    return Future.value(response);
  }
}
