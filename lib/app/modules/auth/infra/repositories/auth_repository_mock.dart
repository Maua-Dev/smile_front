import 'package:smile_front/app/modules/auth/errors/errors.dart';

import '../../domain/repositories/auth_repository_interface.dart';

class AuthRepositoryMock implements AuthRepositoryInterface {
  final String _email = '30557126659';
  final String _pw = 'teste';

  final String _emailAdm = 'adm';
  final String _pwAdm = 'teste';

  @override
  Future<Map<String, dynamic>> loginWithEmail(
      String email, String password) async {
    if (password != _pw && password != _pwAdm) {
      throw PasswordInvalid('Senha inválida');
    } else if (email != _email && email != _emailAdm) {
      throw EmailInvalid('Email inválido');
    } else {
      if (email == _emailAdm && password == _pwAdm) {
        return {'token': 'token12354', 'accessLevel': 'ADMIN'};
      } else {
        return {'token': 'token43210', 'accessLevel': 'USER'};
      }
    }
  }

  @override
  Future<String> refreshToken(String token) async {
    return 'newtoken';
  }
}
