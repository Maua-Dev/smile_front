import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart';

abstract class DeleteAtendanceConfirmationCodeInterface {
  Future<String> call(String activityCode);
}

class DeleteAtendanceConfirmationCodeImpl
    implements DeleteAtendanceConfirmationCodeInterface {
  final ActivitiesRepositoryInterface repository;

  DeleteAtendanceConfirmationCodeImpl({required this.repository});

  @override
  Future<String> call(String acitivityCode) async {
    return await repository.deleteAtendanceCode(acitivityCode);
  }
}
