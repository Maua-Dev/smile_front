class UserChangeDataModel {
  final String name;
  final String socialName;
  final bool certificateWithSocialName;
  final bool acceptedEmailNotifications;

  UserChangeDataModel(
      {required this.acceptedEmailNotifications,
      required this.name,
      required this.socialName,
      required this.certificateWithSocialName});

  Map<String, dynamic> toJson() => {
        'name': name,
        'social_name': socialName == '' ? null : socialName,
        'certificate_with_social_name': certificateWithSocialName,
        'accepted_notifications_email': acceptedEmailNotifications
      };
}
