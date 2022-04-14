import 'package:smile_front/app/modules/dashboard/domain/entities/faq.dart';

abstract class FaqDatasourceInterface {
  Future<List<Faq>> getAllFaq();
}
