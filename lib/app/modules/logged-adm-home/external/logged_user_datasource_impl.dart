import 'package:dio/dio.dart';
import 'package:smile_front/app/modules/logged-adm-home/domain/entities/logged_user.dart';
import 'package:smile_front/app/modules/logged-adm-home/infra/datasources/logged_user_datasource.dart';
import 'package:smile_front/app/modules/logged-adm-home/infra/models/logged_user_model.dart';

class LoggedAdmDatasourceImpl extends LoggedAdmDatasource {
  final Dio dioClient;

  LoggedAdmDatasourceImpl(this.dioClient);

  @override
  Future<LoggedUser> getLoggedUser() async {
    final res = await dioClient.get('/user');
    return LoggedUserModel.fromJson(res.data);
  }
}
