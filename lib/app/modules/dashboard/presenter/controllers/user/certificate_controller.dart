import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/get_user_certificates.dart';

import '../../../infra/models/certificate_model.dart';

part 'certificate_controller.g.dart';

class CertificateController = CertificateControllerBase
    with _$CertificateController;

abstract class CertificateControllerBase with Store {
  final GetUserCertificatesInterface getUserCertificates;

  CertificateControllerBase({required this.getUserCertificates}) {
    getCertificates();
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
  Future<void> getCertificates() async {
    setIsLoading(true);
    certificateList = await getUserCertificates();
    setIsLoading(false);
  }
}
