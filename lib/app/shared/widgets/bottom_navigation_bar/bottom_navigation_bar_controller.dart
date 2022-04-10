import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../modules/auth/presenter/controllers/auth_controller.dart';

part 'bottom_navigation_bar_controller.g.dart';

class NavigationBarController = BottomNavigationBarControllerBase
    with _$NavigationBarController;

abstract class BottomNavigationBarControllerBase with Store {
  final AuthController authController;

  BottomNavigationBarControllerBase({required this.authController});

  @action
  Future<void> logout() async {
    await authController.logout();
    Modular.to.navigate('/login');
  }

  @observable
  int indexToShow = 1;

  @action
  Future<void> toggleIndex(index) async {
    indexToShow = index;
  }
}
