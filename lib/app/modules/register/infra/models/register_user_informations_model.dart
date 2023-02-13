import 'package:smile_front/app/shared/entities/user.dart';

class RegisterUserInformationsModel extends User {
  final String password;

  RegisterUserInformationsModel({
    required super.email,
    required super.accessLevel,
    required super.typeRole,
    required super.socialName,
    required this.password,
    super.ra,
    required super.certificateWithSocialName,
    required super.name,
    required super.phone,
  });
}
