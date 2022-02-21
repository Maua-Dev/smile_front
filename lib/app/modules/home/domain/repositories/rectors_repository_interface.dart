import 'package:smile_front/app/modules/home/domain/entities/rectors.dart';

abstract class RectorsRepositoryInterface {
  Future<List<Rectors>> getRectors();
}
