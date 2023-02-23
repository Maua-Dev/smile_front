import '../../domain/repository/forgot_password_datasource_interface.dart';
import '../datasources/forgot_password_datasource.dart';

class ForgotPasswordRepositoryImpl extends ForgotPasswordRepositoryInterface {
  final ForgotPasswordDatasourceInterface datasource;

  ForgotPasswordRepositoryImpl({required this.datasource});

  @override
  Future<String> forgotPassword(String username) {
    final response = datasource.forgotPassword(username);
    return Future.value(response);
  }

  @override
  Future<String> changePassword(String username, String password, String code) {
    final response = datasource.changePassword(username, password, code);
    return Future.value(response);
  }
}
