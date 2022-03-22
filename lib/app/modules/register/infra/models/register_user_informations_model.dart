// ignore_for_file: overridden_fields, annotate_overrides, duplicate_ignore

import 'package:smile_front/app/shared/entities/user.dart';

class RegisterUserInformationsModel extends User {
  final String socialName;
  final String email;
  final String cpfRne;
  final String? registration;
  final String accessLevel;
  final String typeRole;

  final String password;
  final int? ra;

  RegisterUserInformationsModel(
      {required this.email,
      required this.cpfRne,
      this.registration,
      required this.accessLevel,
      required this.typeRole,
      required this.socialName,
      required this.password,
      this.ra,
      })
      : super(
            socialName: socialName,
            accessLevel: accessLevel,
            cpfRne: cpfRne,
            email: email,
            typeRole: typeRole,
            registration: registration);

  factory RegisterUserInformationsModel.fromMap(Map<String, dynamic> map) {
    return RegisterUserInformationsModel(
      socialName: map['socialName'],
      accessLevel: map['accessLevel'],
      cpfRne: map['cpfRne'],
      email: map['email'],
      typeRole: map['typeRole'],
      registration: map['registration'], 
      password: map['password'],
    );
  }

  factory RegisterUserInformationsModel.newInstance() {
    return RegisterUserInformationsModel(
      accessLevel: '',
      cpfRne: '',
      email: '',
      socialName: '',
      typeRole: '',
      registration: '', 
      password: '',
      ra: null,
    );
  }
}
