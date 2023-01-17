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

  test('setCpf', () {
    var str = '11759675059';
    controller.setCpf(str);
    expect(controller.cpf, str);
  });

  test('validateCpf if is empty : String Error Message', () {
    var str = '';
    expect(controller.validateCpf(str), isA<String>());
  });

  test('validateCpf if CPF is not valid : String Error Message', () {
    var str = '02020202';
    expect(controller.validateCpf(str), isA<String>());
  });

  test('validateCpf is ok : null', () {
    var str = '49846129831';
    expect(controller.validateCpf(str), null);
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

  test('validateRa if is empty : String Error Message', () {
    controller.isMauaStudent = true;
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
    controller.setCanSendEmails(true);
    expect(controller.canSendEmails, true);
  });

  test('setEmailNotifications', () {
    controller.setEmailNotifications(true);
    expect(controller.acceptEmailNotifications, true);
  });

  test('setSMSNotifications', () {
    controller.setSMSNotifications(true);
    expect(controller.acceptSMSNotifications, true);
  });

  test('setWPPNotifications', () {
    controller.setWPPNotifications(true);
    expect(controller.acceptWPPNotifications, true);
  });

  test('setAPPWEBNotifications', () {
    controller.setAPPWEBNotifications(true);
    expect(controller.acceptAPPWEBNotifications, true);
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
