import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
//import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/get_user_subscribed_activities.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/subscribe_activities.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/unsubscribe_activities.dart';
//import 'package:smile_front/app/modules/dashboard/infra/models/speaker_activity_model.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/more_info_controller.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/user_dashboard_controller.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/user_subscription_controller.dart';
//import 'package:smile_front/app/shared/models/enrolls_activity_model.dart';
import 'more_info_controller_test.mocks.dart';
import 'user_dashboard_controller_test.mocks.dart';

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
  GetUserSubscribedActivitiesInterface getUserActivities =
      MockGetUserSubscribedActivitiesInterface();
  late MoreInfoController controller;
  late UserEnrollmentController subscriptionController;

  setUpAll(() async {
    await Firebase.initializeApp();
    controller =
        MoreInfoController(subscriptionController: subscriptionController);
    subscriptionController = UserEnrollmentController(
        getUserActivities: getUserActivities,
        subscribeActivity: subscribeActivity,
        unsubscribeActivity: unsubscribeActivity);
  });

  test('setIsLoading', () {
    controller.setIsLoading(true);
    expect(controller.isLoading, true);
  });
}
