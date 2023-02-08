import 'infra/user_roles_enum.dart';

class ResponsibleProfessor {
  final String id;
  final String name;
  final UserRolesEnum? role;

  ResponsibleProfessor(
      {required this.id, required this.name, required this.role});
}
