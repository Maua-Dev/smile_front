import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart';

abstract class GenerateAtendanceTokenInterface {
  Future<String> call(String activityCode);
}

class GenerateAtendanceTokenImpl implements GenerateAtendanceTokenInterface {
  final ActivitiesRepositoryInterface repository;

  GenerateAtendanceTokenImpl({required this.repository});

  @override
  Future<String> call(String acitivityCode) async {
    return await repository.generateAtendanceToken(acitivityCode);
  }
}
