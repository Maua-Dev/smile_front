class UserRegistration {
  final String name;
  final String? socialName;
  final String email;
  final String cpfRne;
  final int? ra;
  final String password;
  final bool acceptEmails;
  final bool acceptTerms;
  final bool acceptEmailNotifications;
  final bool acceptSMSNotifications;
  final bool acceptWPPNotifications;
  final bool acceptAPPWEBNotifications;
  final String phoneNumber;

  UserRegistration({
    required this.phoneNumber,
    required this.name,
    this.socialName,
    required this.email,
    required this.cpfRne,
    this.ra,
    required this.password,
    required this.acceptEmails,
    required this.acceptTerms,
    required this.acceptEmailNotifications,
    required this.acceptSMSNotifications,
    required this.acceptWPPNotifications,
    required this.acceptAPPWEBNotifications,
  });

  factory UserRegistration.newInstance() {
    return UserRegistration(
      name: '',
      socialName: '',
      email: '',
      cpfRne: '',
      ra: null,
      password: '',
      acceptEmails: true,
      acceptTerms: true,
      phoneNumber: '',
      acceptEmailNotifications : false,
      acceptSMSNotifications : false,
      acceptWPPNotifications : false,
      acceptAPPWEBNotifications : false,
    );
  }
}
