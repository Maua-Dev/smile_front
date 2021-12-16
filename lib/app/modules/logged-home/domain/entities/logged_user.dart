class LoggedUser {
  final String name;

  LoggedUser({required this.name});

  factory LoggedUser.newInstance() {
    return LoggedUser(name: '');
  }
}
