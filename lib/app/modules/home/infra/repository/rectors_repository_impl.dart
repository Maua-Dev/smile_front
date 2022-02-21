import 'package:smile_front/app/modules/home/domain/entities/rectors.dart';
import 'package:smile_front/app/modules/home/domain/repositories/rectors_repository_interface.dart';
import 'package:smile_front/app/modules/home/infra/datasources/rectors_datasource_interface.dart';

class RectorsRepositoryImpl implements RectorsRepositoryInterface {
  final RectorsDatasourceInterface datasource;

  RectorsRepositoryImpl({required this.datasource});

  @override
  Future<List<Rectors>> getRectors() {
    final result = datasource.getRectors();
    return Future.value(result);
  }
}
