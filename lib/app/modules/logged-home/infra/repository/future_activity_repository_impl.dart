import 'package:smile_front/app/modules/logged-home/domain/entities/future_activity.dart';
import 'package:smile_front/app/modules/logged-home/domain/repositories/future_activity_repository.dart';
import 'package:smile_front/app/modules/logged-home/infra/datasources/future_activity_datasource.dart';

class FutureActivityRepositoryImpl implements FutureActivityRepository {
  final FutureActivityDatasource datasource;

  FutureActivityRepositoryImpl({required this.datasource});

  @override
  Future<FutureActivity> getFutureActivity() {
    final result = datasource.getFutureActivity();
    return Future.value(result);
  }
}
