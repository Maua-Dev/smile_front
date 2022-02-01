import 'package:dio/dio.dart';
import 'package:smile_front/app/modules/logged-home/domain/entities/logged_user.dart';
import 'package:smile_front/app/modules/logged-home/infra/datasources/logged_user_datasource.dart';

class LoggedUserDatasourceImpl extends LoggedUserDatasource {
  final Dio dioClient;

  LoggedUserDatasourceImpl(this.dioClient);

  @override
  Future<LoggedUser> getLoggedUser() async {
    final res = await dioClient.get('/user');
    return LoggedUser.fromJson(res.data);
  }
}
