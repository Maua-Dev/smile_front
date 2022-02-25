import 'package:smile_front/app/modules/auth/domain/repositories/access_level_repository_interface.dart';
import 'package:smile_front/app/modules/auth/infra/datasource/access_level_datasource_interface.dart';

class AccessLevelRepositoryImpl implements AccessLevelRepositoryInterface {
  final AccessLevelDatasourceInterface datasource;

  AccessLevelRepositoryImpl({required this.datasource});
  @override
  Future<String> getAccessLevel(String cpfRne) async {
    final result = await datasource.getAccessLevel(cpfRne);
    return result;
  }
}
