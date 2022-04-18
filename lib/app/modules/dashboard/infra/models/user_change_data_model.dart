class UserChangeDataModel {
  final String name;
  final String socialName;
  final bool certificateWithSocialName;

  UserChangeDataModel(
      {required this.name,
      required this.socialName,
      required this.certificateWithSocialName});

  Map<String, dynamic> toJson() => {
        'name': name,
        'social_name': socialName,
        'certificate_with_social_name': certificateWithSocialName
      };
}
