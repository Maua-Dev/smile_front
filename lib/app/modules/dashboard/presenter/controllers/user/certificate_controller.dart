import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/dashboard/domain/repositories/certificate_repository_interface.dart';

import '../../../infra/models/certificate_model.dart';

part 'certificate_controller.g.dart';

class CertificateController = CertificateControllerBase
    with _$CertificateController;

abstract class CertificateControllerBase with Store {
  final CertificateRepositoryInterface repository;

  CertificateControllerBase({required this.repository}) {
    getUserCertificates();
  }

  @observable
  bool isLoading = false;

  @action
  Future<void> setIsLoading(bool value) async {
    isLoading = value;
  }

  @observable
  List<CertificateModel> certificateList = List.empty();

  @action
  Future<void> getUserCertificates() async {
    setIsLoading(true);
    certificateList = await repository.getListDownloads();
    setIsLoading(false);
  }
}
