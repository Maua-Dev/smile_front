import 'dart:ui';

import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:smile_front/app/app_module.dart';
import 'package:smile_front/app/modules/register/domain/repositories/register_informations_repository_interface.dart';
import 'package:smile_front/app/modules/register/presenter/controllers/register_controller.dart';
import 'package:smile_front/app/modules/register/register_module.dart';
import 'package:smile_front/app/modules/register/domain/usecases/register_user.dart';
import 'package:smile_front/app/shared/domain/enum/user_roles_enum.dart';

import 'package:smile_front/generated/l10n.dart';

import 'register_controller_test.mocks.dart';

@GenerateMocks([RegisterRepositoryInterface, RegisterUserInterface])
void main() {
  initModules([AppModule(), RegisterModule()]);

  late RegisterController controller;

  RegisterUserInterface registerUser = MockRegisterUserInterface();

  setUpAll(() async {
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
    controller = RegisterController(registerUser: registerUser);
  });

  test('setName', () {
    var str = 'caio';
    controller.setName(str);
    expect(controller.name, str);
  });

  test('validateName if is empty : String Error Message', () {
    var str = '';
    expect(controller.validateName(str), isA<String>());
  });

  test('validateName if is not complete name : String Error Message', () {
    var str = 'Name';
    expect(controller.validateName(str), isA<String>());
  });

  test('validateName if name is ok : null', () {
    var str = 'Name Complete';
    expect(controller.validateName(str), null);
  });

  test('setSocialName', () {
    var str = 'caio';
    controller.setSocialName(str);
    expect(controller.socialName, str);
  });

  test(
      'validateSocialName if is empty and hasSocialName : String Error Message',
      () {
    controller.hasSocialName = true;
    var str = '';
    expect(controller.validateSocialName(str), isA<String>());
  });

  test('validateSocialName if is ok : null', () {
    controller.hasSocialName = false;
    var str = 'Name';
    expect(controller.validateSocialName(str), null);
  });

  test('setEmail', () {
    var str = 'teste';
    controller.setEmail(str);
    expect(controller.email, str);
  });

  test('setVerifyEmail', () {
    var str = 'test @ ';
    controller.setVerifyEmail(str);
    expect(controller.verifyEmail, 'test@');
  });

  test('validateEmail if is empty : String Error Message', () {
    var str = '';
    controller.validateEmail(str);
    expect(controller.validateEmail(str), isA<String>());
  });

  test('validateEmail if constains @ : String Error Message', () {
    var str = 'test';
    controller.validateEmail(str);
    expect(controller.validateEmail(str), isA<String>());
  });

  test('validateEmail if constains @ : String Error Message', () {
    var str = 'test@';
    expect(controller.validateEmail(str), isA<String>());
  });

  test('validateVerifyEmail if is empty : String Error Message', () {
    var str = '';
    controller.validateVerifyEmail(str);
    expect(controller.validateVerifyEmail(str), isA<String>());
  });

  test('validateVerifyEmail if is equal to email : String Error Message', () {
    controller.email = '@';
    var str = 'g@';
    controller.validateVerifyEmail(str);
    expect(controller.validateVerifyEmail(str), isA<String>());
  });

  test('validateVerifyEmail if is equal to email : null', () {
    controller.email = 'g@';
    var str = 'g@';
    expect(controller.validateVerifyEmail(str), null);
  });

  test('setRole', () {
    var role = UserRolesEnum.EXTERNAL;
    controller.setRole(role);
    expect(controller.role, role);
    expect(controller.ra, '');
  });

  test('setHasSocialName', () {
    controller.socialName = '';
    controller.setHasSocialName(true);
    expect(controller.hasSocialName, true);
    expect(controller.socialName, '');
  });

  test('setRa', () {
    var str = 'teste';
    controller.setRa(str);
    expect(controller.ra, str);
  });

  test('validateRa if is empty : String Error Message', () {
    controller.role = UserRolesEnum.STUDENT;
    expect(controller.validateRa(''), isA<String>());
  });

  test('setPassword', () {
    var str = 'Teste123!';
    controller.setPassword(str);
    expect(controller.password, str);
  });

  test('setVerifyPassword', () {
    var str = 'Teste123!';
    controller.setVerifyPassword(str);
    expect(controller.verifyPassword, str);
  });

  test('validateVerifyPassword if is empty : String Error Message', () {
    var str = '';
    expect(controller.validateVerifyPassword(str), isA<String>());
  });

  test('setIsLoading', () {
    controller.setIsLoading(true);
    expect(controller.isLoading, true);
  });

  test('setSuccessRegistration', () {
    controller.setSuccessRegistration(true);
    expect(controller.successRegistration, true);
  });

  test('setCanSendEmails', () {
    controller.setAcceptEmailNotifications(true);
    expect(controller.acceptEmailNotifications, true);
  });

  test('setEmailNotifications', () {
    controller.setEmailNotifications(true);
    expect(controller.acceptEmailNotifications, true);
  });

  test('setAcceptTermsOfUse', () {
    controller.setAcceptTermsOfUse(true);
    expect(controller.acceptTermsOfUse, true);
  });

  test('toggleVisibilityPwd', () {
    controller.toggleVisibilityPwd(true);
    expect(controller.showPwd, false);
  });

  test('toggleVisibilityConfirmPwd', () {
    controller.toggleVisibilityConfirmPwd(true);
    expect(controller.showConfirmPwd, false);
  });

  test('setSuccessRegistration', () {
    var str = true;
    controller.setSuccessRegistration(str);
    expect(controller.successRegistration, true);
  });
}
