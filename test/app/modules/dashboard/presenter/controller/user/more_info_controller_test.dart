import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/subscribe_activities.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/unsubscribe_activities.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/more_info_controller.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/user_dashboard_controller.dart';
import 'package:smile_front/app/shared/entities/card_activity.dart';

import 'more_info_controller_test.mocks.dart';

@GenerateMocks([
  ActivitiesRepositoryInterface,
  UserDashboardController,
  UnsubscribeActivityInterface,
  SubscribeActivityInterface
])
void main() {
  UnsubscribeActivityInterface unsubscribeActivity =
      MockUnsubscribeActivityInterface();
  SubscribeActivityInterface subscribeActivity =
      MockSubscribeActivityInterface();
  UserDashboardController userDashboardController =
      MockUserDashboardController();
  late MoreInfoController controller;
  var card = CardActivity(
    acceptSubscription: true,
    enrolledUsers: 10,
    id: '123',
    activityCode: 'PA01',
    type: ActivityEnum.PROFESSORS_ACADEMY,
    title: 'Title',
    description: 'Description',
    date: DateTime.now(),
    duration: 0,
    totalParticipants: 10,
    location: 'location',
    link: 'link',
  );

  setUpAll(() async {
    when(userDashboardController.allActivitiesToCards).thenReturn([card]);
    controller = MoreInfoController(
        unsubscribeActivity: unsubscribeActivity,
        subscribeActivity: subscribeActivity,
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
