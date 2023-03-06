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

  Map<String, dynamic> toJson() => {
        "email": email,
        "name": name,
        "password": password,
        "role": role.name.toUpperCase(),
        "access_level": accessLevel.name.toUpperCase(),
        "accepted_terms": acceptTerms,
        "ra": ra == '' ? null : ra,
        "accepted_notifications_email": acceptEmailNotifications,
        "accepted_notifications_sms": acceptSMSNotifications,
        "certificate_with_social_name": certificateWithSocialName,
        "social_name": socialName == '' ? null : socialName,
        "phone": phone == '' ? null : phone,
      };
}
