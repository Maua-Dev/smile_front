import '../repositories/user_repository_interface.dart';

abstract class DeleteUserInterface {
  Future<void> call(String code);
}

class DeleteUser implements DeleteUserInterface {
  final UserRepositoryInterface userRepository;

  DeleteUser({required this.userRepository});

  @override
  Future<void> call(String code) {
    return userRepository.deleteUser(code);
  }
}
