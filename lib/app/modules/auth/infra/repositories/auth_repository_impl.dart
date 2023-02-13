import 'package:smile_front/app/shared/models/user_model.dart';

import '../../domain/repositories/auth_repository_interface.dart';
import '../datasource/auth_datasource_interface.dart';

class AuthRepositoryImpl extends AuthRepositoryInterface {
  final AuthDatasourceInterface datasource;

  AuthRepositoryImpl({required this.datasource});

  @override
  Future<UserModel> login(String user, String password) async {
    final response = await datasource.login(user, password);
    return Future.value(response);
  }

  @override
  Future<Map<String, dynamic>> refreshToken(String token) async {
    final response = await datasource.refreshToken(token);
    return Future.value(response);
  }
}
