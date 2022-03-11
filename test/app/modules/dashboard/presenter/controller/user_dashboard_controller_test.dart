import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/user_dashboard_controller.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';

import 'user_dashboard_controller_test.mocks.dart';

@GenerateMocks([ActivitiesRepositoryInterface])
void main() {
  ActivitiesRepositoryInterface repository =
      MockActivitiesRepositoryInterface();
  late UserDashboardController controller;
  final mockActivities = <ActivityModel>[
    ActivityModel(
        id: '',
        name: 'ABCD123',
        description: '',
        date: DateTime.now(),
        type: ActivityEnum.CURSOS,
        workload: 0),
    ActivityModel(
        id: '',
        name: 'ABCD',
        description: '',
        date: DateTime.now(),
        type: ActivityEnum.CURSOS,
        workload: 0),
    ActivityModel(
        id: '',
        name: 'ABCC',
        description: '',
        date: DateTime.now(),
        type: ActivityEnum.CURSOS,
        workload: 0),
  ];

  setUpAll(() {
    when(repository.getActivitiesSelectedByType(ActivityEnum.CURSOS))
        .thenAnswer((_) async => mockActivities);
    controller = UserDashboardController(
        activityType: ActivityEnum.CURSOS,
        repository: repository,
        accessLevel: 'ADMIN');
  });

  test('getActivities', () async {
    await controller.getActivitiesByType();
    expect(controller.activitiesList, mockActivities);
  });

  test('orderByDate', () {
    controller.orderByDate();
    expect(controller.activitiesList[0].date, isInstanceOf<DateTime>());
  });

  // test('orderByParticipants', () {
  //   controller.orderByParticipants();
  //   expect(controller.activitiesList[0].enrolledUsers, []);
  // });

  test('searchActivityByName', () {
    controller.searchActivityByName('ABCD');
    expect(controller.activitiesList.length, 2);
  });
}
