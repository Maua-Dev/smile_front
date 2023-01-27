import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/modality_activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/infra/datasources/activities_datasource_interface.dart';
import 'package:smile_front/app/modules/dashboard/infra/models/schedule_activity_model.dart';
import 'package:smile_front/app/modules/dashboard/infra/models/speaker_activity_model.dart';
import 'package:smile_front/app/modules/dashboard/infra/repository/activities_repository_impl.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';

import 'activities_repository_impl_test.mocks.dart';

@GenerateMocks([ActivitiesDatasourceInterface])
void main() {
  late ActivitiesRepositoryImpl repository;
  ActivitiesDatasourceInterface datasource =
      MockActivitiesDatasourceInterface();
  final mockActivities = <ActivityModel>[
    ActivityModel(
      id: '0',
      modality: ModalityActivityEnum.hibrida,
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
      schedule: ScheduleActivityModel(
        date: DateTime.utc(2022, 03, 14, 13),
        totalParticipants: 20,
        location: 'H244',
        acceptSubscription: false,
        isExtensive: false,
      ),
    ),
    ActivityModel(
      id: '0',
      modality: ModalityActivityEnum.presencial,
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
      schedule: ScheduleActivityModel(
        date: DateTime.utc(2022, 03, 15, 13),
        totalParticipants: 20,
        location: 'H244',
        acceptSubscription: false,
        isExtensive: false,
      ),
    ),
    ActivityModel(
      id: '0',
      modality: ModalityActivityEnum.online,
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
      schedule: ScheduleActivityModel(
        date: DateTime.utc(2022, 03, 16, 13),
        totalParticipants: 20,
        location: 'H244',
        acceptSubscription: false,
        isExtensive: false,
      ),
    ),
    ActivityModel(
      id: '1',
      modality: ModalityActivityEnum.online,
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
      schedule: ScheduleActivityModel(
        date: DateTime.utc(2022, 03, 17, 13),
        totalParticipants: 20,
        location: 'H244',
        acceptSubscription: false,
        isExtensive: false,
      ),
    ),
    ActivityModel(
      id: '2',
      activityCode: 'C01',
      modality: ModalityActivityEnum.online,
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
      schedule: ScheduleActivityModel(
        date: DateTime.utc(2022, 03, 18, 13),
        totalParticipants: 20,
        location: 'H244',
        acceptSubscription: false,
        isExtensive: false,
      ),
    ),
  ];

  setUpAll(() {
    when(datasource.putActivity('', ActivityModel.newInstance()))
        .thenAnswer((_) async => null);
    when(datasource.removeActivity('')).thenAnswer((_) async => null);
    when(datasource.postUnsubscribe('', DateTime.now()))
        .thenAnswer((_) async => true);
    when(datasource.postSubscribe('', DateTime.now()))
        .thenAnswer((_) async => true);
    when(datasource.postActivity(ActivityModel.newInstance()))
        .thenAnswer((_) async => null);
    when(datasource.getUserSubscribedActivities())
        .thenAnswer((_) async => mockActivities);
    when(datasource.getAllActivities()).thenAnswer((_) async => mockActivities);
    repository = ActivitiesRepositoryImpl(datasource: datasource);
  });

  test('getAllActivities if activitiesList is empty', () async {
    repository.getAllActivities();
    expect(repository.subscribedActivities.isNotEmpty, false);
  });

  test('getAllActivities', () async {
    repository.activitiesList = [ActivityModel.newInstance()];
    repository.getAllActivities();
    expect(repository.activitiesList.isNotEmpty, true);
  });

  test('getUserSubscribedActivities if subscribedActivities is empty',
      () async {
    repository.getUserSubscribedActivities();
    expect(repository.subscribedActivities.isNotEmpty, false);
  });

  test('getUserSubscribedActivities', () async {
    repository.subscribedActivities = [ActivityModel.newInstance()];
    repository.getUserSubscribedActivities();
    expect(repository.subscribedActivities.isNotEmpty, true);
  });
}
