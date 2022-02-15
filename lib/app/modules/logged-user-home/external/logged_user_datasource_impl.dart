import 'package:dio/dio.dart';
import 'package:smile_front/app/modules/logged-adm-home/infra/models/logged_user_model.dart';
import 'package:smile_front/app/modules/logged-user-home/infra/datasources/logged_user_datasource.dart';

class LoggedUserDatasourceImpl extends LoggedUserDatasource {
  final Dio dioClient;

  LoggedUserDatasourceImpl(this.dioClient);

  @override
  Future<LoggedUserModel> getLoggedUser() async {
    final res = await dioClient.get('/user');
    return LoggedUserModel.fromJson(res.data);
  }
}
