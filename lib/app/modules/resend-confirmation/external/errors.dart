class Failure implements Exception {
  final String message;
  Failure(this.message);
}

class ResendConfirmationInvalid extends Failure {
  ResendConfirmationInvalid(String message) : super(message);
}
