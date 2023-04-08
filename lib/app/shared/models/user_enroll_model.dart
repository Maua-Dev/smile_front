import '../entities/infra/user_roles_enum.dart';

class UserEnrollModel {
  final String name;
  final String userId;
  final String? email;
  final UserRolesEnum role;

  UserEnrollModel(
      {required this.name,
      required this.userId,
      required this.role,
      this.email});

  factory UserEnrollModel.fromMap(Map<String, dynamic> map) {
    return UserEnrollModel(
        name: map['name'],
        userId: map['user_id'],
        email: map['email'],
        role: UserRolesEnumExtension.stringToEnumMap(map['role']));
  }

  factory UserEnrollModel.newInstance() {
    return UserEnrollModel(name: '', userId: '', role: UserRolesEnum.STUDENT);
  }
}
