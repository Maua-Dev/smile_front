import 'package:smile_front/app/shared/models/activity_model.dart';

import '../repositories/activities_repository_interface.dart';

abstract class GetAllUserActivitiesInterface {
  Future<List<ActivityModel>> call();
}

class GetActivitiesList implements GetAllUserActivitiesInterface {


  final ActivitiesRepositoryInterface repository;

  GetActivitiesList({required this.repository});

  @override
  Future<List<ActivityModel>> call() async {
    return await repository.getAllActivities();
  }

}
