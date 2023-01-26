import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smile_front/app/modules/auth/domain/repositories/secure_storage_interface.dart';
import 'package:smile_front/app/modules/auth/presenter/controllers/auth_controller.dart';
import 'package:smile_front/app/modules/auth/usecases/login_with_cpf_rne.dart';
import 'package:smile_front/app/modules/auth/usecases/refresh_token.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/get_all_activities.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/get_download_link_csv.dart';
import 'package:smile_front/app/modules/dashboard/infra/models/schedule_activity_model.dart';
import 'package:smile_front/app/modules/dashboard/infra/models/speaker_activity_model.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/adm/adm_dashboard_controller.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';
import 'package:smile_front/app/shared/services/firebase-analytics/firebase_analytics_service.dart';

import '../../../../auth/presenter/controllers/auth_controller_test.mocks.dart';
import '../user/all_activities_user_dashboard_controller_test.mocks.dart' as u;
import 'adm_dashboard_controller_test.mocks.dart';

@GenerateMocks([
  GetDownloadLinkCsvInterface,
])
void main() {
  GetDownloadLinkCsvInterface getDownloadLinkCsv =
      MockGetDownloadLinkCsvInterface();
  GetAllUserActivitiesInterface getAllUserActivities =
      u.MockGetAllUserActivitiesInterface();
  LoginWithCpfRneInterface loginWithCpfRne = MockLoginWithCpfRneInterface();
  RefreshTokenInterface refreshToken = MockRefreshTokenInterface();

  late AdmDashboardController controller;

  SecureStorageInterface secureStorage = MockSecureStorageInterface();
  FirebaseAnalyticsService analytics = MockFirebaseAnalyticsService();

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
          isExtensive: false,
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
          isExtensive: false,
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
          isExtensive: false,
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
          isExtensive: false,
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
          isExtensive: false,
        ),
      ],
    ),
  ];

  setUpAll(() {
    when(getAllUserActivities()).thenAnswer((_) async => mockActivities);
    when(getDownloadLinkCsv()).thenAnswer((_) async => '');
    authController = AuthController(
        refreshToken: refreshToken,
        loginWithCpfRne: loginWithCpfRne,
        storage: secureStorage,
        analytics: analytics);
    controller = AdmDashboardController(
      getAllUserActivities: getAllUserActivities,
      getDownloadLinkCsv: getDownloadLinkCsv,
      authController: authController,
    );
  });

  test('setIsLoadingCsv', () {
    controller.setIsLoadingCsv(true);
    expect(controller.isLoadingCsv, true);
  });

  test('setIsLoading', () {
    controller.setIsLoading(true);
    expect(controller.isLoading, true);
  });

  test('toggleFloatActionButton', () {
    controller.toggleFloatActionButton();
    expect(controller.isFloatActionButtonOpen, true);
  });

  test(
      'toggleFilterActivityChipIndex if index == filterActivityChipIndexSelected',
      () {
    controller.toggleFilterActivityChipIndex(0);
    expect(controller.activitiesList, controller.saveActivitiesList);
  });

  test('toggleFilterActivityChipIndex else', () {
    controller.filterActivityChipIndexSelected = 0;
    controller.toggleFilterActivityChipIndex(1);
    expect(controller.filterActivityChipIndexSelected, 1);
  });

  test('getAllActivities', () {
    controller.getAllActivities();
    expect(controller.activitiesList.isNotEmpty, true);
    expect(controller.nextActivitiesList.isNotEmpty, true);
  });

  test('getActivitiesByType', () {
    controller.getActivitiesByType(0);
    expect(controller.activitiesList.length, 5);
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

  test('sundayActivitiesList', () {
    expect(controller.sundayActivitiesList.isNotEmpty, false);
  });

  test('logout', () {
    controller.logout();
    expect(authController.isLogged, false);
  });
}
