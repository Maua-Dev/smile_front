import 'package:dio/dio.dart';
import 'package:smile_front/app/shared/entities/user.dart';
import 'package:smile_front/app/modules/logged-adm-home/infra/datasources/logged_user_datasource.dart';
import 'package:smile_front/app/shared/models/user_model.dart';

class LoggedAdmDatasourceImpl extends LoggedAdmDatasource {
  final Dio dioClient;

  LoggedAdmDatasourceImpl(this.dioClient);

  @override
  Future<User> getLoggedUser() async {
    final res = await dioClient.get('/user');
    return UserModel.fromMap(res.data);
  }
}
