import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/dashboard/domain/entities/faq.dart';
import 'package:smile_front/app/modules/dashboard/domain/repositories/faq_repository_interface.dart';

import '../../../../../shared/services/firebase-analytics/firebase_analytics_service.dart';
import '../../../infra/models/faq_panel_model.dart';

part 'help_controller.g.dart';

class HelpController = _HelpControllerBase with _$HelpController;

abstract class _HelpControllerBase with Store {
  final FaqRepositoryInterface repository;
  final FirebaseAnalyticsService analytics;
  _HelpControllerBase({required this.repository, required this.analytics}) {
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
    faq = await repository.getAllFaq();
    setFaqAction();
  }
}
