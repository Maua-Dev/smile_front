import 'package:smile_front/app/modules/home/domain/entities/rectors.dart';

abstract class RectorsDatasourceInterface {
  Future<List<Rectors>> getRectors();
}
