import 'package:smile_front/app/shared/domain/enum/enrollment_state_enum.dart';
import 'package:smile_front/app/shared/infra/models/activity_model.dart';
import 'package:smile_front/app/shared/infra/models/admin_activity_model.dart';
import 'package:smile_front/app/shared/infra/models/enrolls_activity_model.dart';
import 'package:smile_front/app/shared/infra/models/professor_activity_model.dart';

abstract class ActivitiesRepositoryInterface {
  Future<List<ActivityModel>> getAllActivities();
  Future<List<EnrollsActivityModel>> getUserSubscribedActivities();
  Future<ProfessorActivityModel> getActivityWithEnrollments(String code);
  Future<String> getDownloadLinkCsv();
  Future<bool> createActivity(AdminActivityModel activityToCreate);
  Future<List<AdminActivityModel>> getAdminActivities();
  Future<bool> editActivity(AdminActivityModel activityToEdit);
  Future deleteActivity(String activityCode);
  Future manualDropActivity(String activityCode, String userId);
  Future<bool> subscribeActivity(String activityCode);
  Future<bool> unsubscribeActivity(String activityCode);
  Future<String> generateConfirmationCode(String activityCode);
  Future postManualChangeAttendance(
      String activityCode, String userId, EnrollmentStateEnum state);
  Future confirmAttendance(String confirmAttendanceCode, String activityCode);
  Future deleteAtendanceCode(String activityCode);
  Future deleteUser();
}
