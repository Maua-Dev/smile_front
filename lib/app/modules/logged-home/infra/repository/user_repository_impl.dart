import 'package:smile_front/app/modules/logged-home/domain/repositories/user_repository_interface.dart';
import 'package:smile_front/app/modules/logged-home/infra/datasources/user_datasource.dart';
import 'package:smile_front/app/shared/models/user_model.dart';

class UserRepositoryImpl implements UserRepositoryInterface {
  final UserDatasource datasource;

  UserRepositoryImpl({required this.datasource});

  @override
  Future<UserModel> getUser(String cpfRne) async {
    final result = await datasource.getLoggedUser(cpfRne);
    return result;
  }
}
