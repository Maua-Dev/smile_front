import 'package:smile_front/app/modules/dashboard/domain/service/presentation/activities_enum.dart';
import 'package:smile_front/app/modules/dashboard/infra/models/activities_model.dart';

abstract class ActivitiesDatasource {
  Future<List<ActivitiesModel>> getActivities(ActivitiesEnum activitiesEnum);
}
