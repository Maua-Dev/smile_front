import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/delete_attendance_confirmation.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/generate_confirmation_code.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/get_activities_with_enrollments.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/post_manual_change_attendance.dart';
import 'package:smile_front/app/modules/dashboard/ui/user/widgets/responsible_activities_widgets/list_name_and_state_with_is_switched.dart';
import 'package:smile_front/app/shared/domain/enum/enrollment_state_enum.dart';
import 'package:smile_front/app/shared/infra/models/professor_activity_model.dart';
import 'package:smile_front/app/shared/helpers/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../shared/infra/models/enrollments_model.dart';
import '../../../../auth/domain/repositories/secure_storage_interface.dart';

part 'more_info_responsible_activities_controller.g.dart';

class MoreInfoResponsibleActivitiesController = MoreInfoResponsibleActivitiesControllerBase
    with _$MoreInfoResponsibleActivitiesController;

abstract class MoreInfoResponsibleActivitiesControllerBase with Store {
  final String activityCode;
  final GetActivitiesWithEnrollmentsInterface getActivitiesWithEnrollments;
  final PostManualChangeAttendenceInterface postManualChangeAttendence;
  final GenerateConfirmationCodeInterface generateConfirmationCode;
  final DeleteAtendanceConfirmationCodeInterface deleteConfirmationCode;
  final SecureStorageInterface storage;

  MoreInfoResponsibleActivitiesControllerBase({
    required this.activityCode,
    required this.postManualChangeAttendence,
    required this.getActivitiesWithEnrollments,
    required this.generateConfirmationCode,
    required this.deleteConfirmationCode,
    required this.storage,
  }) {
    getProfessorActivitiesWithEnrollments();
  }

  @computed
  String get emailLogDevCommunity => 'log.devmaua@gmail.com';

  @observable
  bool isLoading = false;

  @observable
  bool isLoadingAtendanceToken = false;

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

  @observable
  String? token;

  @action
  void showToken() {
    isTokenVisible = !isTokenVisible;
  }

  @action
  void isTokenAlreadyOpen() {
    if (professorActivityWithEnrollments.confirmationCode != null) {
      token = professorActivityWithEnrollments.confirmationCode;
      isTokenVisible = true;
    }
  }

  @action
  Future<void> generateNewAtendanceCode() async {
    var currentActivityCode = activityCode;
    if (currentActivityCode == "") {
      currentActivityCode = await storage.getActivityCode() ?? '';
    } else {
      await storage.saveActivityCode(currentActivityCode);
    }
    setIsLoadingAtendanceCode(true);
    token = await generateConfirmationCode(currentActivityCode);
    setIsLoadingAtendanceCode(false);
  }

  @action
  Future<void> deleteOldAttendanceCode() async {
    var currentActivityCode = activityCode;
    if (currentActivityCode == "") {
      currentActivityCode = await storage.getActivityCode() ?? '';
    } else {
      await storage.saveActivityCode(currentActivityCode);
    }
    setIsLoadingAtendanceCode(true);
    var token = await deleteConfirmationCode(currentActivityCode);
    professorActivityWithEnrollments.copyWith(confirmationCode: token);
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
  var professorActivityWithEnrollments = ProfessorActivityModel.newInstance();

  @observable
  String initialTime = '';

  @observable
  String finalTime = '';

  @action
  Future<void> getProfessorActivitiesWithEnrollments() async {
    setIsLoading(true);
    var activityCodeToSearch = activityCode;
    if (activityCodeToSearch == "") {
      activityCodeToSearch = await storage.getActivityCode() ?? '';
    } else {
      await storage.saveActivityCode(activityCodeToSearch);
    }
    if (activityCodeToSearch == '') {
      Modular.to.navigate('/user/home/professor');
    }
    professorActivityWithEnrollments =
        await getActivitiesWithEnrollments(activityCodeToSearch);
    professorList = professorActivityWithEnrollments.enrollments!
        .map(
          (e) => ListNameAndStateWithIsSwitched(
              userId: e.user!.userId,
              name: e.user!.name,
              state: e.state,
              isSwitched:
                  e.state == EnrollmentStateEnum.COMPLETED ? true : false),
        )
        .toList();
    initialTime =
        DateFormat('HH:mm').format(professorActivityWithEnrollments.startDate!);
    finalTime = Utils.getActivityFinalTime(
        professorActivityWithEnrollments.startDate!,
        professorActivityWithEnrollments.duration);
    isTokenAlreadyOpen();
    setIsLoading(false);
  }

  @observable
  bool isButtonLoading = false;

  @action
  Future<void> toogleListSwitch(bool value, int index) async {
    setIsLoading(true);
    var activityCodeToToogle = activityCode;
    if (activityCodeToToogle == "") {
      activityCodeToToogle = await storage.getActivityCode() ?? '';
    } else {
      await storage.saveActivityCode(activityCodeToToogle);
    }
    if (activityCodeToToogle == '') {
      Modular.to.navigate('/user/home/professor');
    }
    professorList[index].toogleSwitch(value);
    if (professorList[index].state == EnrollmentStateEnum.ENROLLED) {
      professorList[index].state = EnrollmentStateEnum.COMPLETED;
      await postManualChangeAttendence(activityCodeToToogle,
          professorList[index].userId, EnrollmentStateEnum.COMPLETED);
    } else {
      professorList[index].state = EnrollmentStateEnum.ENROLLED;
      await postManualChangeAttendence(activityCodeToToogle,
          professorList[index].userId, EnrollmentStateEnum.ENROLLED);
    }
    setIsLoading(false);
  }

  @action
  Future sendEmailToAll(List<EnrollmentsModel> enrollments) async {
    if (enrollments.isNotEmpty) {
      var allEmails =
          enrollments.map((enrollment) => enrollment.user!.email).join(',');
      launchUrl(
        Uri.parse('mailto:$allEmails?&bcc=$emailLogDevCommunity'),
        mode: LaunchMode.externalApplication,
      );
    }
  }
}
