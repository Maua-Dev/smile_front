import 'package:smile_front/app/shared/entities/infra/user_roles_enum.dart';
import 'package:smile_front/app/shared/entities/user.dart';

import 'infra/access_level_enum.dart';

class UserRegistration extends User {
  final String password;
  final bool acceptTerms;
  final bool acceptEmailNotifications;

  UserRegistration({
    required super.name,
    required super.email,
    super.socialName,
    super.ra,
    required super.role,
    required super.accessLevel,
    required super.certificateWithSocialName,
    required this.password,
    required this.acceptTerms,
    required this.acceptEmailNotifications,
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
      password: '',
      acceptTerms: true,
      acceptEmailNotifications: false,
    );
  }

  Map<String, dynamic> toJson() => {
        "email": email,
        "name": name,
        "password": password,
        "role": role.name.toUpperCase(),
        "access_level": accessLevel.name.toUpperCase(),
        "accepted_terms": acceptTerms,
        "ra": ra == '' ? null : ra,
        "accepted_notifications_email": acceptEmailNotifications,
        "certificate_with_social_name": certificateWithSocialName,
        "social_name": socialName == '' ? null : socialName,
      };
}
