import 'package:smile_front/app/modules/adm/infra/models/activity_admin_model.dart';

abstract class ActivityAdminRepositoryInterface {
  Future<List<ActivityAdminModel>> getAllAdminActivities();
}
