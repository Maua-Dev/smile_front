import 'package:dio/dio.dart';
import 'package:smile_front/app/modules/logged-adm-home/domain/entities/logged_user.dart';
import 'package:smile_front/app/modules/logged-adm-home/infra/datasources/logged_user_datasource.dart';

class LoggedAdmDatasourceImpl extends LoggedAdmDatasource {
  final Dio dioClient;

  LoggedAdmDatasourceImpl(this.dioClient);

  @override
  Future<LoggedUser> getLoggedUser() async {
    final res = await dioClient.get('/user');
    return LoggedUser.fromJson(res.data);
  }
}
