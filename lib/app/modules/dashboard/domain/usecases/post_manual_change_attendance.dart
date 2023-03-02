import 'package:smile_front/app/shared/entities/infra/enrollment_state_enum.dart';

import '../repositories/activities_repository_interface.dart';

abstract class PostManualChangeAttendenceInterface {
  Future<bool> call(
      String activityCode, String userId, EnrollmentStateEnum state);
}

class PostManualChangeAttendence
    implements PostManualChangeAttendenceInterface {
  final ActivitiesRepositoryInterface repository;

  PostManualChangeAttendence({required this.repository});

  @override
  Future<bool> call(
      String activityCode, String userId, EnrollmentStateEnum state) {
    return repository.postManualChangeAttendance(activityCode, userId, state);
  }
}
