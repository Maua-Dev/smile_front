import 'package:smile_front/app/shared/entities/user.dart';

class UserModel extends User {
  final String userId;
  final String accessToken;
  final String refreshToken;
  final String idToken;
  UserModel({
    required this.accessToken,
    required this.refreshToken,
    required this.idToken,
    required super.name,
    required super.email,
    required super.accessLevel,
    required super.typeRole,
    super.socialName,
    required super.certificateWithSocialName,
    super.ra,
    required super.phone,
    required this.userId,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      socialName: map['socialName'],
      accessLevel: map['accessLevel'],
      email: map['email'],
      typeRole: map['typeRole'],
      name: map['name'],
      accessToken: map['access_token'],
      idToken: map['id_token'],
      phone: map['phone'],
      refreshToken: map['refresh_token'],
      userId: map['user_id'],
      ra: map['ra'],
      certificateWithSocialName: map['certificate_with_social_name'],
    );
  }
}
