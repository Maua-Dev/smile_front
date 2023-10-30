import '../../../../shared/infra/models/enrolls_activity_model.dart';
import '../repositories/activities_repository_interface.dart';

abstract class GetUserSubscribedActivitiesInterface {
  Future<List<EnrollsActivityModel>> call();
}

class GetUserSubscribedActivitiesImp
    implements GetUserSubscribedActivitiesInterface {
  final ActivitiesRepositoryInterface repository;

  GetUserSubscribedActivitiesImp({required this.repository});

  @override
  Future<List<EnrollsActivityModel>> call() {
    return repository.getUserSubscribedActivities();
  }
}
