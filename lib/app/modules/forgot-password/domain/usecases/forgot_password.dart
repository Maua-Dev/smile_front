import '../../domain/repository/forgot_password_datasource_interface.dart';

abstract class ForgotPasswordInterface {
  Future<String> call(String username);
}

class ForgotPassword implements ForgotPasswordInterface {
  final ForgotPasswordRepositoryInterface repository;

  ForgotPassword({required this.repository});

  @override
  Future<String> call(String username) async {
    return await repository.forgotPassword(username);
  }
}
