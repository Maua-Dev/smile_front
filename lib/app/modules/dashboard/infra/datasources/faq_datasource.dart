import 'package:smile_front/app/modules/dashboard/domain/entities/faq.dart';

abstract class FaqDatasource {
  Future<List<Faq>> getAllFaq();
}
