import 'package:dio/dio.dart';
import 'package:smile_front/app/modules/logged-adm-home/infra/datasources/user_datasource.dart';
import 'package:smile_front/app/shared/models/user_model.dart';

class UserDatasourceImpl implements UserDatasource {
  final Dio dioClient;

  UserDatasourceImpl(this.dioClient);

  @override
  Future<UserModel> getLoggedUser(String cpfRne) async {
    try {
      final res = await dioClient.get('/smile_mss_users/user?cpfRne=$cpfRne');
      if (res.statusCode == 200) {
        return UserModel.fromMap(res.data);
      }
      throw Exception();
    } catch (e) {
      // ignore: avoid_print
      print('Não foi possível se conectar com o Microsserviço, erro: ' +
          e.toString());
      rethrow;
    }
  }
}
