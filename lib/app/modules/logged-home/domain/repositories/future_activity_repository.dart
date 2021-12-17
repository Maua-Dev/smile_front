import 'package:smile_front/app/modules/logged-home/domain/entities/future_activity.dart';

abstract class FutureActivityRepository {
  Future<FutureActivity> getFutureActivity();
}
