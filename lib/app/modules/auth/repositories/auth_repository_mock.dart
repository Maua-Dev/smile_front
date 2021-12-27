import 'package:smile_front/app/modules/auth/errors/errors.dart';

import 'auth_repository_interface.dart';

class AuthRepositoryMock implements IAuthRepository {
  final String _email = 'teste';
  final String _pw = 'teste';

  @override
  Future<String> loginWithEmail(String email, String password) async {
    if (password != _pw) {
      throw PasswordInvalid('Senha inválida');
    } else if (email != _email) {
      throw EmailInvalid('Email inválido');
    } else {
      return 'token12354';
    }
  }

  @override
  Future<String> refreshToken(String token) async {
    return 'newtoken';
  }
}
