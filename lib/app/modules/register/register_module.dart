import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/register/domain/repositories/register_informations_repository.dart';
import 'package:smile_front/app/modules/register/domain/repositories/register_user_repository_mock.dart';
import 'package:smile_front/app/modules/register/presenter/controllers/register_user_controller.dart';

class RegisterModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<RegisterUserController>(
        (i) => RegisterUserController(
              repository: i<RegisterUserRepository>(),
            ),
        export: true),
    Bind.lazySingleton<RegisterUserRepository>(
        (i) => RegisterUserRepositoryMock(),
        export: true),
  ];
}
