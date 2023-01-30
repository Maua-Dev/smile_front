import 'package:smile_front/app/shared/entities/responsible_professor.dart';

import '../entities/infra/user_roles_enum.dart';

class ResponsibleProfessorModel extends ResponsibleProfessor {
  ResponsibleProfessorModel(
      {required super.id, required super.name, required super.role});

  factory ResponsibleProfessorModel.fromMap(Map<String, dynamic> map) {
    return ResponsibleProfessorModel(
        id: map['id'],
        name: map['name'],
        role: UserRolesEnumExtension.stringToEnumMap(map['role']));
  }

  static List<ResponsibleProfessorModel> fromMaps(List array) {
    return array.map((e) => ResponsibleProfessorModel.fromMap(e)).toList();
  }
}
