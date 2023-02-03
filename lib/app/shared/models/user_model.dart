import 'package:smile_front/app/shared/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.email,
    required super.cpfRne,
    super.registration,
    required super.accessLevel,
    required super.typeRole,
    required super.socialName,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      socialName: map['socialName'],
      accessLevel: map['accessLevel'],
      cpfRne: map['cpfRne'],
      email: map['email'],
      typeRole: map['typeRole'],
      registration: map['registration'],
    );
  }

  factory UserModel.newInstance() {
    return UserModel(
      accessLevel: '',
      cpfRne: '',
      email: '',
      socialName: '',
      typeRole: '',
      registration: '',
    );
  }
}
