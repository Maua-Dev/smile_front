import 'package:smile_front/app/modules/auth/domain/repositories/auth_repository_interface.dart';

abstract class LoginWithCpfRneInterface {
  Future<Map<String, dynamic>> call(String user, String password);
}

class LoginWithCpfRne implements LoginWithCpfRneInterface {
  final AuthRepositoryInterface authRepository;

  LoginWithCpfRne({required this.authRepository});

  @override
  Future<Map<String, dynamic>> call(String user, String password) {
    return authRepository.login(user, password);
  }
}
