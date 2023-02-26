import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/user_subscription_controller.dart';

part 'more_info_controller.g.dart';

class MoreInfoController = MoreInfoControllerBase with _$MoreInfoController;

abstract class MoreInfoControllerBase with Store {
  final UserEnrollmentController enrollmentController;
  MoreInfoControllerBase({required this.enrollmentController});

  @observable
  bool isLoading = false;

  @action
  void setIsLoading(bool value) {
    isLoading = value;
  }

  Future<void> subscribeUserActivity(String activityCode) async {
    setIsLoading(true);
    var requestDone =
        await enrollmentController.subscribeActivity(activityCode);
    if (requestDone) {}
    setIsLoading(false);
  }

  Future<void> unsubscribeUserActivity(String activityCode) async {
    setIsLoading(true);
    var requestDone =
        await enrollmentController.unsubscribeActivity(activityCode);
    if (requestDone) {}
    setIsLoading(false);
  }
}
