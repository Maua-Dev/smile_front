import 'package:dio/dio.dart';
import 'package:smile_front/app/modules/auth/infra/datasource/access_level_datasource_interface.dart';

import '../../../shared/models/user_model.dart';

class AccessLevelDatasourceImpl implements AccessLevelDatasourceInterface {
  final Dio dioClient;

  AccessLevelDatasourceImpl({required this.dioClient});
  @override
  Future<String> getAccessLevel(cpfRne) async {
    try {
      final res = await dioClient.get(
        '/smile_mss_users/user?cpfRne=$cpfRne',
      );
      if (res.statusCode == 200) {
        var user = UserModel.fromMap(res.data);
        return user.accessLevel;
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
