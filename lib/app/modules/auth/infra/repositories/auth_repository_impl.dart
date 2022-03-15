import '../../domain/repositories/auth_repository_interface.dart';
import '../datasource/auth_datasource.dart';

class AuthRepositoryImpl extends AuthRepositoryInterface {
  final AuthDatasource datasource;

  AuthRepositoryImpl({required this.datasource});

  @override
  Future<Map<String, dynamic>> login(String user, String password) async {
    final response = datasource.login(user, password);
    return Future.value(response);
  }

  @override
  Future<Map<String, dynamic>> refreshToken(String token) {
    throw UnimplementedError();
  }

  @override
  Future<String> getAccessLevel(String user) {
    final response = datasource.getAccessLevel(user);
    return Future.value(response);
  }
}
