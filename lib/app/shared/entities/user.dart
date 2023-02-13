import 'infra/access_level_enum.dart';
import 'infra/user_roles_enum.dart';

class User {
  final String email;
  final String name;
  final String? socialName;
  final String? ra;
  final UserRolesEnum typeRole;
  final AccessLevelEnum accessLevel;
  final bool certificateWithSocialName;
  final String phone;

  User({
    required this.name,
    this.ra,
    required this.certificateWithSocialName,
    required this.phone,
    required this.email,
    required this.accessLevel,
    required this.typeRole,
    required this.socialName,
  });
}
