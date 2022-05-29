import 'package:smile_front/app/modules/dashboard/infra/models/certificate_model.dart';

abstract class CertificateRepositoryInterface {
  Future<List<CertificateModel>> getListDownloads();
}
