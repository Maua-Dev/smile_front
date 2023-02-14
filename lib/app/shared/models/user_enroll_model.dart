import '../entities/infra/user_roles_enum.dart';

class UserEnrollModel {
  final String name;
  final String userId;
  final UserRolesEnum role;

  UserEnrollModel(
      {required this.name, required this.userId, required this.role});

  factory UserEnrollModel.fromMap(Map<String, dynamic> map) {
    return UserEnrollModel(
        name: map['name'],
        userId: map['user_id'],
        role: UserRolesEnumExtension.stringToEnumMap(map['role']));
  }
}
