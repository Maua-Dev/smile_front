import 'package:smile_front/app/modules/logged-adm-home/infra/datasources/future_activity_datasource.dart';
import 'package:smile_front/app/modules/logged-adm-home/utils/mocks/future_activity_mock.dart';

import '../../../shared/entities/activity.dart';

class FutureActivityDatasourceImpl extends FutureActivityDatasource {
  @override
  Future<Activity> getFutureActivity() {
    return Future.value(futureActivityMock);
    // aplicação do DIO
  }
}
