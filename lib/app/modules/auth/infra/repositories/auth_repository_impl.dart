import '../../domain/repositories/auth_repository_interface.dart';
import '../datasource/auth_datasource_interface.dart';

class AuthRepositoryImpl extends AuthRepositoryInterface {
  final AuthDatasourceInterface datasource;

  AuthRepositoryImpl({required this.datasource});

  @override
  Future<Map<String, dynamic>> login(String user, String password) async {
    final response = await datasource.login(user, password);
    return Future.value(response);
  }

  @override
  Future<Map<String, dynamic>> refreshToken(String token) async {
    final response = await datasource.refreshToken(token);
    return Future.value(response);
  }

  @override
  Future<String> getAccessLevel(String user) async {
    final response = await datasource.getAccessLevel(user);
    return Future.value(response);
  }
}
