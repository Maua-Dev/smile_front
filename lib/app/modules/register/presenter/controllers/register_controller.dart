import 'package:email_validator/email_validator.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/register/domain/usecases/register_user.dart';
import 'package:smile_front/app/shared/entities/infra/access_level_enum.dart';
import 'package:smile_front/app/shared/entities/infra/user_roles_enum.dart';
import 'package:smile_front/generated/l10n.dart';
import 'package:string_validator/string_validator.dart';
import '../../../../app_widget.dart';
import '../../../../shared/entities/user_registration.dart';
import '../../../../shared/error/error_snackbar.dart';
import '../../../../shared/services/firebase-analytics/firebase_analytics_service.dart';
import '../../../../shared/themes/app_colors.dart';
import '../../external/errors/errors.dart';
part 'register_controller.g.dart';

class RegisterController = RegisterControllerBase with _$RegisterController;

abstract class RegisterControllerBase with Store {
  final FirebaseAnalyticsService analytics;
  final RegisterUserInterface registerUser;

  RegisterControllerBase({required this.analytics, required this.registerUser});

  @computed
  String? get raInt => ra == ''
      ? null
      : ra.replaceAll('-', '').replaceAll('.', '').replaceAll(' ', '');

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
  String email = '';

  @observable
  String verifyEmail = '';

  @observable
  String phone = '';

  @observable
  UserRolesEnum role = UserRolesEnum.STUDENT;

  @observable
  String ra = '';

  @observable
  String password = '';

  @observable
  String verifyPassword = '';

  @observable
  bool acceptTermsOfUse = false;

  @observable
  bool acceptImage = false;

  @observable
  bool acceptEmailNotifications = false;

  @observable
  bool acceptSMSNotifications = false;

  @observable
  bool isBrazilianPhone = true;

  @observable
  bool isPhoneFieldFilled = false;

  @observable
  CountryCode? countryCode =
      const CountryCode(code: "BR", dialCode: "+55", name: "Brasil");

  @observable
  bool isSmsSwitched = false;

  @action
  void toggleSmsSwitch() {
    isSmsSwitched = !isSmsSwitched;
  }

  @observable
  bool isEmailSwitched = false;

  @action
  void toggleEmailSwitch() {
    isEmailSwitched = !isEmailSwitched;
    print(isEmailSwitched);
  }

  @action
  void setBrazilianPhone(CountryCode? value) {
    if (value?.code == "BR") {
      isBrazilianPhone = true;
    } else {
      isBrazilianPhone = false;
    }
  }

  @action
  void setCountryCode(CountryCode? value) {
    countryCode = value;
  }

  @action
  Future<void> setEmailNotifications(bool? value) async {
    acceptEmailNotifications = value!;
  }

  @action
  Future<void> setSMSNotifications(bool? value) async {
    acceptSMSNotifications = value!;
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
  Future<void> setEmail(String value) async {
    email = value.replaceAll(' ', '');
  }

  @action
  Future<void> setVerifyEmail(String value) async {
    verifyEmail = value.replaceAll(' ', '');
  }

  @action
  Future<void> setPhone(String value) async {
    phone = '${countryCode?.dialCode}$value';
    if (countryCode?.code == "BR") {
      phone = phone.replaceAll('(', '');
      phone = phone.replaceAll(')', '');
      phone = phone.replaceAll(' ', '');
      phone = phone.replaceAll('-', '');
    }
    if (value.isNotEmpty) {
      isPhoneFieldFilled = true;
    }
  }

  @action
  String? validatePhone(String? value) {
    if (countryCode?.code == "BR" && phone.length == 12) {
      return S.current.fieldDDDRequired;
    }
    if (countryCode?.code == "BR" && phone.length != 14 && phone.length > 3) {
      return S.current.fieldInvalid;
    }
    return null;
  }

  @action
  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return S.current.fieldRequired;
    }
    if (role == UserRolesEnum.PROFESSOR) {
      if (!email.contains('@maua.br') || isNumeric(email[0])) {
        return S.current.fieldProfessorEmailInvalid;
      }
    } else if (!EmailValidator.validate(email)) {
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
  Future<void> setRole(UserRolesEnum? value) async {
    role = value!;
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
    if (role == UserRolesEnum.STUDENT) {
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
        ra: raInt,
        password: password,
        acceptTerms: acceptTermsOfUse,
        phone: phone,
        acceptEmailNotifications: acceptEmailNotifications,
        acceptSMSNotifications: acceptSMSNotifications,
        accessLevel: AccessLevelEnum.USER,
        certificateWithSocialName: hasSocialName,
        role: role,
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
  Future<void> setAcceptEmailNotifications(bool? value) async {
    acceptEmailNotifications = value!;
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
