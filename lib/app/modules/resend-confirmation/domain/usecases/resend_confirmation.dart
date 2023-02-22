import '../repository/resend_confirmation_datasource_interface.dart';

abstract class ResendConfirmationInterface {
  Future<String> call(String username);
}

class ResendConfirmation implements ResendConfirmationInterface {
  final ResendConfirmationRepositoryInterface repository;

  ResendConfirmation({required this.repository});

  @override
  Future<String> call(String username) {
    return repository.resendConfirmation(username);
  }
}
