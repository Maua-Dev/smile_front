import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/dashboard/domain/entities/faq.dart';
import '../../../domain/usecases/get_faq_information.dart';
part 'help_controller.g.dart';

class HelpController = HelpControllerBase with _$HelpController;

abstract class HelpControllerBase with Store {
  final GetAllFaqInformationInterface getAllFaqInformation;

  HelpControllerBase({required this.getAllFaqInformation}) {
    getFaqInformation();
  }

  @observable
  List<Faq> faq = [];

  @observable
  @action
  Future<void> getFaqInformation() async {
    faq = await getAllFaqInformation();
  }
}
