import '../../../../shared/entities/activity.dart';

abstract class FutureActivityRepository {
  Future<Activity> getFutureActivity();
}
