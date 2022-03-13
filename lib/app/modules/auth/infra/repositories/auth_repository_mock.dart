import 'package:smile_front/app/modules/auth/errors/errors.dart';

import '../../domain/repositories/auth_repository_interface.dart';

class AuthRepositoryMock implements AuthRepositoryInterface {
  final String _cpfRne = '30557126659';
  final String _pw = 'user';

  final String _cpfRneAdm = 'adm';
  final String _pwAdm = 'adm';

  @override
  Future<Map<String, dynamic>> login(String cpfRne, String password) async {
    if (password != _pw && password != _pwAdm) {
      throw PasswordInvalid('Senha inválida');
    } else if (cpfRne != _cpfRne && cpfRne != _cpfRneAdm) {
      throw EmailInvalid('Email inválido');
    } else {
      if (cpfRne == _cpfRneAdm && password == _pwAdm) {
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

  @override
  Future<String> getAccessLevel(String user) {
    throw UnimplementedError();
  }
}
