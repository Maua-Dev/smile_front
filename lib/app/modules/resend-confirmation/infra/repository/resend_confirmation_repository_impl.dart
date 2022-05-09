import '../../domain/repository/resend_confirmation_datasource_interface.dart';
import '../datasources/resend_confirmation_datasource.dart';

class ResendConfirmationRepositoryImpl extends ResendConfirmationRepositoryInterface {
  final ResendConfirmationDatasource datasource;

 ResendConfirmationRepositoryImpl({required this.datasource});

  @override
  Future<String> resendConfirmation(String username) {
    final response = datasource.resendConfirmation(username);
    return Future.value(response);
  }
}
