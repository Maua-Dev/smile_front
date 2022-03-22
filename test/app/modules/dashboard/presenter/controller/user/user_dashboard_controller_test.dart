import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smile_front/app/modules/auth/domain/repositories/auth_repository_interface.dart';
import 'package:smile_front/app/modules/auth/domain/repositories/secure_storage_interface.dart';
import 'package:smile_front/app/modules/auth/presenter/controllers/auth_controller.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart';
import 'package:smile_front/app/modules/dashboard/infra/models/schedule_activity_model.dart';
import 'package:smile_front/app/modules/dashboard/infra/models/speaker_activity_model.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/user_dashboard_controller.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';
import 'package:smile_front/app/shared/models/user_model.dart';

import '../../../../auth/presenter/controllers/auth_controller_test.mocks.dart';
import '../../../../login/presenter/controller/login_controller_test.mocks.dart';

@GenerateMocks([ActivitiesRepositoryInterface])
void main() {
  ActivitiesRepositoryInterface repository =
      MockActivitiesRepositoryInterface();
  AuthRepositoryInterface authRepository = MockAuthRepositoryInterface();
  SecureStorageInterface secureStorage = MockSecureStorageInterface();
  late UserDashboardController controller;
  late AuthController authController;

  final userMock = UserModel(
    email: '',
    cpfRne: '',
    accessLevel: '',
    typeRole: '',
    socialName: 'Gabriel Godoy',
  );

  final mockActivities = <ActivityModel>[
    ActivityModel(
      id: '0',
      activityCode: 'C01',
      type: ActivityEnum.CURSOS,
      title: 'Atividade 01',
      description: 'Teste de atividade mock',
      location: 'H244',
      speaker: [
        SpeakerActivityModel(
          name: 'Gabriel Godoy',
          bio: 'Qualquer',
          company: 'Oracle',
          linkPhoto: 'http://',
        ),
      ],
      schedule: <ScheduleActivityModel>[
        ScheduleActivityModel(
          date: DateTime.utc(2022, 03, 14, 13),
          totalParticipants: 20,
        ),
      ],
    ),
    ActivityModel(
      id: '0',
      activityCode: 'C01',
      type: ActivityEnum.CURSOS,
      title: 'Atividade 01',
      description: 'Teste de atividade mock',
      location: 'H244',
      speaker: [
        SpeakerActivityModel(
          name: 'Gabriel Godoy',
          bio: 'Qualquer',
          company: 'Oracle',
          linkPhoto: 'http://',
        ),
      ],
      schedule: <ScheduleActivityModel>[
        ScheduleActivityModel(
          date: DateTime.utc(2022, 03, 15, 13),
          totalParticipants: 20,
        ),
      ],
    ),
    ActivityModel(
      id: '0',
      activityCode: 'C01',
      type: ActivityEnum.CURSOS,
      title: 'Atividade 01',
      description: 'Teste de atividade mock',
      location: 'H244',
      speaker: [
        SpeakerActivityModel(
          name: 'Gabriel Godoy',
          bio: 'Qualquer',
          company: 'Oracle',
          linkPhoto: 'http://',
        ),
      ],
      schedule: <ScheduleActivityModel>[
        ScheduleActivityModel(
          date: DateTime.utc(2022, 03, 16, 13),
          totalParticipants: 20,
        ),
      ],
    ),
    ActivityModel(
      id: '1',
      activityCode: 'C01',
      type: ActivityEnum.CURSOS,
      title: 'Atividade 02',
      description: 'Teste de atividade mock',
      location: 'H244',
      speaker: [
        SpeakerActivityModel(
          name: 'Gabriel Godoy',
          bio: 'Qualquer',
          company: 'Oracle',
          linkPhoto: 'http://',
        ),
      ],
      schedule: <ScheduleActivityModel>[
        ScheduleActivityModel(
          date: DateTime.utc(2022, 03, 17, 13),
          totalParticipants: 20,
        ),
      ],
    ),
    ActivityModel(
      id: '2',
      activityCode: 'C01',
      type: ActivityEnum.CURSOS,
      title: 'Atividade 03',
      description: 'Teste de atividade mock',
      location: 'H244',
      speaker: [
        SpeakerActivityModel(
          name: 'Gabriel Godoy',
          bio: 'Qualquer',
          company: 'Oracle',
          linkPhoto: 'http://',
        ),
      ],
      schedule: <ScheduleActivityModel>[
        ScheduleActivityModel(
          date: DateTime.utc(2022, 03, 18, 13),
          totalParticipants: 20,
        ),
      ],
    ),
  ];

  setUpAll(() {
    when(repository.getUserSubscribedActivities())
        .thenAnswer((_) async => mockActivities);
    when(repository.getUser()).thenAnswer((_) async => userMock);
    authController =
        AuthController(authRepository: authRepository, storage: secureStorage);

    controller = UserDashboardController(
      repository: repository,
      authController: authController,
    );
  });

  test('getUserSubscribedActivities', () {
    controller.getUserSubscribedActivities();
    expect(controller.activitiesList.isNotEmpty, true);
    expect(controller.nextActivity.id.isNotEmpty, true);
  });

  test('getNextActivity', () {
    controller.getNextActivity();
    expect(controller.nextActivity, mockActivities[0]);
  });

  test('getUser', () {
    controller.getUser();
    expect(controller.user, userMock);
  });

  test('getUserFirstName', () {
    controller.getUser();
    expect(controller.userName.length, 7);
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

  test('logout', () {
    controller.logout();
    expect(authController.isLogged, false);
  });
}
