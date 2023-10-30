import 'package:mobx/mobx.dart';
import '../../../../../shared/infra/models/enrolls_activity_model.dart';
import '../../../domain/usecases/get_user_subscribed_activities.dart';
import '../../../domain/usecases/subscribe_activities.dart';
import '../../../domain/usecases/unsubscribe_activities.dart';

part 'user_subscription_controller.g.dart';

class UserEnrollmentController = UserEnrollmentControllerBase
    with _$UserEnrollmentController;

abstract class UserEnrollmentControllerBase with Store {
  final SubscribeActivityInterface subscribeActivity;
  final UnsubscribeActivityInterface unsubscribeActivity;
  final GetUserSubscribedActivitiesInterface getUserActivities;

  UserEnrollmentControllerBase(
      {required this.getUserActivities,
      required this.subscribeActivity,
      required this.unsubscribeActivity});

  @observable
  bool isLoading = false;

  @action
  void setIsLoading(bool value) {
    isLoading = !isLoading;
  }

  @observable
  var subscribedActivities = List<EnrollsActivityModel>.empty();

  @observable
  var allActivitiesWithEnrollments = List<EnrollsActivityModel>.empty();

  @action
  Future getUserAllActivitiesWithEnrollment() async {
    setIsLoading(true);
    allActivitiesWithEnrollments = await getUserActivities();
    subscribedActivities = List.empty();
    for (var activity in allActivitiesWithEnrollments) {
      if (activity.enrollments != null) {
        subscribedActivities = <EnrollsActivityModel>[
          ...subscribedActivities,
          activity
        ];
      }
    }
    setIsLoading(false);
  }
}
