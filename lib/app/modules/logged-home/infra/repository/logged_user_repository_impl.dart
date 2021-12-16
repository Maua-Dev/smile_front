import 'package:smile_front/app/modules/logged-home/domain/entities/logged_user.dart';
import 'package:smile_front/app/modules/logged-home/domain/repositories/logged_user_repository.dart';
import 'package:smile_front/app/modules/logged-home/infra/datasources/logged_user_datasource.dart';

class LoggedUserRepositoryImpl implements LoggedUserRepository {
  final LoggedUserDatasource datasource;

  LoggedUserRepositoryImpl({required this.datasource});

  @override
  Future<LoggedUser> getLoggedUser() {
    final result = datasource.getLoggedUser();
    return Future.value(result);
  }
}
