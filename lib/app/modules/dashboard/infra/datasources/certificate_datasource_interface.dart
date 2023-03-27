import '../models/certificate_model.dart';

abstract class CertificateDatasourceInterface {
  Future<List<CertificateModel>> getListCertificates();
}
