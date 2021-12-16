import 'package:smile_front/app/modules/logged-home/domain/entities/logged_user.dart';
import 'package:smile_front/app/modules/logged-home/infra/datasources/logged_user_datasource.dart';
import 'package:smile_front/app/modules/logged-home/utils/mocks/logged_user_mock.dart';

class LoggedUserDatasourceImpl extends LoggedUserDatasource {
  @override
  Future<LoggedUser> getLoggedUser() {
    return Future.value(loggedUserMock);
    // aplicação do DIO
  }
}
