import 'package:smile_front/app/shared/entities/infra/enrollment_state_enum.dart';
import 'package:smile_front/app/shared/infra/models/activity_model.dart';
import 'package:smile_front/app/shared/infra/models/professor_activity_model.dart';
import '../../../../shared/infra/models/admin_activity_model.dart';
import '../../../../shared/infra/models/enrollments_model.dart';
import '../../../../shared/infra/models/enrolls_activity_model.dart';

abstract class ActivitiesDatasourceInterface {
  Future<List<ActivityModel>> getAllActivities();
  Future<List<AdminActivityModel>> getAdminAllActivities();
  Future<List<EnrollsActivityModel>> getAllActivitiesLogged();
  Future<ProfessorActivityModel> getActivityWithEnrollments(String code);
  Future<EnrollmentsModel> postSubscribe(String activityCode);
  Future<bool> postUnsubscribe(String activityCode);
  Future<AdminActivityModel> manualDropActivity(
      String activityCode, String userId);
  Future<ActivityModel?> editActivity(String id, AdminActivityModel activity);
  Future<ActivityModel?> createActivity(AdminActivityModel activity);
  Future deleteActivity(String activityCode);
  Future<String> postGenerateAttendanceConfirmation(String activityCode);
  Future postDeleteAttendanceConfirmation(String activityCode);
  Future<ProfessorActivityModel> postManualChangeAttendance(
      String activityCode, String userId, EnrollmentStateEnum state);
  Future<String> getLinkCsv();
  Future<String> generateConfirmationCode(String activityCode);
  Future confirmAttendance(String confirmAttendanceCode, String activityCode);
  Future deleteAttendanceCode(String activityCode);
  Future deleteUser();
}
