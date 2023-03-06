import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smile_front/app/app_module.dart';
import 'package:smile_front/app/modules/auth/domain/repositories/secure_storage_interface.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/domain/repositories/user_repository_interface.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/change_data.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/get_user_subscribed_activities.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/subscribe_activities.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/unsubscribe_activities.dart';
import 'package:smile_front/app/modules/dashboard/infra/models/speaker_activity_model.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/user_dashboard_controller.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/user_subscription_controller.dart';
import 'package:smile_front/app/shared/models/enrolls_activity_model.dart';
import 'package:smile_front/app/shared/services/firebase-analytics/firebase_analytics_service.dart';
import '../../../../../../setup_firebase_mocks.dart';
import 'more_info_controller_test.mocks.dart';
import 'user_dashboard_controller_test.mocks.dart';

@GenerateMocks([
  GetUserSubscribedActivitiesInterface,
  SecureStorageInterface,
  UserRepositoryInterface,
  FirebaseAnalyticsService,
  ChangeDataInterface,
])
void main() {
  initModule(AppModule());
  setupCloudFirestoreMocks();
  SubscribeActivityInterface subscribeActivity =
      MockSubscribeActivityInterface();

  UnsubscribeActivityInterface unsubscribeActivity =
      MockUnsubscribeActivityInterface();
  GetUserSubscribedActivitiesInterface getUserActivities =
      MockGetUserSubscribedActivitiesInterface();
  ChangeDataInterface changeData = MockChangeDataInterface();
  FirebaseAnalyticsService analytics = MockFirebaseAnalyticsService();
  SecureStorageInterface secureStorage = MockSecureStorageInterface();

  late UserDashboardController controller;
  late UserEnrollmentController subscriptionController;

  final mockActivities = <EnrollsActivityModel>[
    EnrollsActivityModel(
      activityCode: 'C01',
      type: ActivityEnum.COURSES,
      title:
          'Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01',
      description:
          'Teste de atividade mock Teste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mock',
      speakers: [
        SpeakerActivityModel(
          name: 'Gabriel Godoy',
          bio: 'Caros participantes, este é um teste, aproveitem a atividade',
          company: 'Oracle',
        ),
        SpeakerActivityModel(
          name: 'Gabriel Godoy',
          bio: 'Caros participantes, este é um teste, aproveitem a atividade',
          company: 'Oracle',
        ),
        SpeakerActivityModel(
          name: 'Gabriel Godoy',
          bio: 'Caros participantes, este é um teste, aproveitem a atividade',
          company: 'Oracle',
        ),
      ],
      startDate: DateTime.parse('2022-05-16 13:00'),
      totalSlots: 20,
      duration: 120,
      place: 'H244',
      link: 'https://www.google.com.br',
      acceptingNewEnrollments: false,
      isExtensive: false,
      takenSlots: 0,
      responsibleProfessors: [],
    ),
    EnrollsActivityModel(
      activityCode: 'C01',
      type: ActivityEnum.COURSES,
      title:
          'Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01',
      description:
          'Teste de atividade mock Teste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mock',
      speakers: [
        SpeakerActivityModel(
          name: 'Gabriel Godoy',
          bio: 'Caros participantes, este é um teste, aproveitem a atividade',
          company: 'Oracle',
        ),
        SpeakerActivityModel(
          name: 'Gabriel Godoy',
          bio: 'Caros participantes, este é um teste, aproveitem a atividade',
          company: 'Oracle',
        ),
        SpeakerActivityModel(
          name: 'Gabriel Godoy',
          bio: 'Caros participantes, este é um teste, aproveitem a atividade',
          company: 'Oracle',
        ),
      ],
      startDate: DateTime.parse('2022-05-17 13:00'),
      totalSlots: 20,
      duration: 120,
      place: 'H244',
      link: 'https://www.google.com.br',
      acceptingNewEnrollments: false,
      isExtensive: false,
      takenSlots: 0,
      responsibleProfessors: [],
    ),
    EnrollsActivityModel(
      activityCode: 'C01',
      type: ActivityEnum.COURSES,
      title:
          'Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01',
      description:
          'Teste de atividade mock Teste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mock',
      speakers: [
        SpeakerActivityModel(
          name: 'Gabriel Godoy',
          bio: 'Caros participantes, este é um teste, aproveitem a atividade',
          company: 'Oracle',
        ),
        SpeakerActivityModel(
          name: 'Gabriel Godoy',
          bio: 'Caros participantes, este é um teste, aproveitem a atividade',
          company: 'Oracle',
        ),
        SpeakerActivityModel(
          name: 'Gabriel Godoy',
          bio: 'Caros participantes, este é um teste, aproveitem a atividade',
          company: 'Oracle',
        ),
      ],
      startDate: DateTime.parse('2022-05-18 13:00'),
      totalSlots: 20,
      duration: 120,
      place: 'H244',
      link: 'https://www.google.com.br',
      acceptingNewEnrollments: false,
      isExtensive: false,
      takenSlots: 0,
      responsibleProfessors: [],
    ),
    EnrollsActivityModel(
      activityCode: 'C01',
      type: ActivityEnum.COURSES,
      title:
          'Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01',
      description:
          'Teste de atividade mock Teste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mock',
      speakers: [
        SpeakerActivityModel(
          name: 'Gabriel Godoy',
          bio: 'Caros participantes, este é um teste, aproveitem a atividade',
          company: 'Oracle',
        ),
        SpeakerActivityModel(
          name: 'Gabriel Godoy',
          bio: 'Caros participantes, este é um teste, aproveitem a atividade',
          company: 'Oracle',
        ),
        SpeakerActivityModel(
          name: 'Gabriel Godoy',
          bio: 'Caros participantes, este é um teste, aproveitem a atividade',
          company: 'Oracle',
        ),
      ],
      startDate: DateTime.parse('2022-07-19 13:00'),
      totalSlots: 20,
      duration: 120,
      place: 'H244',
      link: 'https://www.google.com.br',
      acceptingNewEnrollments: false,
      isExtensive: false,
      takenSlots: 0,
      responsibleProfessors: [],
    ),
    EnrollsActivityModel(
      activityCode: 'C01',
      type: ActivityEnum.COURSES,
      title:
          'Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01',
      description:
          'Teste de atividade mock Teste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mock',
      speakers: [
        SpeakerActivityModel(
          name: 'Gabriel Godoy',
          bio: 'Caros participantes, este é um teste, aproveitem a atividade',
          company: 'Oracle',
        ),
        SpeakerActivityModel(
          name: 'Gabriel Godoy',
          bio: 'Caros participantes, este é um teste, aproveitem a atividade',
          company: 'Oracle',
        ),
        SpeakerActivityModel(
          name: 'Gabriel Godoy',
          bio: 'Caros participantes, este é um teste, aproveitem a atividade',
          company: 'Oracle',
        ),
      ],
      startDate: DateTime.parse('2022-07-20 13:00'),
      totalSlots: 20,
      duration: 120,
      place: 'H244',
      link: 'https://www.google.com.br',
      acceptingNewEnrollments: false,
      isExtensive: false,
      takenSlots: 0,
      responsibleProfessors: [],
    ),
    EnrollsActivityModel(
      activityCode: 'C01',
      type: ActivityEnum.COURSES,
      title:
          'Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01',
      description:
          'Teste de atividade mock Teste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mock',
      speakers: [
        SpeakerActivityModel(
          name: 'Gabriel Godoy',
          bio: 'Caros participantes, este é um teste, aproveitem a atividade',
          company: 'Oracle',
        ),
        SpeakerActivityModel(
          name: 'Gabriel Godoy',
          bio: 'Caros participantes, este é um teste, aproveitem a atividade',
          company: 'Oracle',
        ),
        SpeakerActivityModel(
          name: 'Gabriel Godoy',
          bio: 'Caros participantes, este é um teste, aproveitem a atividade',
          company: 'Oracle',
        ),
      ],
      startDate: DateTime.parse('2022-07-21 13:00'),
      totalSlots: 20,
      duration: 120,
      place: 'H244',
      link: 'https://www.google.com.br',
      acceptingNewEnrollments: false,
      isExtensive: false,
      takenSlots: 0,
      responsibleProfessors: [],
    ),
    EnrollsActivityModel(
      activityCode: 'C01',
      type: ActivityEnum.COURSES,
      title:
          'Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01',
      description:
          'Teste de atividade mock Teste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mock',
      speakers: [
        SpeakerActivityModel(
          name: 'Gabriel Godoy',
          bio: 'Caros participantes, este é um teste, aproveitem a atividade',
          company: 'Oracle',
        ),
        SpeakerActivityModel(
          name: 'Gabriel Godoy',
          bio: 'Caros participantes, este é um teste, aproveitem a atividade',
          company: 'Oracle',
        ),
        SpeakerActivityModel(
          name: 'Gabriel Godoy',
          bio: 'Caros participantes, este é um teste, aproveitem a atividade',
          company: 'Oracle',
        ),
      ],
      startDate: DateTime.parse('2022-07-22 13:00'),
      totalSlots: 20,
      duration: 120,
      place: 'H244',
      link: 'https://www.google.com.br',
      acceptingNewEnrollments: false,
      isExtensive: false,
      takenSlots: 0,
      responsibleProfessors: [],
    ),
  ];

  var name = 'Name Test';
  var socialName = 'Social Name';
  var certificateWithSocialName = true;

  setUpAll(() async {
    await Firebase.initializeApp();
    when(getUserActivities()).thenAnswer((_) async => mockActivities);
    when(secureStorage.getName()).thenAnswer((_) async => name);
    when(secureStorage.getSocialName()).thenAnswer((_) async => socialName);
    when(secureStorage.getPhone()).thenAnswer((_) async => '+5511991273092');
    when(secureStorage.getCertificateWithSocialName())
        .thenAnswer((_) async => certificateWithSocialName);
    subscriptionController = UserEnrollmentController(
        getUserActivities: getUserActivities,
        subscribeActivity: subscribeActivity,
        unsubscribeActivity: unsubscribeActivity);
    controller = UserDashboardController(
        secureStorage: secureStorage,
        changeData: changeData,
        analytics: analytics,
        enrollmentController: subscriptionController);
  });

  test('getCertificateWithSocialName', () {
    controller.getCertificateWithSocialName();
    expect(controller.certificateWithSocialName, false);
  });

  test('getUserName', () {
    controller.getUserName();
    expect(controller.name, name);
  });

  test('getUserSocialName', () {
    controller.getUserSocialName();
    expect(controller.socialName, socialName);
    expect(controller.wantSocialName, true);
  });

  test('setWantSocialName', () {
    controller.setWantSocialName(true);
    expect(controller.wantSocialName, true);
    expect(controller.certificateWithSocialName, true);
    expect(controller.socialNameToChange, '');
  });

  test('setName', () {
    var str = 'Name To Change';
    controller.setName(str);
    expect(controller.nameToChange, str);
  });

  test('setUserSocialName', () {
    var str = 'Name To Change';
    controller.setUserSocialName(str);
    expect(controller.socialNameToChange, str);
  });

  test('validateName if name is empty : false', () {
    controller.nameToChange = '';
    expect(controller.validateName(), false);
    expect(controller.error, 'Campo "Nome" obrigatório!');
  });

  test('validateName if name is complete : false', () {
    controller.nameToChange = 'Name';
    expect(controller.validateName(), false);
    expect(controller.error, 'Preencha seu nome completo!');
  });

  test('validateName : true', () {
    controller.nameToChange = 'Name Complete';
    expect(controller.validateName(), true);
  });

  test('validateSocialName : false', () {
    controller.socialNameToChange = '';
    controller.wantSocialName = true;
    expect(controller.validateSocialName(), false);
  });

  test('validateSocialName : true', () {
    controller.socialNameToChange = 'Name Complete';
    controller.wantSocialName = true;
    expect(controller.validateSocialName(), true);
  });

  test('setIsLoading', () {
    controller.setIsLoading(true);
    expect(controller.isLoading, true);
  });

  test('setCertificateWithSocialName', () {
    controller.setCertificateWithSocialName(true);
    expect(controller.certificateWithSocialName, true);
  });
}
