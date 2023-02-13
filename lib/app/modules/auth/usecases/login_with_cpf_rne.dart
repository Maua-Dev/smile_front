import 'package:smile_front/app/modules/auth/domain/repositories/auth_repository_interface.dart';

import '../../../shared/models/user_model.dart';

abstract class LoginWithCpfRneInterface {
  Future<UserModel> call(String user, String password);
}

class LoginWithCpfRne implements LoginWithCpfRneInterface {
  final AuthRepositoryInterface authRepository;

  LoginWithCpfRne({required this.authRepository});

  @override
  Future<UserModel> call(String user, String password) async {
    return await authRepository.login(user, password);
  }
}
