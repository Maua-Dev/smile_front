class Failure implements Exception {
  final String message;
  Failure(this.message);
}

class RegisterInvalid extends Failure {
  RegisterInvalid(String message) : super(message);
}

class RegisterSuccess extends Failure {
  RegisterSuccess(String message) : super(message);
}
