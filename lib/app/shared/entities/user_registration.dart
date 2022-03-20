class UserRegistration {
  final String name;
  final String email;
  final String cpfRne;
  final int? ra;
  final String password;

  UserRegistration(
      {required this.name,
      required this.email,
      required this.cpfRne,
      this.ra,
      required this.password});

  factory UserRegistration.newInstance() {
    return UserRegistration(
      name: '',
      email: '',
      cpfRne: '',
      ra: null,
      password: '',
    );
  }
}
