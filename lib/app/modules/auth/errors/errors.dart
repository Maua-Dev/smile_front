class Failure implements Exception {
  final String message;
  Failure(this.message);
}

class PasswordInvalid extends Failure {
  PasswordInvalid(String message) : super(message);
}

class EmailInvalid extends Failure {
  EmailInvalid(String message) : super(message);
}
