import 'package:smile_front/app/modules/adm/domain/entities/activity_admin.dart';
import 'package:smile_front/app/modules/adm/domain/repositories/activity_admin_repository_interface.dart';

abstract class GetAdminActivitiesUsecaseInterface {
  Future<List<ActivityAdmin>> call();
}

class GetAdminActivitiesUsecase implements GetAdminActivitiesUsecaseInterface {
  final ActivityAdminRepositoryInterface repository;

  GetAdminActivitiesUsecase({required this.repository});

  @override
  Future<List<ActivityAdmin>> call() async {
    return await repository.getAllAdminActivities();
  }
}
