import 'package:smile_front/app/shared/entities/responsible_professor.dart';

import '../entities/infra/user_roles_enum.dart';

class ResponsibleProfessorModel extends ResponsibleProfessor {
  ResponsibleProfessorModel(
      {required super.id, required super.name, super.role});

  factory ResponsibleProfessorModel.fromMap(Map<String, dynamic> map) {
    return ResponsibleProfessorModel(
        id: map['user_id'],
        name: map['name'],
        role: UserRolesEnumExtension.stringToEnumMap(map['role']));
  }

  static List<ResponsibleProfessorModel> fromMaps(List array) {
    return array.map((e) => ResponsibleProfessorModel.fromMap(e)).toList();
  }

  factory ResponsibleProfessorModel.newInstance() {
    return ResponsibleProfessorModel(name: '', id: '', role: null);
  }
}
