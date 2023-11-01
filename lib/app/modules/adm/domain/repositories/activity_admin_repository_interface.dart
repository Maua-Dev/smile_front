import 'package:dartz/dartz.dart';
import 'package:smile_front/app/modules/adm/infra/models/activity_admin_model.dart';
import 'package:smile_front/app/shared/helpers/errors/errors.dart';

abstract class ActivityAdminRepositoryInterface {
  Future<Either<Failure, List<ActivityAdminModel>>> getAllAdminActivities();
}
