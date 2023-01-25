import '../entities/faq.dart';
import '../repositories/faq_repository_interface.dart';

abstract class GetAllFaqInformationInterface {
  Future<List<Faq>> call();
}

class GetAllInformation implements GetAllFaqInformationInterface {
  final FaqRepositoryInterface repository;

  GetAllInformation({required this.repository});

  @override
  Future<List<Faq>> call() {
    return repository.getAllFaq();
  }
}
