import 'package:smile_front/app/modules/logged-adm-home/domain/entities/future_activity.dart';
import 'package:smile_front/app/modules/logged-adm-home/infra/datasources/future_activity_datasource.dart';
import 'package:smile_front/app/modules/logged-adm-home/utils/mocks/future_activity_mock.dart';

class FutureActivityDatasourceImpl extends FutureActivityDatasource {
  @override
  Future<FutureActivity> getFutureActivity() {
    return Future.value(futureActivityMock);
    // aplicação do DIO
  }
}
