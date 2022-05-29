import 'package:smile_front/app/modules/dashboard/infra/models/certificate_model.dart';

import '../../domain/repositories/certificate_repository_interface.dart';
import '../datasources/certificate_datasource_interface.dart';

class CertificateRepositoryImpl implements CertificateRepositoryInterface {
  final CertificateDatasourceInterface datasource;

  CertificateRepositoryImpl({required this.datasource});

  List<CertificateModel> certificateList = List.empty();

  @override
  Future<List<CertificateModel>> getListDownloads() async {
    if (certificateList.isEmpty) {
      certificateList = await datasource.getListDownloads();
    }
    return Future.value(certificateList);
  }
}
