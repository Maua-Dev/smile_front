import 'package:smile_front/app/shared/entities/user.dart';
import 'package:smile_front/app/modules/logged-adm-home/domain/repositories/logged_adm_repository.dart';
import 'package:smile_front/app/modules/logged-adm-home/infra/datasources/logged_user_datasource.dart';

class LoggedAdmRepositoryImpl implements LoggedAdmRepository {
  final LoggedAdmDatasource datasource;

  LoggedAdmRepositoryImpl({required this.datasource});

  @override
  Future<User> getLoggedUser() {
    final result = datasource.getLoggedUser();
    return Future.value(result);
  }
}
