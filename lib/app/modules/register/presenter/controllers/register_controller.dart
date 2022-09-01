import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/register/domain/repositories/register_informations_repository_interface.dart';
import '../../../../shared/entities/user_registration.dart';
import '../../../../shared/error/error_snackbar.dart';
import '../../../../shared/services/firebase-analytics/firebase_analytics_service.dart';
import '../../../../shared/themes/app_colors.dart';
import '../../external/errors/errors.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
part 'register_controller.g.dart';

class RegisterController = RegisterControllerBase with _$RegisterController;

abstract class RegisterControllerBase with Store {
  final RegisterRepositoryInterface registerUserRepository;
  final FirebaseAnalyticsService analytics;

  RegisterControllerBase(
      {required this.analytics, required this.registerUserRepository});

  @computed
  int? get raInt => ra == ''
      ? null
      : int.parse(
          ra.replaceAll('-', '').replaceAll('.', '').replaceAll(' ', ''));

  @observable
  List<String> errorsList = [];

  @observable
  String errors = '';

  @observable
  bool isLoading = false;

  @observable
  bool showDialogToConfirmEmail = false;

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
  String verifyEmail = '';

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

  @observable
  bool acceptImage = false;

  @action
  Future<void> setAcceptImage(bool? value) async {
    acceptImage = value!;
  }

  @action
  Future<void> addError(String value) async {
    if (!errorsList.contains(value)) {
      errorsList.add(value);
      joinErrors();
    }
  }

  @action
  Future<void> joinErrors() async {
    if (errorsList.isEmpty) {
      errors = '';
    } else {
      errors = errorsList.join("\n");
    }
  }

  @action
  Future<void> resetErrors() async {
    errors = '';
    errorsList = [];
  }

  @action
  Future<void> setName(String value) async {
    name = value;
  }

  @action
  bool validateName(String value) {
    if (value.isEmpty) {
      addError('Campo "Nome Completo" obrigatório');
      return false;
    } else if (value.split(' ').length < 2) {
      addError('Insira seu nome completo');
      return false;
    }
    return true;
  }

  @action
  Future<void> setSocialName(String value) async {
    socialName = value;
  }

  @action
  bool validateSocialName(String value) {
    if (hasSocialName && value.isEmpty) {
      addError('Campo "Nome Social" obrigatório');
      return false;
    }
    return true;
  }

  @action
  Future<void> setCpf(String value) async {
    value = value.replaceAll('.', '');
    value = value.replaceAll('-', '');
    cpf = value;
  }

  @action
  bool validateCpf(String value) {
    value = value.replaceAll('.', '');
    value = value.replaceAll('-', '');
    if (value.isEmpty) {
      addError('Campo "CPF" obrigatório');
      return false;
    } else if (!CPFValidator.isValid(value)) {
      addError('Campo "CPF" inválido');
      return false;
    }
    return true;
  }

  @action
  Future<void> setEmail(String value) async {
    email = value.replaceAll(' ', '');
  }

  @action
  Future<void> setVerifyEmail(String value) async {
    verifyEmail = value.replaceAll(' ', '');
  }

  List<String> emailProviders = [
    'gmail',
    'hotmail',
    'terra',
    'uol',
    'outlook',
    'yahoo',
    'icloud',
    'maua'
  ];

  @action
  bool validateEmail(String value) {
    if (value.isEmpty) {
      addError('Campo "E-mail" obrigatório');
      return false;
    }
    if (!value.contains('@')) {
      addError('Campo "E-mail" inválido');
      return false;
    }
    var provider = value.split('@')[1].split('.')[0];
    showDialogToConfirmEmail = !emailProviders.contains(provider);
    return true;
  }

  @action
  bool validateVerifyEmail(String value) {
    if (value.isEmpty) {
      addError('Campo "Confirme seu e-mail" obrigatório');
      return false;
    }
    if (value != email) {
      addError('Os campos "E-mail" e "Confirme seu e-mail" \ndevem ser iguais');
      return false;
    }
    return true;
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
  bool validateRa(String value) {
    if (isMauaStudent) {
      if (value.isEmpty) {
        addError('Campo "RA" obrigatório');
        return false;
      }
      value = value.replaceAll('.', '');
      value = value.replaceAll('-', '');
      if (value.length != 8) {
        addError('Campo "RA" inválido');
        return false;
      }
    }
    return true;
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
  bool validateVerifyPassword(String value) {
    if (value.isEmpty) {
      addError('Campo "Confirme sua senha" obrigatório');
      return false;
    }
    if (password != verifyPassword) {
      addError('Os campos "Senha" e "Confirme sua senha" \ndevem ser iguais');
      return false;
    }
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      addError(
          "Sua senha deve conter: \n - Uma ou mais letras maiúsculas \n - Uma ou mais letras minúsculas \n - Um ou mais números \n - Um ou mais caracteres especiais\n(#, ?, !, @, \$, %, ^, &, *, -)  \n - Mínimo de 8 caracteres");
      return false;
    }
    return true;
  }

  @computed
  UserRegistration get registerInformations => UserRegistration(
      name: name,
      socialName: socialName == "" ? null : socialName,
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
        analytics.logSignUp();
      } on Failure catch (e) {
        showErrorSnackBar(errorMessage: e.message, color: AppColors.redButton);
      }
      setIsLoading(false);
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

  @action
  void setShowDialogToConfirmEmail(bool value) {
    showDialogToConfirmEmail = value;
  }

  @action
  bool validateForm() {
    resetErrors();
    validateName(name);
    validateSocialName(socialName);
    validateCpf(cpf);
    validateEmail(email);
    validateVerifyEmail(verifyEmail);
    validateRa(ra);
    validateVerifyPassword(verifyPassword);

    return errorsList.isEmpty;
  }
}
