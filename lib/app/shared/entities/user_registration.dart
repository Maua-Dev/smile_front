import 'package:smile_front/app/shared/entities/infra/user_roles_enum.dart';
import 'package:smile_front/app/shared/entities/user.dart';

import 'infra/access_level_enum.dart';

class UserRegistration extends User {
  final String password;
  final bool acceptTerms;
  final bool acceptEmailNotifications;
  final bool acceptSMSNotifications;

  UserRegistration({
    required super.name,
    required super.email,
    super.socialName,
    super.ra,
    required super.role,
    required super.accessLevel,
    required super.certificateWithSocialName,
    required super.phone,
    required this.password,
    required this.acceptTerms,
    required this.acceptEmailNotifications,
    required this.acceptSMSNotifications,
  });

  factory UserRegistration.newInstance() {
    return UserRegistration(
      name: '',
      email: '',
      socialName: null,
      ra: null,
      role: UserRolesEnum.STUDENT,
      accessLevel: AccessLevelEnum.USER,
      certificateWithSocialName: false,
      phone: '',
      password: '',
      acceptTerms: true,
      acceptEmailNotifications: false,
      acceptSMSNotifications: false,
    );
  }
}
