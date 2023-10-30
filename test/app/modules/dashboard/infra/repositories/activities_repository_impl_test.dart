import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/infra/datasources/activities_datasource_interface.dart';
import 'package:smile_front/app/modules/dashboard/infra/models/speaker_activity_model.dart';
import 'package:smile_front/app/modules/dashboard/infra/repository/activities_repository_impl.dart';
import 'package:smile_front/app/shared/domain/enum/enrollment_state_enum.dart';
import 'package:smile_front/app/shared/infra/models/activity_model.dart';
import 'package:smile_front/app/shared/infra/models/admin_activity_model.dart';
import 'package:smile_front/app/shared/infra/models/enrollments_model.dart';

import 'activities_repository_impl_test.mocks.dart';

@GenerateMocks([ActivitiesDatasourceInterface])
void main() {
  late ActivitiesRepositoryImpl repository;
  ActivitiesDatasourceInterface datasource =
      MockActivitiesDatasourceInterface();
  final mockActivities = <ActivityModel>[
    ActivityModel(
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
    ActivityModel(
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
    ActivityModel(
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
  ];

  setUpAll(() {
    when(datasource.editActivity('', AdminActivityModel.newInstance()))
        .thenAnswer((_) async => null);
    when(datasource.deleteActivity('')).thenAnswer((_) async => null);
    when(datasource.postUnsubscribe('')).thenAnswer((_) async => true);
    when(datasource.postSubscribe('')).thenAnswer((_) async => EnrollmentsModel(
          state: EnrollmentStateEnum.ENROLLED,
          dateSubscribed: DateTime.now(),
        ));
    when(datasource.createActivity(AdminActivityModel.newInstance()))
        .thenAnswer((_) async => null);
    when(datasource.getAllActivities()).thenAnswer((_) async => mockActivities);
    repository = ActivitiesRepositoryImpl(datasource: datasource);
  });

  test('getAllActivities if activitiesList is empty', () async {
    repository.getAllActivities();
    expect(repository.activitiesList.isNotEmpty, false);
  });

  test('getAllActivities', () async {
    repository.activitiesList = [ActivityModel.newInstance()];
    repository.getAllActivities();
    expect(repository.activitiesList.isNotEmpty, true);
  });
}
