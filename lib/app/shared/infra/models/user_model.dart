import 'package:smile_front/app/shared/domain/enum/access_level_enum.dart';
import 'package:smile_front/app/shared/domain/enum/user_roles_enum.dart';
import 'package:smile_front/app/shared/domain/entities/user.dart';

class UserModel extends User {
  final String userId;
  final String accessToken;
  final String refreshToken;
  final String idToken;
  final bool acceptEmailNotifications;
  UserModel({
    required this.accessToken,
    required this.refreshToken,
    required this.idToken,
    required super.name,
    required super.email,
    required super.accessLevel,
    required super.role,
    super.socialName,
    required super.certificateWithSocialName,
    super.ra,
    required this.userId,
    required this.acceptEmailNotifications,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      socialName: map['social_name'],
      accessLevel:
          AccessLevelEnumExtension.stringToEnumMap(map['access_level']),
      email: map['email'],
      role: UserRolesEnumExtension.stringToEnumMap(map['role']),
      acceptEmailNotifications: map['accepted_notifications_email'],
      name: map['name'],
      accessToken: map['access_token'],
      idToken: map['id_token'],
      refreshToken: map['refresh_token'],
      userId: map['user_id'],
      ra: map['ra'],
      certificateWithSocialName: map['certificate_with_social_name'],
    );
  }
}
