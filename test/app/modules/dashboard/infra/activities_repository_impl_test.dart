import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/infra/datasources/activities_datasource.dart';
import 'package:smile_front/app/modules/dashboard/infra/models/speaker_activity_model.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';
import 'package:smile_front/app/modules/dashboard/infra/repository/activities_repository_impl.dart';

import 'activities_repository_impl_test.mocks.dart';

@GenerateMocks([ActivitiesDatasource])
void main() {
  late ActivitiesRepositoryImpl repository;
  ActivitiesDatasource datasource = MockActivitiesDatasource();
  var activitiesList = <ActivityModel>[
    ActivityModel(
        id: '',
        type: ActivityEnum.ACADEMIA_DE_PROFESSORES,
        title: 'ABCD123',
        description: '',
        date: DateTime.now(),
        hour: DateTime.now(),
        totalParticipants: 10,
        location: '',
        speaker: SpeakerActivityModel(
            bio: '', company: '', name: '', linkPhoto: '')),
    ActivityModel(
        id: '',
        type: ActivityEnum.CURSOS,
        title: 'ABCD123',
        description: '',
        date: DateTime.now(),
        hour: DateTime.now(),
        totalParticipants: 10,
        location: '',
        speaker: SpeakerActivityModel(
            bio: '', company: '', name: '', linkPhoto: '')),
    ActivityModel(
        id: '',
        type: ActivityEnum.CURSOS,
        title: 'ABCD123',
        description: '',
        date: DateTime.now(),
        hour: DateTime.now(),
        totalParticipants: 10,
        location: '',
        speaker: SpeakerActivityModel(
            bio: '', company: '', name: '', linkPhoto: '')),
  ];

  setUpAll(() {
    repository = ActivitiesRepositoryImpl(datasource: datasource);
    when(datasource.getAllActivities()).thenAnswer((_) async => activitiesList);
  });

  test('getActivitiesSelectedByType', () async {
    var list =
        await repository.getActivitiesSelectedByType(ActivityEnum.CURSOS);
    expect(list.isNotEmpty, true);
    expect(list.length, 2);
  });
}
