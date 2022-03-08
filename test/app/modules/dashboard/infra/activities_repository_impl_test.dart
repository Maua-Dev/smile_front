import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/infra/datasources/activities_datasource.dart';
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
        name: '',
        description: '',
        date: DateTime.now(),
        type: ActivityEnum.CURSOS,
        workload: 40),
    ActivityModel(
        id: '',
        name: '',
        description: '',
        date: DateTime.now(),
        type: ActivityEnum.CURSOS,
        workload: 40),
    ActivityModel(
        id: '',
        name: '',
        description: '',
        date: DateTime.now(),
        type: ActivityEnum.ACADEMIA_DE_PROFESSORES,
        workload: 40),
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
