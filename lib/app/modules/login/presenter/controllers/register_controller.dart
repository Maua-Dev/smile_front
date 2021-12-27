import 'package:mobx/mobx.dart';

part 'register_controller.g.dart';

class RegisterController = RegisterControllerBase with _$RegisterController;

abstract class RegisterControllerBase with Store {
  // final IHome2Repository repository;

  // RegisterControllerBase(this.repository) {
  //   getSpeakers();
  // }

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
  Future<void> setIsMauaStudent(bool value) async {
    isMauaStudent = value;
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

  @action
  Future<void> register() async {}
}
