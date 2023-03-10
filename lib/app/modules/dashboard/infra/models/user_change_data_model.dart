class UserChangeDataModel {
  final String name;
  final String socialName;
  final bool certificateWithSocialName;
  final bool acceptedNotifications;
  final String phone;

  UserChangeDataModel(
      {required this.phone,
      required this.acceptedNotifications,
      required this.name,
      required this.socialName,
      required this.certificateWithSocialName});

  Map<String, dynamic> toJson() => {
        'name': name,
        'social_name': socialName == '' ? null : socialName,
        'certificate_with_social_name': certificateWithSocialName,
        'phone': phone == '' ? null : phone,
        'accepted_notifications': acceptedNotifications
      };
}
