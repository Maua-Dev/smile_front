import 'package:smile_front/app/modules/dashboard/domain/repositories/user_repository_interface.dart';
import 'package:smile_front/app/modules/dashboard/infra/datasources/user_datasource_interface.dart';
import 'package:smile_front/app/modules/dashboard/infra/models/user_change_data_model.dart';
import 'package:smile_front/app/shared/infra/models/responsible_professor_model.dart';

class UserRepositoryImpl extends UserRepositoryInterface {
  final UserDatasourceInterface datasource;

  List<ResponsibleProfessorModel> responsibleProfessorsList = List.empty();

  UserRepositoryImpl({required this.datasource});

  @override
  Future changeData(UserChangeDataModel userChangeDataModel) async {
    await datasource.putUser(userChangeDataModel);
  }

  @override
  Future<List<ResponsibleProfessorModel>> getResponsibleProfessors() async {
    if (responsibleProfessorsList.isEmpty) {
      responsibleProfessorsList = await datasource.getResponsibleProfessors();
    }
    return Future.value(responsibleProfessorsList);
  }
}
