import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/home/domain/entities/rectors.dart';
import 'package:smile_front/app/modules/home/domain/repositories/rectors_repository_interface.dart';

part 'activity_home_controller.g.dart';

class ActivityHomeController = _ActivityHomeControllerBase
    with _$ActivityHomeController;

abstract class _ActivityHomeControllerBase with Store {
  final RectorsRepositoryInterface repository;

  _ActivityHomeControllerBase({required this.repository}) {
    getRectors();
  }

  @observable
  List<Rectors> listRectors = [];

  @action
  Future getRectors() async {
    listRectors = await repository.getRectors();
  }
}
