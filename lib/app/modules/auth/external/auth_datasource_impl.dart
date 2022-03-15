import 'package:dio/dio.dart';

import '../../../shared/models/user_model.dart';
import '../errors/errors.dart';
import '../infra/datasource/auth_datasource.dart';

class AuthDatasourceImpl implements AuthDatasource {
  final Dio dioClient;

  AuthDatasourceImpl({required this.dioClient});
  @override
  Future<String> getAccessLevel(cpfRne) async {
    try {
      final res = await dioClient.get(
        '/user/$cpfRne',
      );
      if (res.statusCode == 200) {
        var user = UserModel.fromMap(res.data);
        return user.accessLevel;
      }
      throw Exception();
    } catch (e) {
      print('Não foi possível se conectar com o Microsserviço, erro: ' +
          e.toString());
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> login(cpfRne, password) async {
    try {
      final res = await dioClient.post('/login', data: {
        'login': cpfRne,
        'password': password,
      });
      if (res.statusCode == 200) {
        var response = res.data;
        return response;
      }
      throw Exception();
    } catch (e) {
      // ignore: avoid_print
      throw LoginInvalid('Login ou Senha inválida');
    }
  }

  @override
  Future<String> refreshToken(String token) async {
    try {
      final res = await dioClient.get(
        '/refreshToken',
        options: Options(
          headers: {
            Headers.wwwAuthenticateHeader: token,
          },
        ),
      );
      if (res.statusCode == 200) {
        var tokens = res.data;
        return tokens;
      }
      throw Exception();
    } catch (e) {
      print('Não foi possível se conectar com o Microsserviço, erro: ' +
          e.toString());
      rethrow;
    }
  }
}
