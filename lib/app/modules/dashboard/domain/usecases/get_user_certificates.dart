import '../../infra/models/certificate_model.dart';
import '../repositories/certificate_repository_interface.dart';

abstract class GetUserCertificatesInterface {
  Future<List<CertificateModel>> call();
}

class GetUserCertificates implements GetUserCertificatesInterface {
  final CertificateRepositoryInterface repository;

  GetUserCertificates({required this.repository});

  @override
  Future<List<CertificateModel>> call() async {
    return await repository.getListDownloads();
  }
}
