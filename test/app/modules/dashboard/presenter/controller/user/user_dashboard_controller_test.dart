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
import 'package:smile_front/app/modules/dashboard/infra/models/schedule_activity_model.dart';
import 'package:smile_front/app/modules/dashboard/infra/models/speaker_activity_model.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/user_dashboard_controller.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';
import 'package:smile_front/app/shared/services/firebase-analytics/firebase_analytics_service.dart';
import '../../../../../../setup_firebase_mocks.dart';
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
  GetUserSubscribedActivitiesInterface getUserActivities =
      MockGetUserSubscribedActivitiesInterface();
  ChangeDataInterface changeData = MockChangeDataInterface();
  FirebaseAnalyticsService analytics = MockFirebaseAnalyticsService();
  SecureStorageInterface secureStorage = MockSecureStorageInterface();

  late UserDashboardController controller;

  final mockActivities = <ActivityModel>[
    ActivityModel(
      id: '0',
      activityCode: 'C01',
      type: ActivityEnum.CURSOS,
      title: 'Atividade 01',
      description: 'Teste de atividade mock',
      speakers: [
        SpeakerActivityModel(
          name: 'Gabriel Godoy',
          bio: 'Qualquer',
          company: 'Oracle',
        ),
      ],
      schedule: <ScheduleActivityModel>[
        ScheduleActivityModel(
          date: DateTime.utc(2022, 03, 14, 13),
          totalParticipants: 20,
          location: 'H244',
          acceptSubscription: false,
        ),
      ],
    ),
    ActivityModel(
      id: '0',
      activityCode: 'C01',
      type: ActivityEnum.CURSOS,
      title: 'Atividade 01',
      description: 'Teste de atividade mock',
      speakers: [
        SpeakerActivityModel(
          name: 'Gabriel Godoy',
          bio: 'Qualquer',
          company: 'Oracle',
        ),
      ],
      schedule: <ScheduleActivityModel>[
        ScheduleActivityModel(
          date: DateTime.utc(2022, 03, 15, 13),
          totalParticipants: 20,
          location: 'H244',
          acceptSubscription: false,
        ),
      ],
    ),
    ActivityModel(
      id: '0',
      activityCode: 'C01',
      type: ActivityEnum.CURSOS,
      title: 'Atividade 01',
      description: 'Teste de atividade mock',
      speakers: [
        SpeakerActivityModel(
          name: 'Gabriel Godoy',
          bio: 'Qualquer',
          company: 'Oracle',
        ),
      ],
      schedule: <ScheduleActivityModel>[
        ScheduleActivityModel(
          date: DateTime.utc(2022, 03, 16, 13),
          totalParticipants: 20,
          location: 'H244',
          acceptSubscription: false,
        ),
      ],
    ),
    ActivityModel(
      id: '1',
      activityCode: 'C01',
      type: ActivityEnum.CURSOS,
      title: 'Atividade 02',
      description: 'Teste de atividade mock',
      speakers: [
        SpeakerActivityModel(
          name: 'Gabriel Godoy',
          bio: 'Qualquer',
          company: 'Oracle',
        ),
      ],
      schedule: <ScheduleActivityModel>[
        ScheduleActivityModel(
          date: DateTime.utc(2022, 03, 17, 13),
          totalParticipants: 20,
          location: 'H244',
          acceptSubscription: false,
        ),
      ],
    ),
    ActivityModel(
      id: '2',
      activityCode: 'C01',
      type: ActivityEnum.CURSOS,
      title: 'Atividade 03',
      description: 'Teste de atividade mock',
      speakers: [
        SpeakerActivityModel(
          name: 'Gabriel Godoy',
          bio: 'Qualquer',
          company: 'Oracle',
        ),
      ],
      schedule: <ScheduleActivityModel>[
        ScheduleActivityModel(
          date: DateTime.utc(2022, 03, 18, 13),
          totalParticipants: 20,
          location: 'H244',
          acceptSubscription: false,
        ),
      ],
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
    when(secureStorage.getCertificateWithSocialName())
        .thenAnswer((_) async => certificateWithSocialName);
    controller = UserDashboardController(
        getUserActivities: getUserActivities,
        secureStorage: secureStorage,
        changeData: changeData,
        analytics: analytics);
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

  test('getUserSubscribedActivities', () {
    controller.getUserSubscribedActivities();
    expect(controller.subscribedActivitiesList.isNotEmpty, true);
    expect(controller.nextActivity.id.isNotEmpty, true);
  });

  test('getNextActivity', () {
    controller.getNextActivity();
    expect(controller.nextActivity, mockActivities[0]);
  });

  test('mondayActivitiesList', () {
    expect(controller.mondayActivitiesList.isNotEmpty, true);
  });

  test('tuesdayActivitiesList', () {
    expect(controller.tuesdayActivitiesList.isNotEmpty, true);
  });

  test('wednesdayActivitiesList', () {
    expect(controller.wednesdayActivitiesList.isNotEmpty, true);
  });

  test('thursdayActivitiesList', () {
    expect(controller.thursdayActivitiesList.isNotEmpty, true);
  });

  test('fridayActivitiesList', () {
    expect(controller.fridayActivitiesList.isNotEmpty, true);
  });

  test('saturdayActivitiesList', () {
    expect(controller.saturdayActivitiesList.isNotEmpty, false);
  });

  test('toggleFilterActivityChipIndex', () {
    controller.toggleFilterActivityChipIndex(1);
    expect(controller.weekActivitiesList, controller.tuesdayActivitiesList);
  });
}
