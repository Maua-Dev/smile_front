import 'package:smile_front/app/shared/entities/infra/enrollment_state_enum.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';
import 'package:smile_front/app/shared/models/admin_activity_model.dart';
import 'package:smile_front/app/shared/models/enrolls_activity_model.dart';
import 'package:smile_front/app/shared/models/professor_activity_model.dart';

abstract class ActivitiesRepositoryInterface {
  Future<List<ActivityModel>> getAllActivities();
  Future<List<EnrollsActivityModel>> getUserSubscribedActivities();
  Future<ProfessorActivityModel> getActivityWithEnrollments(String code);
  Future<String> getDownloadLinkCsv();
  Future createActivity(ActivityModel activityToCreate);
  Future<List<AdminActivityModel>> getAdminActivities();
  Future editActivity(ActivityModel activityToEdit);
  Future deleteActivity(String activityCode);
  Future<bool> subscribeActivity(String activityCode);
  Future<bool> unsubscribeActivity(String activityCode);
  Future<String> generateConfirmationCode(String activityCode);
  Future postManualChangeAttendance(
      String activityCode, String userId, EnrollmentStateEnum state);
}
