import 'package:email_validator/email_validator.dart';
import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/register/domain/repositories/register_informations_repository_interface.dart';
import 'package:smile_front/app/modules/register/usecases/register_user.dart';
import 'package:smile_front/generated/l10n.dart';
import '../../../../app_widget.dart';
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
  final RegisterUserInterface registerUser;

  RegisterControllerBase(
      {required this.analytics,
      required this.registerUserRepository,
      required this.registerUser});

  @computed
  int? get raInt => ra == ''
      ? null
      : int.parse(
          ra.replaceAll('-', '').replaceAll('.', '').replaceAll(' ', ''));

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
  String phone = '';

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

  @observable
  bool acceptEmailNotifications = false;

  @observable
  bool acceptSMSNotifications = false;

  @observable
  bool acceptWPPNotifications = false;

  @observable
  bool acceptAPPWEBNotifications = false;

  @action
  Future<void> setEmailNotifications(bool? value) async {
    acceptEmailNotifications = value!;
  }

  @action
  Future<void> setSMSNotifications(bool? value) async {
    acceptSMSNotifications = value!;
  }

  @action
  Future<void> setWPPNotifications(bool? value) async {
    acceptWPPNotifications = value!;
  }

  @action
  Future<void> setAPPWEBNotifications(bool? value) async {
    acceptAPPWEBNotifications = value!;
  }

  @action
  Future<void> setAcceptImage(bool? value) async {
    acceptImage = value!;
  }

  @action
  Future<void> setName(String value) async {
    name = value;
  }

  @action
  String? validateName(String? value) {
    if (value!.isEmpty) {
      return S.current.fieldRequired;
    } else if (value.split(' ').length < 2) {
      return 'Insira seu nome completo';
    }
    return null;
  }

  @action
  Future<void> setSocialName(String value) async {
    socialName = value;
  }

  @action
  String? validateSocialName(String? value) {
    if (hasSocialName && value!.isEmpty) {
      return S.current.fieldRequired;
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
  String? validateCpf(String? value) {
    if (value!.isEmpty) {
      return S.current.fieldRequired;
    } else if (!CPFValidator.isValid(value)) {
      value = value.replaceAll('.', '');
      value = value.replaceAll('-', '');
      return S.current.fieldCpfInvalid;
    }
    return null;
  }

  @action
  Future<void> setEmail(String value) async {
    email = value.replaceAll(' ', '');
  }

  @action
  Future<void> setVerifyEmail(String value) async {
    verifyEmail = value.replaceAll(' ', '');
  }

  @action
  Future<void> setPhone(String value) async {
    value = value.replaceAll('+', '');
    phone = value;
  }

  @action
  String? validatePhone(String? value) {
    if (value!.isEmpty) {
      return S.current.fieldRequired;
    }
    if (phone[0] == "5" && phone[1] == "5" && phone.length == 11) {
      return S.current.fieldDDDRequired;
    }
    if (value[0] == "5" &&
        value[1] == "5" &&
        value.length != 11 &&
        value.length != 13) {
      return S.current.fieldInvalid;
    }
    return null;
  }

  @action
  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return S.current.fieldRequired;
    }
    if (!EmailValidator.validate(email)) {
      return S.current.fieldEmailInvalid;
    }
    return null;
  }

  @action
  String? validateVerifyEmail(String? value) {
    if (value!.isEmpty) {
      return S.current.fieldRequired;
    }
    if (value != email) {
      return S.current.fieldEmailsEqualsRequired;
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
  String? validateRa(String? value) {
    if (isMauaStudent) {
      if (value!.isEmpty) {
        return S.current.fieldRequired;
      }
      value = value.replaceAll('.', '');
      value = value.replaceAll('-', '');
      if (value.length != 8) {
        return S.current.fieldRAInvalid;
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
  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return S.current.fieldRequired;
    }
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return S.current.fieldPasswordRequisits;
    }
    return null;
  }

  @action
  String? validateVerifyPassword(String? value) {
    if (value!.isEmpty) {
      return S.current.fieldRequired;
    }
    if (password != verifyPassword) {
      return S.current.fieldPasswordEqualsRequired;
    }
    return null;
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
        acceptTerms: acceptTermsOfUse,
        phoneNumber: phone,
        acceptEmailNotifications: acceptEmailNotifications,
        acceptSMSNotifications: acceptSMSNotifications,
        acceptWPPNotifications: acceptWPPNotifications,
        acceptAPPWEBNotifications: acceptAPPWEBNotifications,
      );

  @action
  Future<void> register() async {
    errors = '';
    if (acceptTermsOfUse) {
      setIsLoading(true);
      try {
        await registerUser(registerInformations);
        setIsLoading(false);
        setSuccessRegistration(true);
        analytics.logSignUp();
      } on Failure catch (e) {
        if (scaffold.context.size!.width <= 1024) {
          showErrorSnackBar(
            errorMessage: e.message,
            color: AppColors.redButton,
          );
        } else {
          errors = e.message;
        }
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
}
