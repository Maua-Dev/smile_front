import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../modules/auth/domain/repositories/secure_storage_interface.dart';
import '../../../modules/auth/presenter/controllers/auth_controller.dart';

part 'bottom_navigation_bar_controller.g.dart';

class NavigationBarController = BottomNavigationBarControllerBase
    with _$NavigationBarController;

abstract class BottomNavigationBarControllerBase with Store {
  final AuthController authController;
  final SecureStorageInterface secureStorage;

  BottomNavigationBarControllerBase(
      {required this.secureStorage, required this.authController}) {
    getIndex();
  }

  @action
  Future<void> logout() async {
    await authController.logout();
    Modular.to.navigate('/login');
  }

  @observable
  int indexToShow = 1;

  @action
  Future<void> getIndex() async {
    indexToShow = (await secureStorage.getNavBarIndex())!;
  }

  @action
  Future<void> toggleIndex(index) async {
    await secureStorage.saveNavBarIndex(index);
    indexToShow = index;
  }
}
