import 'package:smile_front/app/modules/home/domain/entities/rectors_a.dart';

abstract class RectorsRepository {
  Future<List<Rectors>> getRectors();
}
