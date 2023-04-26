import 'package:smile_front/app/shared/models/responsible_professor_model.dart';

import '../../infra/models/user_change_data_model.dart';

abstract class UserRepositoryInterface {
  Future changeData(UserChangeDataModel userChangeDataModel);
  Future<List<ResponsibleProfessorModel>> getResponsibleProfessors();
  Future deleteUser(String code);
}
