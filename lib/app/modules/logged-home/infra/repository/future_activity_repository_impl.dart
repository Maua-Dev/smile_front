import 'package:smile_front/app/modules/logged-home/domain/repositories/future_activity_repository_interface.dart';
import 'package:smile_front/app/modules/logged-home/infra/datasources/future_activity_datasource.dart';

import '../../../../shared/entities/activity.dart';

class FutureActivityRepositoryImpl
    implements FutureActivityRepositoryInterface {
  final FutureActivityDatasource datasource;

  FutureActivityRepositoryImpl({required this.datasource});

  @override
  Future<Activity> getFutureActivity() {
    final result = datasource.getFutureActivity();
    return Future.value(result);
  }
}
