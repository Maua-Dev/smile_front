import '../../infra/models/user_enrolled_activities_model.dart';
import '../repositories/activities_repository_interface.dart';

abstract class GetUserSubscribedActivitiesInterface {
  Future<List<UserEnrolledActivitiesModel>> call();
}

class GetUserSubscribedActivitiesImp
    implements GetUserSubscribedActivitiesInterface {
  final ActivitiesRepositoryInterface repository;

  GetUserSubscribedActivitiesImp({required this.repository});

  @override
  Future<List<UserEnrolledActivitiesModel>> call() {
    return repository.getUserSubscribedActivities();
  }
}
