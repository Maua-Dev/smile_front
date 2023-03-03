import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/get_activities_with_enrollments.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/post_manual_change_attendance.dart';
import 'package:smile_front/app/shared/models/professor_activity_model.dart';

part 'more_info_responsible_activities_controller.g.dart';

class MoreInfoResponsibleActivitiesController = MoreInfoResponsibleActivitiesControllerBase
    with _$MoreInfoResponsibleActivitiesController;

abstract class MoreInfoResponsibleActivitiesControllerBase with Store {
  final String activityCode;
  final GetActivitiesWithEnrollmentsInterface getActivitiesWithEnrollments;
  final PostManualChangeAttendenceInterface postManualChangeAttendence;

  MoreInfoResponsibleActivitiesControllerBase(
      {required this.activityCode,
      required this.postManualChangeAttendence,
      required this.getActivitiesWithEnrollments}) {
    getProfessorActivitiesWithEnrollments();
  }

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
  var professorActivitiesWithEnrollments = ProfessorActivityModel.newInstance();

  @action
  Future<void> getProfessorActivitiesWithEnrollments() async {
    setIsLoading(true);
    professorActivitiesWithEnrollments =
        await getActivitiesWithEnrollments(activityCode);
    setIsLoading(false);
  }

  @action
  Future<void> manualChangeAttendence(userId, state) async {
    setIsLoading(true);
    await postManualChangeAttendence(activityCode, userId, state);
    setIsLoading(false);
  }
}
