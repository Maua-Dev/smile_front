import '../repositories/activities_repository_interface.dart';

abstract class ConfirmAttendanceUsecase {
  Future call(String confirmAttendanceCode, String activityCode);
}

class SendConfirmAttendance implements ConfirmAttendanceUsecase {
  final ActivitiesRepositoryInterface repository;

  SendConfirmAttendance({required this.repository});

  @override
  Future call(String confirmAttendanceCode, String activityCode) {
    return repository.confirmAttendance(confirmAttendanceCode, activityCode);
  }
}
