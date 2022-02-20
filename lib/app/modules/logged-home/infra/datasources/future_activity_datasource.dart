import '../../../../shared/entities/activity.dart';

abstract class FutureActivityDatasource {
  Future<Activity> getFutureActivity();
}
