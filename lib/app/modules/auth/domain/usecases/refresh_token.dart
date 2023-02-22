import 'package:smile_front/app/modules/auth/domain/repositories/auth_repository_interface.dart';

abstract class RefreshTokenInterface {
  Future<Map<String, dynamic>> call();
}

class RefreshToken implements RefreshTokenInterface {
  final AuthRepositoryInterface authRepository;

  RefreshToken({required this.authRepository});

  @override
  Future<Map<String, dynamic>> call() {
    return authRepository.refreshToken();
  }
}
