import '../../../../shared/models/activity_model.dart';
import '../repositories/activities_repository_interface.dart';

abstract class GetUserSubscribedActivitiesInterface {
  Future<List<ActivityModel>> call();
}

class GetUserSubscribedActivitiesImp
    implements GetUserSubscribedActivitiesInterface {
  final ActivitiesRepositoryInterface repository;

  GetUserSubscribedActivitiesImp({required this.repository});

  @override
  Future<List<ActivityModel>> call() {
    return repository.getUserSubscribedActivities();
  }
}
