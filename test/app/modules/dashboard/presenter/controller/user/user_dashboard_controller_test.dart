import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smile_front/app/modules/auth/domain/repositories/secure_storage_interface.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart';
import 'package:smile_front/app/modules/dashboard/domain/repositories/user_repository_interface.dart';
import 'package:smile_front/app/modules/dashboard/infra/models/schedule_activity_model.dart';
import 'package:smile_front/app/modules/dashboard/infra/models/speaker_activity_model.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/user_dashboard_controller.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';
import 'user_dashboard_controller_test.mocks.dart';

@GenerateMocks([
  ActivitiesRepositoryInterface,
  SecureStorageInterface,
  UserRepositoryInterface
])
void main() {
  ActivitiesRepositoryInterface repository =
      MockActivitiesRepositoryInterface();

  UserRepositoryInterface userRepository = MockUserRepositoryInterface();

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

  setUpAll(() {
    when(repository.getUserSubscribedActivities())
        .thenAnswer((_) async => mockActivities);
    controller = UserDashboardController(
        repository: repository,
        secureStorage: secureStorage,
        userRepository: userRepository);
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
}
