import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/generate_confirmation_code.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/get_activities_with_enrollments.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/post_manual_change_attendance.dart';
import 'package:smile_front/app/modules/dashboard/ui/user/widgets/responsible_activities_widgets/list_name_and_state_with_is_switched.dart';
import 'package:smile_front/app/shared/entities/infra/enrollment_state_enum.dart';
import 'package:smile_front/app/shared/models/professor_activity_model.dart';

part 'more_info_responsible_activities_controller.g.dart';

class MoreInfoResponsibleActivitiesController = MoreInfoResponsibleActivitiesControllerBase
    with _$MoreInfoResponsibleActivitiesController;

abstract class MoreInfoResponsibleActivitiesControllerBase with Store {
  final String activityCode;
  final GetActivitiesWithEnrollmentsInterface getActivitiesWithEnrollments;
  final PostManualChangeAttendenceInterface postManualChangeAttendence;
  final GenerateConfirmationCodeInterface generateConfirmationCode;

  MoreInfoResponsibleActivitiesControllerBase({
    required this.activityCode,
    required this.postManualChangeAttendence,
    required this.getActivitiesWithEnrollments,
    required this.generateConfirmationCode,
  }) {
    getProfessorActivitiesWithEnrollments();
  }

  @observable
  bool isLoading = false;

  @observable
  bool isLoadingAtendanceToken = false;

  @observable
  String token = '';

  @action
  void setIsLoading(bool value) {
    isLoading = !isLoading;
  }

  @action
  void setIsLoadingAtendanceCode(bool value) {
    isLoadingAtendanceToken = value;
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

  @action
  Future<void> generateNewAtendanceCode() async {
    setIsLoadingAtendanceCode(true);
    token = await generateConfirmationCode(activityCode);
    setIsLoadingAtendanceCode(false);
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
  List<ListNameAndStateWithIsSwitched> professorList = [];

  @observable
  var professorActivitiesWithEnrollments = ProfessorActivityModel.newInstance();

  @action
  Future<void> getProfessorActivitiesWithEnrollments() async {
    setIsLoading(true);
    professorActivitiesWithEnrollments =
        await getActivitiesWithEnrollments(activityCode);
    professorList = professorActivitiesWithEnrollments.enrollments!
        .map(
          (e) => ListNameAndStateWithIsSwitched(
              userId: e.userEnroll!.userId,
              name: e.userEnroll!.name,
              state: e.state,
              isSwitched:
                  e.state == EnrollmentStateEnum.COMPLETED ? true : false),
        )
        .toList();
    setIsLoading(false);
  }

  @action
  Future<void> toogleListSwitch(bool value, int index) async {
    setIsLoading(true);
    professorList[index].toogleSwitch(value);
    if (professorList[index].state == EnrollmentStateEnum.ENROLLED) {
      await postManualChangeAttendence(activityCode,
          professorList[index].userId, EnrollmentStateEnum.COMPLETED);
    } else {
      await postManualChangeAttendence(activityCode,
          professorList[index].userId, EnrollmentStateEnum.ENROLLED);
    }
    setIsLoading(false);
  }
}
