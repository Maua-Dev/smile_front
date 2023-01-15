import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smile_front/app/app_module.dart';
import 'package:smile_front/app/modules/auth/domain/repositories/secure_storage_interface.dart';
import 'package:smile_front/app/modules/auth/presenter/controllers/auth_controller.dart';
import 'package:smile_front/app/modules/auth/usecases/login_with_cpf_rne.dart';
import 'package:smile_front/app/modules/auth/usecases/refresh_token.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/get_all_activities.dart';
import 'package:smile_front/app/modules/dashboard/infra/models/schedule_activity_model.dart';
import 'package:smile_front/app/modules/dashboard/infra/models/speaker_activity_model.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/all_activities_user_dashboard_controller.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/user_dashboard_controller.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';
import 'package:smile_front/app/shared/services/firebase-analytics/firebase_analytics_service.dart';

import '../../../../../../setup_firebase_mocks.dart';
import '../../../../auth/presenter/controllers/auth_controller_test.mocks.dart';
import 'all_activities_user_dashboard_controller_test.mocks.dart';

@GenerateMocks([
  ActivitiesRepositoryInterface,
  UserDashboardController,
  GetAllUserActivitiesInterface,
  RefreshTokenInterface,
  LoginWithCpfRneInterface,
])
void main() {
  initModule(AppModule());
  setupCloudFirestoreMocks();
  GetAllUserActivitiesInterface getAllUserActivitiesInterface =
      MockGetAllUserActivitiesInterface();
  RefreshTokenInterface refreshToken = MockRefreshTokenInterface();
  LoginWithCpfRneInterface loginWithCpfRne = MockLoginWithCpfRneInterface();
  SecureStorageInterface secureStorage = MockSecureStorageInterface();
  UserDashboardController userDashboardController =
      MockUserDashboardController();
  FirebaseAnalyticsService analytics = MockFirebaseAnalyticsService();

  late AllActivitiesUserDashboardController controller;
  late AuthController authController;

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

  setUpAll(() async {
    await Firebase.initializeApp();
    when(getAllUserActivitiesInterface())
        .thenAnswer((_) async => mockActivities);
    authController = AuthController(
        loginWithCpfRne: loginWithCpfRne,
        refreshToken: refreshToken,
        storage: secureStorage,
        analytics: analytics);

    controller = AllActivitiesUserDashboardController(
      getAllActivities: getAllUserActivitiesInterface,
      authController: authController,
      controller: userDashboardController,
      analytics: analytics,
    );
  });

  test('setIsLoading', () {
    controller.setIsLoading(true);
    expect(controller.isLoading, true);
  });

  test('getAllActivities', () {
    controller.getAllActivities();
    expect(controller.activitiesList.isNotEmpty, true);
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
    controller.toggleFilterActivityChipIndex(0);
    expect(controller.weekActivitiesList, controller.mondayActivitiesList);
  });

  test('getActivitiesByType', () {
    controller.getActivitiesByType(ActivityEnum.CURSOS);
    expect(controller.activitiesList.length, 5);
  });

  test('logout', () {
    controller.logout();
    expect(authController.isLogged, false);
  });
}
