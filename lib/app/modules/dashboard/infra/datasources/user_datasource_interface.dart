import 'package:smile_front/app/shared/infra/models/responsible_professor_model.dart';

import '../models/user_change_data_model.dart';

abstract class UserDatasourceInterface {
  Future putUser(UserChangeDataModel userChangeDataModel);
  Future<List<ResponsibleProfessorModel>> getResponsibleProfessors();
}
