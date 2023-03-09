import 'package:smile_front/app/shared/entities/infra/enrollment_state_enum.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';
import '../../../../shared/models/admin_activity_model.dart';
import '../../../../shared/models/enrollments_model.dart';
import '../../../../shared/models/enrolls_activity_model.dart';

abstract class ActivitiesDatasourceInterface {
  Future<List<ActivityModel>> getAllActivities();
  Future<List<AdminActivityModel>> getAdminAllActivities();
  Future<List<EnrollsActivityModel>> getAllActivitiesLogged();
  Future<List<EnrollsActivityModel>> getActivityWithEnrollments(String code);
  Future<EnrollmentsModel> postSubscribe(String activityCode);
  Future<bool> postUnsubscribe(String activityCode);
  Future<AdminActivityModel> manualDropActivity(
      String activityCode, String userId);
  Future editActivity(String id, ActivityModel activity);
  Future createActivity(ActivityModel activity);
  Future deleteActivity(String activityCode);
  Future<String> postGenerateAttendanceConfirmation(String activityCode);
  Future postDeleteAttendanceConfirmation(String activityCode);
  Future<EnrollsActivityModel> postManualChangeAttendance(
      String activityCode, String userId, EnrollmentStateEnum state);
  Future<String> getLinkCsv();
  Future confirmAttendance(String confirmAttendanceCode, String activityCode);
}
