// ignore_for_file: overridden_fields, annotate_overrides, duplicate_ignore

import 'package:smile_front/app/shared/entities/user.dart';

class UserModel extends User {
  final String socialName;
  final String email;
  final String cpfRne;
  final String? registration;
  final String accessLevel;
  final String typeRole;

  UserModel(
      {required this.email,
      required this.cpfRne,
      this.registration,
      required this.accessLevel,
      required this.typeRole,
      required this.socialName})
      : super(
            socialName: socialName,
            accessLevel: accessLevel,
            cpfRne: cpfRne,
            email: email,
            typeRole: typeRole,
            registration: registration);

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
