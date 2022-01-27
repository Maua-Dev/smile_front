class RegisterInformations {
  final String socialName;
  final String email;
  final String cpfRne;
  final bool isStudent;
  final String? ra;
  final int accessLevel;

  RegisterInformations(
      {required this.socialName,
      required this.email,
      required this.cpfRne,
      required this.isStudent,
      this.ra,
      required this.accessLevel});

  factory RegisterInformations.newInstance() {
    return RegisterInformations(
      socialName: '',
      email: '',
      cpfRne: '',
      isStudent: false,
      ra: '',
      accessLevel: 2,
    );
  }
}
