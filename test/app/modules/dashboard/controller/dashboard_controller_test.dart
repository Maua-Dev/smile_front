import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart';
import 'package:smile_front/app/modules/dashboard/infra/models/activity_model.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/dashboard_controller.dart';

import 'dashboard_controller_test.mocks.dart';

@GenerateMocks([ActivitiesRepositoryInterface])
void main() {
  ActivitiesRepositoryInterface repository =
      MockActivitiesRepositoryInterface();
  late DashboardController controller;
  final mockActivities = <ActivityModel>[
    ActivityModel(
        id: '',
        enrolledUsers: [],
        name: 'ABCD123',
        description: '',
        date: DateTime.now(),
        type: ActivityEnum.CURSOS,
        createdAt: '',
        updateAt: '',
        workload: 0),
    ActivityModel(
        id: '',
        enrolledUsers: [],
        name: 'ABCD',
        description: '',
        date: DateTime.now(),
        type: ActivityEnum.CURSOS,
        createdAt: '',
        updateAt: '',
        workload: 0),
    ActivityModel(
        id: '',
        enrolledUsers: [],
        name: 'ABCC',
        description: '',
        date: DateTime.now(),
        type: ActivityEnum.CURSOS,
        createdAt: '',
        updateAt: '',
        workload: 0),
  ];

  setUpAll(() {
    when(repository.getActivitiesSelectedByType(ActivityEnum.CURSOS))
        .thenAnswer((_) async => mockActivities);
    controller = DashboardController(
        activityType: ActivityEnum.CURSOS, repository: repository);
  });

  test('getActivities', () async {
    await controller.getActivities();
    expect(controller.activitiesList, mockActivities);
  });

  test('orderByDate', () {
    controller.orderByDate();
    expect(controller.activitiesList[0].date, isInstanceOf<DateTime>());
  });

  test('orderByParticipants', () {
    controller.orderByParticipants();
    expect(controller.activitiesList[0].enrolledUsers, []);
  });

  test('searchActivityByName', () {
    controller.searchActivityByName('ABCD');
    expect(controller.activitiesList.length, 2);
  });
}
