import 'package:dartz/dartz.dart';
import 'package:smile_front/app/modules/adm/domain/entities/activity_admin.dart';
import 'package:smile_front/app/modules/adm/domain/repositories/activity_admin_repository_interface.dart';
import 'package:smile_front/app/shared/helpers/errors/errors.dart';

abstract class GetAdminActivitiesUsecaseInterface {
  Future<Either<Failure, List<ActivityAdmin>>> call();
}

class GetAdminActivitiesUsecase implements GetAdminActivitiesUsecaseInterface {
  final ActivityAdminRepositoryInterface repository;

  GetAdminActivitiesUsecase({required this.repository});

  @override
  Future<Either<Failure, List<ActivityAdmin>>> call() async {
    return await repository.getAllAdminActivities();
  }
}
