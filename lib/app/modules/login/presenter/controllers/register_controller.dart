import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/register/domain/entities/register_informations.dart';
import 'package:smile_front/app/modules/register/presenter/controllers/register_user_controller.dart';

part 'register_controller.g.dart';

class RegisterController = _RegisterController with _$RegisterController;

abstract class _RegisterController with Store {
  final RegisterUserController registerUserController;

  _RegisterController(this.registerUserController);

  @observable
  String name = '';

  @observable
  String cpf = '';

  @observable
  String email = '';

  @observable
  bool isMauaStudent = false;

  @observable
  String ra = '';

  @observable
  String password = '';

  @observable
  String verifyPassword = '';

  @observable
  bool aceptEmailNotifications = true;

  @action
  Future<void> setName(String value) async {
    name = value;
  }

  @action
  String? validateName(String value) {
    if (value.isEmpty) {
      return "Campo nome obrigatório";
    }
    return null;
  }

  @action
  Future<void> setCpf(String value) async {
    cpf = value;
  }

  @action
  String? validateCpf(String value) {
    if (value.isEmpty) {
      return "Campo obrigatório";
    }
    return null;
  }

  @action
  Future<void> setEmail(String value) async {
    cpf = value;
  }

  @action
  String? validateEmail(String value) {
    if (value.isEmpty) {
      return "Campo obrigatório";
    }
    if (!value.contains('@')) {
      return "Email inválido";
    }
    return null;
  }

  @action
  Future<void> setIsMauaStudent(bool? value) async {
    isMauaStudent = value!;
    if (!isMauaStudent) {
      ra = '';
    }
  }

  @action
  Future<void> setRa(String value) async {
    ra = value;
  }

  @action
  String? validateRa(String value) {
    if (value.isEmpty) {
      return "Campo obrigatório";
    }
    value = value.replaceAll('.', '');
    value = value.replaceAll('-', '');
    if (value.length != 8) {
      return "RA inválido";
    }
    return null;
  }

  @action
  Future<void> setPassword(String value) async {
    password = value;
  }

  @action
  Future<void> setVerifyPassword(String value) async {
    verifyPassword = value;
  }

  @action
  String? validateVerifyPassword(String value) {
    if (value.isEmpty) {
      return "Campo obrigatório";
    }
    if (password != verifyPassword) {
      return "Digite a mesma senha";
    }
    return null;
  }

  @action
  Future<void> setAceptEmailNotification(bool value) async {
    aceptEmailNotifications = value;
  }

  @computed
  RegisterInformations get registerInformations => RegisterInformations(
        socialName: name,
        email: email,
        cpfRne: cpf,
        isStudent: isMauaStudent,
        accessLevel: 2,
      );

  @action
  Future<void> register() async {
    // registerUserController.registerUser(registerInformations);
  }
}
