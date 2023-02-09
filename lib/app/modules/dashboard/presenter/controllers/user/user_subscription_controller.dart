import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/dashboard/infra/models/user_enrolled_activities_model.dart';
import '../../../domain/usecases/get_user_subscribed_activities.dart';
import '../../../domain/usecases/subscribe_activities.dart';
import '../../../domain/usecases/unsubscribe_activities.dart';

part 'user_subscription_controller.g.dart';

class UserSubscriptionController = UserSubscriptionControllerBase
    with _$UserSubscriptionController;

abstract class UserSubscriptionControllerBase with Store {
  final SubscribeActivityInterface subscribeActivity;
  final UnsubscribeActivityInterface unsubscribeActivity;
  final GetUserSubscribedActivitiesInterface getUserActivities;

  UserSubscriptionControllerBase(
      {required this.getUserActivities,
      required this.subscribeActivity,
      required this.unsubscribeActivity}) {
    getUserEnrolledActivities();
  }

  @observable
  bool isLoading = false;

  @action
  void setIsLoading() {
    isLoading = !isLoading;
  }

  @observable
  List<UserEnrolledActivitiesModel> userEnrolledActivities = [];

  @action
  Future getUserEnrolledActivities() async {
    userEnrolledActivities = await getUserActivities();
  }
}
