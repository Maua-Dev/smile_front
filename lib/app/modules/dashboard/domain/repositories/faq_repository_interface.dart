import '../entities/faq.dart';

abstract class FaqRepositoryInterface {
  Future<List<Faq>> getAllFaq();
}
