import 'package:smile_front/app/modules/logged-adm-home/domain/repositories/user_repository_interface.dart';
import 'package:smile_front/app/modules/logged-adm-home/infra/datasources/user_datasource.dart';
import 'package:smile_front/app/shared/models/user_model.dart';

class UserRepositoryImpl implements UserRepositoryInteface {
  final UserDatasource datasource;

  UserRepositoryImpl(this.datasource);

  @override
  Future<UserModel> getUser(String cpfRne) async {
    final result = await datasource.getLoggedUser(cpfRne);
    return result;
  }
}
