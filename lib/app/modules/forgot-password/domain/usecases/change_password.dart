import '../../domain/repository/forgot_password_datasource_interface.dart';

abstract class ChangePasswordInterface {
  Future<String> call(String username, String password, String code);
}

class ChangePassword implements ChangePasswordInterface {
  final ForgotPasswordRepositoryInterface repository;

  ChangePassword({required this.repository});

  @override
  Future<String> call(String username, String password, String code) async {
    return await repository.changePassword(username, password, code);
  }
}
