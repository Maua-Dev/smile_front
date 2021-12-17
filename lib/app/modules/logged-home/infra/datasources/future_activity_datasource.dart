import 'package:smile_front/app/modules/logged-home/domain/entities/future_activity.dart';

abstract class FutureActivityDatasource {
  Future<FutureActivity> getFutureActivity();
}
