import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/register/domain/repositories/register_informations_repository.dart';
import 'package:smile_front/app/modules/register/domain/repositories/register_user_repository_mock.dart';
import 'package:smile_front/app/modules/register/presenter/controllers/register_controller.dart';
import 'package:smile_front/app/modules/register/ui/register_page.dart';

class RegisterModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<RegisterController>((i) => RegisterController(),
        export: true),
    Bind.lazySingleton<RegisterUserRepository>(
        (i) => RegisterUserRepositoryMock(),
        export: true),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const RegisterPage()),
  ];
}
