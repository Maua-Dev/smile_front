import 'package:dio/dio.dart';
import 'package:smile_front/app/shared/models/user_model.dart';
import 'package:smile_front/app/modules/logged-user-home/infra/datasources/logged_user_datasource.dart';

class LoggedUserDatasourceImpl extends LoggedUserDatasource {
  final Dio dioClient;

  LoggedUserDatasourceImpl(this.dioClient);

  @override
  Future<UserModel> getLoggedUser() async {
    final res = await dioClient.get('/user');
    return UserModel.fromMap(res.data);
  }
}
