import 'infra/access_level_enum.dart';
import 'infra/user_roles_enum.dart';

class User {
  final String email;
  final String name;
  final String? socialName;
  final String? ra;
  final UserRolesEnum role;
  final AccessLevelEnum accessLevel;
  final bool certificateWithSocialName;

  User({
    required this.name,
    this.ra,
    required this.certificateWithSocialName,
    required this.email,
    required this.accessLevel,
    required this.role,
    required this.socialName,
  });
}
