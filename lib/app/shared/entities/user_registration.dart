class UserRegistration {
  final String name;
  final String? socialName;
  final String email;
  final String cpfRne;
  final int? ra;
  final String password;
  final bool acceptEmails;
  final bool acceptTerms;

  UserRegistration({
    required this.name,
    this.socialName,
    required this.email,
    required this.cpfRne,
    this.ra,
    required this.password,
    required this.acceptEmails,
    required this.acceptTerms,
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
        acceptTerms: true);
  }
}
