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
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> login(cpfRne, password) async {
    var uri =
        "https://b574ab6867.execute-api.sa-east-1.amazonaws.com/dev/smile-mss-cognito";
    BaseOptions options = BaseOptions(
      baseUrl: uri,
      responseType: ResponseType.json,
      connectTimeout: 30000,
      receiveTimeout: 30000,
    );
    Dio dio = Dio(options);
    try {
      final res = await dio.post('/login', data: {
        'login': cpfRne,
        'password': password,
      });
      if (res.statusCode == 200) {
        var response = res.data;
        return response;
      }
      throw Exception();
    } catch (e) {
      throw LoginInvalid('Login ou Senha inválida');
    }
  }

  @override
  Future<Map<String, dynamic>> refreshToken(String token) async {
    try {
      var uri =
          "https://b574ab6867.execute-api.sa-east-1.amazonaws.com/dev/smile-mss-cognito";
      BaseOptions options = BaseOptions(
        baseUrl: uri,
        responseType: ResponseType.json,
        connectTimeout: 30000,
        receiveTimeout: 30000,
      );
      Dio dio = Dio(options);
      dio.options.headers["authorization"] = "Bearer $token";
      final res = await dio.get("/refreshToken");
      if (res.statusCode == 200) {
        var tokens = res.data;
        return tokens;
      }
      throw Exception();
    } catch (e) {
      rethrow;
    }
  }
}
