import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/register/domain/repositories/register_informations_repository_interface.dart';

import '../../../../shared/entities/user_registration.dart';
import '../../external/errors/errors.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
part 'register_controller.g.dart';

class RegisterController = _RegisterController with _$RegisterController;

abstract class _RegisterController with Store {
  final RegisterRepositoryInterface registerUserRepository;

  _RegisterController({required this.registerUserRepository});

  @computed
  int? get raInt =>
      ra == '' ? null : int.parse(ra.replaceAll('-', '').replaceAll('.', ''));

  @observable
  String errors = '';

  @observable
  bool isLoading = false;

  @observable
  bool showPwd = false;

  @observable
  bool showConfirmPwd = false;

  @observable
  bool successRegistration = false;

  @observable
  String name = '';

  @observable
  String socialName = '';

  @observable
  bool hasSocialName = false;

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
  bool canSendEmails = false;

  @observable
  bool acceptTermsOfUse = false;

  @action
  Future<void> setError(String value) async {
    errors = value;
  }

  @action
  Future<void> setName(String value) async {
    name = value;
  }

  @action
  String? validateName(String value) {
    if (value.isEmpty) {
      return "         Campo obrigatório";
    } else if (value.split(' ').length < 2) {
      return "         Insira seu nome completo";
    }
    return null;
  }

  @action
  Future<void> setSocialName(String value) async {
    socialName = value;
  }

  @action
  String? validateSocialName(String value) {
    if (hasSocialName && value.isEmpty) {
      return "         Campo obrigatório";
    }
    return null;
  }

  @action
  Future<void> setCpf(String value) async {
    value = value.replaceAll('.', '');
    value = value.replaceAll('-', '');
    cpf = value;
  }

  @action
  String? validateCpf(String value) {
    value = value.replaceAll('.', '');
    value = value.replaceAll('-', '');
    if (value.isEmpty) {
      return "         Campo obrigatório";
    } else if (!CPFValidator.isValid(value)) {
      return "         CPF inválido";
    }
    return null;
  }

  @action
  Future<void> setEmail(String value) async {
    email = value;
  }

  @action
  String? validateEmail(String value) {
    if (value.isEmpty) {
      return "         Campo obrigatório";
    }
    if (!value.contains('@')) {
      return "Email inválido";
    }
    return null;
  }

  @action
  Future<void> setIsMauaStudent(bool? value) async {
    isMauaStudent = value!;
    if (isMauaStudent == false) {
      ra = '';
    }
  }

  @action
  Future<void> setHasSocialName(bool? value) async {
    hasSocialName = value!;
    if (hasSocialName == false) {
      socialName = '';
    }
  }

  @action
  Future<void> setRa(String value) async {
    ra = value;
  }

  @action
  String? validateRa(String value) {
    if (isMauaStudent) {
      if (value.isEmpty) {
        return "         Campo obrigatório";
      }
      value = value.replaceAll('.', '');
      value = value.replaceAll('-', '');
      if (value.length != 8) {
        return "RA inválido";
      }
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
      return "         Campo obrigatório";
    }
    if (password != verifyPassword) {
      return "Digite a mesma senha";
    }
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      setError(
          "Sua senha deve conter: \n - Uma ou mais letras maiúsculas \n - Uma ou mais letras minúsculas \n - Um ou mais números \n - Um ou mais caracteres especiais \n - Mínimo de 8 caracteres");
      return '';
    }
    return null;
  }

  @computed
  UserRegistration get registerInformations => UserRegistration(
      name: name,
      socialName: socialName == '' ? null : socialName,
      email: email,
      cpfRne: cpf,
      ra: raInt,
      password: password,
      acceptEmails: canSendEmails,
      acceptTerms: acceptTermsOfUse);

  @action
  Future<void> register() async {
    if (acceptTermsOfUse) {
      setIsLoading(true);
      try {
        await registerUserRepository.registerUser(registerInformations);
        setIsLoading(false);
        setSuccessRegistration(true);
      } on Failure catch (e) {
        errors = e.message;
      }
      setIsLoading(false);
    } else {
      errors = "Aceite os Termos de Uso para realizar o cadastro";
    }
  }

  @action
  Future<void> setIsLoading(bool value) async {
    isLoading = value;
  }

  @action
  Future<void> setSuccessRegistration(bool value) async {
    successRegistration = value;
  }

  @action
  Future<void> setCanSendEmails(bool? value) async {
    canSendEmails = value!;
  }

  @action
  Future<void> setAcceptTermsOfUse(bool? value) async {
    acceptTermsOfUse = value!;
  }

  @action
  void toggleVisibilityPwd(bool value) {
    showPwd = !value;
  }

  @action
  void toggleVisibilityConfirmPwd(bool value) {
    showConfirmPwd = !value;
  }
}
