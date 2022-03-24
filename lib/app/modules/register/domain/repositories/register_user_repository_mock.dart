import 'package:smile_front/app/modules/register/domain/repositories/register_informations_repository_interface.dart';

import '../../../../shared/entities/user_registration.dart';

class RegisterRepositoryMock implements RegisterRepositoryInterface {
  @override
  Future<String> registerUser(UserRegistration userRegistration) async {
    return 'Registered';
  }
}
