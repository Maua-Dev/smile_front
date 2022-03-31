import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/home/domain/entities/rectors.dart';
import 'package:smile_front/app/modules/home/domain/repositories/rectors_repository_interface.dart';

part 'about_home_controller.g.dart';

class AboutHomeController = _AboutHomeControllerBase with _$AboutHomeController;

abstract class _AboutHomeControllerBase with Store {
  final RectorsRepositoryInterface repository;

  _AboutHomeControllerBase({required this.repository}) {
    getRectors();
  }

  @observable
  List<Rectors> listRectors = [];

  @action
  Future getRectors() async {
    listRectors = await repository.getRectors();
  }
}
