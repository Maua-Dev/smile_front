class LoggedUser {
  final String name;

  LoggedUser({required this.name});

  factory LoggedUser.newInstance() {
    return LoggedUser(name: '');
  }

  factory LoggedUser.fromJson(Map<String, dynamic> json) {
    return LoggedUser(name: json['name'] as String);
  }
}
