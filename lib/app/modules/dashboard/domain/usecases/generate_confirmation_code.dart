import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart';

abstract class GenerateConfirmationCodeInterface {
  Future<String> call(String activityCode);
}

class GenerateConfirmationCodeImpl
    implements GenerateConfirmationCodeInterface {
  final ActivitiesRepositoryInterface repository;

  GenerateConfirmationCodeImpl({required this.repository});

  @override
  Future<String> call(String acitivityCode) async {
    return await repository.generateConfirmationCode(acitivityCode);
  }
}
