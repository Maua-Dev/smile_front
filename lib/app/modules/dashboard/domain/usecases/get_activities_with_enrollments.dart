import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart';
import 'package:smile_front/app/shared/infra/models/professor_activity_model.dart';

abstract class GetActivitiesWithEnrollmentsInterface {
  Future<ProfessorActivityModel> call(String code);
}

class GetActivitiesWithEnrollmentsImp
    implements GetActivitiesWithEnrollmentsInterface {
  final ActivitiesRepositoryInterface repository;

  GetActivitiesWithEnrollmentsImp({required this.repository});

  @override
  Future<ProfessorActivityModel> call(String code) {
    return repository.getActivityWithEnrollments(code);
  }
}
