import 'package:smile_front/app/modules/home/domain/entities/rectors_a.dart';
import 'package:smile_front/app/modules/home/domain/repositories/rectors_repository.dart';
import 'package:smile_front/app/modules/home/infra/datasources/rectors_datasource.dart';

class RectorsRepositoryImpl implements RectorsRepository {
  final RectorsDatasource datasource;

  RectorsRepositoryImpl({required this.datasource});

  @override
  Future<List<Rectors>> getRectors() {
    final result = datasource.getRectors();
    return Future.value(result);
  }
}
