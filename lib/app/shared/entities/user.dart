class User {
  final String socialName;
  final String email;
  final String cpfRne;
  final String? registration;
  final String accessLevel;
  final String typeRole;

  User(
      {required this.email,
      required this.cpfRne,
      this.registration,
      required this.accessLevel,
      required this.typeRole,
      required this.socialName});

  factory User.newInstance() {
    return User(
        socialName: '',
        accessLevel: '',
        cpfRne: '',
        email: '',
        typeRole: '',
        registration: '');
  }
}
