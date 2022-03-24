class Failure implements Exception {
  final String message;
  Failure(this.message);
}

class ForgotPasswordInvalid extends Failure {
  ForgotPasswordInvalid(String message) : super(message);
}
