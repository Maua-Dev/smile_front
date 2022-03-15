class Failure implements Exception {
  final String message;
  Failure(this.message);
}

class LoginInvalid extends Failure {
  LoginInvalid(String message) : super(message);
}
