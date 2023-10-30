import 'package:smile_front/app/shared/domain/entities/user.dart';

class RegisterUserInformationsModel extends User {
  final String password;

  RegisterUserInformationsModel({
    required super.email,
    required super.accessLevel,
    required super.role,
    required super.socialName,
    required this.password,
    super.ra,
    required super.certificateWithSocialName,
    required super.name,
  });
}
