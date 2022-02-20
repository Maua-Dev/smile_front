import 'package:smile_front/app/shared/entities/activity.dart';

abstract class FutureActivityRepositoryInterface {
  Future<Activity> getFutureActivity();
}
