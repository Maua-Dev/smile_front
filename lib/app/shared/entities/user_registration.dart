import 'package:smile_front/app/shared/entities/infra/user_roles_enum.dart';
import 'package:smile_front/app/shared/entities/user.dart';

import 'infra/access_level_enum.dart';

class UserRegistration extends User {
  final String password;
  final bool acceptTerms;
  final bool acceptEmailNotifications;
  final bool acceptSMSNotifications;
  final bool acceptWPPNotifications;
  final bool acceptAPPWEBNotifications;

  UserRegistration({
    required super.name,
    required super.email,
    super.socialName,
    super.ra,
    required super.typeRole,
    required super.accessLevel,
    required super.certificateWithSocialName,
    required super.phone,
    required this.password,
    required this.acceptTerms,
    required this.acceptEmailNotifications,
    required this.acceptSMSNotifications,
    required this.acceptWPPNotifications,
    required this.acceptAPPWEBNotifications,
  });

  factory UserRegistration.newInstance() {
    return UserRegistration(
      name: '',
      email: '',
      socialName: null,
      ra: null,
      typeRole: UserRolesEnum.student,
      accessLevel: AccessLevelEnum.USER,
      certificateWithSocialName: false,
      phone: '',
      password: '',
      acceptTerms: true,
      acceptEmailNotifications: false,
      acceptSMSNotifications: false,
      acceptWPPNotifications: false,
      acceptAPPWEBNotifications: false,
    );
  }
}
