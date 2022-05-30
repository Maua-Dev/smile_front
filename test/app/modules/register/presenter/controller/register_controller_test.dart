import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:smile_front/app/app_module.dart';
import 'package:smile_front/app/modules/register/domain/repositories/register_informations_repository_interface.dart';
import 'package:smile_front/app/modules/register/presenter/controllers/register_controller.dart';
import 'package:smile_front/app/modules/register/register_module.dart';
import 'package:smile_front/app/shared/services/firebase-analytics/firebase_analytics_service.dart';

import '../../../../../setup_firebase_mocks.dart';
import '../../../auth/presenter/controllers/auth_controller_test.mocks.dart';
import 'register_controller_test.mocks.dart';

@GenerateMocks([RegisterRepositoryInterface])
void main() {
  initModules([AppModule(), RegisterModule()]);
  setupCloudFirestoreMocks();
  RegisterRepositoryInterface repository = MockRegisterRepositoryInterface();
  late RegisterController controller;
  FirebaseAnalyticsService analytics = MockFirebaseAnalyticsService();

  setUpAll(() async {
    await Firebase.initializeApp();
    controller = RegisterController(
        registerUserRepository: repository, analytics: analytics);
  });

  test('setAcceptImage', () {
    controller.setAcceptImage(true);
    expect(controller.acceptImage, true);
  });

  test('addError', () {
    var str = 'test';
    controller.addError(str);
    expect(controller.errorsList.contains(str), true);
  });

  test('joinErrors if errors list is empty', () {
    controller.errorsList = List.empty();
    controller.joinErrors();
    expect(controller.errors, '');
  });

  test('joinErrors if errors list is not empty', () {
    controller.errorsList = ['error', 'test'];
    controller.joinErrors();
    expect(controller.errors, 'error\ntest');
  });

  test('resetErrors', () {
    controller.resetErrors();
    expect(controller.errors, '');
    expect(controller.errorsList.isEmpty, true);
  });

  test('setName', () {
    var str = 'caio';
    controller.setName(str);
    expect(controller.name, str);
  });

  test('validateName if is empty : false', () {
    var str = '';
    expect(controller.validateName(str), false);
  });

  test('validateName if is not complete name : false', () {
    var str = 'Name';
    expect(controller.validateName(str), false);
  });

  test('validateName if name is ok : true', () {
    var str = 'Name Complete';
    expect(controller.validateName(str), true);
  });

  test('setSocialName', () {
    var str = 'caio';
    controller.setSocialName(str);
    expect(controller.socialName, str);
  });

  test('validateSocialName if is empty and hasSocialName : false', () {
    controller.hasSocialName = true;
    var str = '';
    expect(controller.validateSocialName(str), false);
  });

  test('validateSocialName if is ok : false', () {
    controller.hasSocialName = false;
    var str = 'Name';
    expect(controller.validateSocialName(str), true);
  });

  test('setCpf', () {
    var str = '11759675059';
    controller.setCpf(str);
    expect(controller.cpf, str);
  });

  test('validateCpf if is empty : false', () {
    var str = '';
    expect(controller.validateCpf(str), false);
    expect(controller.errorsList.contains('Campo "CPF" obrigatório'), true);
  });

  test('validateCpf if CPF is not valid : false', () {
    var str = '02020202';
    expect(controller.validateCpf(str), false);
    expect(controller.errorsList.contains('Campo "CPF" inválido'), true);
  });

  test('validateCpf is ok : true', () {
    var str = '49846129831';
    expect(controller.validateCpf(str), true);
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

  test('validateEmail if is empty', () {
    var str = '';
    controller.validateEmail(str);
    expect(controller.validateEmail(str), false);
    expect(controller.errorsList.contains('Campo "E-mail" obrigatório'), true);
  });

  test('validateEmail if constains @ : false', () {
    var str = 'test';
    controller.validateEmail(str);
    expect(controller.validateEmail(str), false);
    expect(controller.errorsList.contains('Campo "E-mail" inválido'), true);
  });

  test('validateEmail if constains @ : true', () {
    var str = 'test@';
    expect(controller.validateEmail(str), true);
  });

  test('validateEmail if constains providers', () {
    var str = 'test@gmail.com';
    expect(controller.validateEmail(str), true);
  });

  test('validateVerifyEmail if is empty', () {
    var str = '';
    controller.validateVerifyEmail(str);
    expect(controller.validateVerifyEmail(str), false);
    expect(
        controller.errorsList
            .contains('Campo "Confirme seu e-mail" obrigatório'),
        true);
  });

  test('validateVerifyEmail if is equal to email : false', () {
    controller.email = '@';
    var str = 'g@';
    controller.validateVerifyEmail(str);
    expect(controller.validateVerifyEmail(str), false);
  });

  test('validateVerifyEmail if is equal to email : true', () {
    controller.email = 'g@';
    var str = 'g@';
    expect(controller.validateVerifyEmail(str), true);
  });

  test('setIsMauaStudent', () {
    controller.setIsMauaStudent(true);
    expect(controller.isMauaStudent, true);
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

  test('validateRa if is empty', () {
    controller.isMauaStudent = true;
    expect(controller.validateRa(''), false);
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

  test('validateVerifyPassword if is empty', () {
    var str = '';
    expect(controller.validateVerifyPassword(str), false);
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
    controller.setCanSendEmails(true);
    expect(controller.canSendEmails, true);
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

  test('setShowDialogToConfirmEmail', () {
    controller.setShowDialogToConfirmEmail(true);
    expect(controller.showDialogToConfirmEmail, true);
  });

  test('setSuccessRegistration', () {
    var str = true;
    controller.setSuccessRegistration(str);
    expect(controller.successRegistration, true);
  });
}
