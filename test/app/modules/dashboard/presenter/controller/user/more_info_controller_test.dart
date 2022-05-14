import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/more_info_controller.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/user_dashboard_controller.dart';
import 'package:smile_front/app/shared/entities/card_activity.dart';

import 'all_activities_user_dashboard_controller_test.mocks.dart';

@GenerateMocks([ActivitiesRepositoryInterface, UserDashboardController])
void main() {
  ActivitiesRepositoryInterface repository =
      MockActivitiesRepositoryInterface();
  UserDashboardController userDashboardController =
      MockUserDashboardController();
  late MoreInfoController controller;
  var card = CardActivity(
    acceptSubscription: true,
    enrolledUsers: 10,
    id: '123',
    activityCode: 'PA01',
    type: ActivityEnum.ACADEMIA_DE_PROFESSORES,
    title: 'Title',
    description: 'Description',
    date: DateTime.now(),
    duration: DateTime.now(),
    totalParticipants: 10,
    location: 'location',
    link: 'link',
  );

  setUpAll(() async {
    when(userDashboardController.allActivitiesToCards).thenReturn([card]);
    controller = MoreInfoController(
        repository: repository,
        activity: card,
        registered: false,
        userDashboardController: userDashboardController);
  });

  test('setIsRegistered', () {
    controller.setIsRegistered(true);
    expect(controller.isRegistered, true);
  });

  test('setIsLoading', () {
    controller.setIsLoading(true);
    expect(controller.isLoading, true);
  });

  test('checkIsOkForSubscribe : false', () {
    expect(controller.checkIsOkForSubscribe(), false);
  });

  test('checkIsOkForSubscribe : true', () {
    when(userDashboardController.allActivitiesToCards).thenReturn([]);
    expect(controller.checkIsOkForSubscribe(), true);
  });
}
