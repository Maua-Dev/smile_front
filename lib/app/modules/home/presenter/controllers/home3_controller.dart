import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/home/domain/entities/rectors.dart';
import 'package:smile_front/app/modules/home/domain/repositories/rectors_repository_interface.dart';

part 'home3_controller.g.dart';

class Home3Controller = _Home3ControllerBase with _$Home3Controller;

abstract class _Home3ControllerBase with Store {
  final RectorsRepositoryInterface repository;

  _Home3ControllerBase({required this.repository}) {
    getRectors();
  }

  @observable
  List<Rectors> listRectors = [];

  @action
  Future getRectors() async {
    listRectors = await repository.getRectors();
  }
}
