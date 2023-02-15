import 'package:smile_front/app/modules/auth/domain/repositories/auth_repository_interface.dart';

import '../../../../shared/models/user_model.dart';

abstract class LoginWithEmailInterface {
  Future<UserModel> call(String user, String password);
}

class LoginWithEmail implements LoginWithEmailInterface {
  final AuthRepositoryInterface authRepository;

  LoginWithEmail({required this.authRepository});

  @override
  Future<UserModel> call(String user, String password) async {
    return await authRepository.login(user, password);
  }
}
