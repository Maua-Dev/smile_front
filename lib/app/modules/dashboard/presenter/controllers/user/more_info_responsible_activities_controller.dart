import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/get_activities_with_enrollments.dart';
import 'package:smile_front/app/shared/models/enrolls_activity_model.dart';
import 'package:smile_front/app/shared/models/professor_activity_model.dart';

part 'more_info_responsible_activities_controller.g.dart';

class MoreInfoResponsibleActivitiesController = MoreInfoResponsibleActivitiesControllerBase
    with _$MoreInfoResponsibleActivitiesController;

abstract class MoreInfoResponsibleActivitiesControllerBase with Store {
  final EnrollsActivityModel activity;
  final GetActivitiesWithEnrollmentsInterface getActivitiesWithEnrollments;

  MoreInfoResponsibleActivitiesControllerBase(
      {required this.activity, required this.getActivitiesWithEnrollments});

  @observable
  bool isLoading = false;

  @action
  void setIsLoading(bool value) {
    isLoading = !isLoading;
  }

  @observable
  bool isSubscribedListVisible = false;

  @action
  void showSubscribedList() {
    isSubscribedListVisible = !isSubscribedListVisible;
  }

  @observable
  bool isTokenVisible = false;

  @action
  void showToken() {
    isTokenVisible = !isTokenVisible;
  }

  @observable
  bool isIconSelected = false;

  @action
  void toggleIconSelection() {
    isIconSelected = !isIconSelected;
  }

  @observable
  bool isSwitched = false;

  @action
  void toggleSwitch() {
    isSwitched = !isSwitched;
  }

  @observable
  var professorActivitiesWithEnrollments = List<ProfessorActivityModel>.empty();

  @action
  Future getProfessorActivitiesWithEnrollments() async {
    setIsLoading(true);
    professorActivitiesWithEnrollments =
        await getActivitiesWithEnrollments(activity.activityCode);
    setIsLoading(false);
  }
}
