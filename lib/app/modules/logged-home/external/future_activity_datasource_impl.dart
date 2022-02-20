import 'package:smile_front/app/modules/logged-home/utils/mocks/future_activity_mock.dart';
import 'package:smile_front/app/shared/entities/activity.dart';

import '../infra/datasources/future_activity_datasource.dart';

class FutureActivityDatasourceImpl extends FutureActivityDatasource {
  @override
  Future<Activity> getFutureActivity() {
    return Future.value(futureActivityMock);
    // aplicação do DIO
  }
}
