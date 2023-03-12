import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smile_front/app/modules/auth/domain/repositories/secure_storage_interface.dart';
import 'package:smile_front/app/modules/auth/presenter/controllers/auth_controller.dart';
import 'package:smile_front/app/modules/auth/domain/usecases/login_with_email.dart';
import 'package:smile_front/app/modules/auth/domain/usecases/refresh_token.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/delete_activity.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/get_admin_activities_interface.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/get_download_link_csv.dart';
import 'package:smile_front/app/modules/dashboard/infra/models/speaker_activity_model.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/adm/adm_dashboard_controller.dart';
import 'package:smile_front/app/shared/models/responsible_professor_model.dart';
import 'package:smile_front/app/shared/models/admin_activity_model.dart';
import 'package:smile_front/app/shared/services/firebase-analytics/firebase_analytics_service.dart';

import '../../../../auth/presenter/controllers/auth_controller_test.mocks.dart';
import 'adm_dashboard_controller_test.mocks.dart';

@GenerateMocks([
  GetDownloadLinkCsvInterface,
  DeleteActivityInterface,
  GetAdminActivitiesInterface
])
void main() {
  GetDownloadLinkCsvInterface getDownloadLinkCsv =
      MockGetDownloadLinkCsvInterface();
  GetAdminActivitiesInterface getAdminActivities =
      MockGetAdminActivitiesInterface();
  LoginWithEmailInterface loginWithEmail = MockLoginWithEmailInterface();
  RefreshTokenInterface refreshToken = MockRefreshTokenInterface();
  DeleteActivityInterface deleteActivity = MockDeleteActivityInterface();

  late AdmDashboardController controller;

  SecureStorageInterface secureStorage = MockSecureStorageInterface();
  FirebaseAnalyticsService analytics = MockFirebaseAnalyticsService();

  late AuthController authController;

  final mockActivities = <AdminActivityModel>[
    AdminActivityModel(
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
      responsibleProfessor: ResponsibleProfessorModel.newInstance(),
      enrollments: [],
    ),
    AdminActivityModel(
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
      responsibleProfessor: ResponsibleProfessorModel.newInstance(),
      enrollments: [],
    ),
    AdminActivityModel(
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
      responsibleProfessor: ResponsibleProfessorModel.newInstance(),
      enrollments: [],
    ),
    AdminActivityModel(
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
      responsibleProfessor: ResponsibleProfessorModel.newInstance(),
      enrollments: [],
    ),
  ];

  setUpAll(() {
    when(getAdminActivities()).thenAnswer((_) async => mockActivities);
    when(getDownloadLinkCsv()).thenAnswer((_) async => '');
    authController = AuthController(
      refreshToken: refreshToken,
      loginWithEmail: loginWithEmail,
      storage: secureStorage,
      analytics: analytics,
    );
    controller = AdmDashboardController(
      getAdminActivities: getAdminActivities,
      getDownloadLinkCsv: getDownloadLinkCsv,
      authController: authController,
      deleteActivity: deleteActivity,
    );
  });

  test('setIsLoadingCsv', () {
    controller.setIsLoadingCsv(true);
    expect(controller.isLoadingCsv, true);
  });

  test('setDateFilter', () {
    var value = DateTime.utc(2022, 03, 18, 13);
    controller.setDateFilter(value);
    expect(controller.dateFilter, value);
  });

  test('setHourFilter', () {
    var value = DateTime.utc(2022, 03, 18, 13);
    controller.setHourFilter(value);
    expect(controller.hourFilter, value);
  });

  test('setAllFilters', () {
    if (controller.typeFilter == null &&
        controller.hourFilter == null &&
        controller.dateFilter == null) {
      expect(controller.activitiesList, mockActivities);
    }
  });

  test('resetFilters', () {
    controller.resetFilters();
    expect(controller.activitiesList, controller.allActivitiesList);
    expect(controller.typeFilter, null);
    expect(controller.dateFilter, null);
    expect(controller.hourFilter, null);
  });

  test('filterActivitiesByType', () {
    var type = ActivityEnum.COURSES;
    var list = mockActivities.where((element) => element.type == type).toList();
    expect(list, controller.filterActivitiesByType(type, mockActivities));
  });

  test('filterActivitiesByDate', () {
    var date = DateTime.utc(2022, 03, 18, 13);
    var list = mockActivities
        .where(
            (element) => controller.isValidDateFilter(element.startDate!, date))
        .toList();
    expect(list, controller.filterActivitiesByDate(date, mockActivities));
  });

  test('filterActivitiesByHour', () {
    var hour = DateTime.utc(2022, 03, 18, 13);
    var list = mockActivities
        .where(
            (element) => controller.isValidHourFilter(element.startDate!, hour))
        .toList();
    expect(list, controller.filterActivitiesByHour(hour, mockActivities));
  });

  test('setIsLoading', () {
    controller.setIsLoading(true);
    expect(controller.isLoading, true);
  });

  test('toggleFloatActionButton', () {
    controller.toggleFloatActionButton();
    expect(controller.isFloatActionButtonOpen, true);
  });

  test('getAllActivities', () {
    controller.getAllActivities();
    expect(controller.activitiesList.isNotEmpty, true);
    // expect(controller.nextActivitiesList.isNotEmpty, true);
  });

  test('logout', () {
    controller.logout();
    expect(authController.isLogged, false);
  });
}
