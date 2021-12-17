import 'package:smile_front/app/modules/home/domain/entities/rectors_a.dart';
import 'package:smile_front/app/modules/home/infra/datasources/rectors_datasource.dart';
import 'package:smile_front/app/modules/home/utils/mocks/rectors_mock.dart';

class RectorsDatasourceImpl extends RectorsDatasource {
  @override
  Future<List<Rectors>> getRectors() {
    return Future.value(mockRectors);
    // aplicação do DIO
  }
}
