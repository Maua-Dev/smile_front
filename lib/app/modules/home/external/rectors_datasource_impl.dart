import 'package:smile_front/app/modules/home/domain/entities/rectors.dart';
import 'package:smile_front/app/modules/home/infra/datasources/rectors_datasource_interface.dart';
import 'package:smile_front/app/modules/home/utils/mocks/rectors_mock.dart';

class RectorsDatasourceImpl extends RectorsDatasourceInterface {
  @override
  Future<List<Rectors>> getRectors() {
    return Future.value(mockRectors);
    // aplicação do DIO
  }
}
