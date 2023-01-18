import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/dashboard/domain/entities/faq.dart';
import '../../../../../shared/services/firebase-analytics/firebase_analytics_service.dart';
import '../../../domain/usecases/get_faq_information.dart';
import '../../../infra/models/faq_panel_model.dart';

part 'help_controller.g.dart';

class HelpController = HelpControllerBase with _$HelpController;

abstract class HelpControllerBase with Store {
  final FirebaseAnalyticsService analytics;
  final GetAllFaqInformationInterface getAllFaqInformation;

  HelpControllerBase(
      {required this.analytics, required this.getAllFaqInformation}) {
    getFaqInformation();
  }

  @observable
  List<Faq> faq = [];

  @observable
  List<FaqPanelModel> faqAction = [];

  @action
  void setFaqAction() {
    var list = <FaqPanelModel>[];
    for (var i = 0; i < faq.length; i++) {
      list.add(FaqPanelModel(faq: faq[i]));
    }
    faqAction = list;
  }

  @action
  void swapOpen(int index) {
    var lista = List<FaqPanelModel>.from(faqAction);
    lista[index].changeStateIsOpen();
    faqAction = lista;
  }

  @action
  Future<void> getFaqInformation() async {
    faq = await getAllFaqInformation();
    setFaqAction();
  }
}
