import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smile_front/app/app_module.dart';
import 'package:smile_front/app/modules/dashboard/adm_module.dart';
import 'package:smile_front/app/modules/dashboard/landing_module.dart';
import 'package:smile_front/app/shared/widgets/bottom_navigation_bar/bottom_navigation_bar_controller.dart';

import '../../../setup_firebase_mocks.dart';

void main() {
  initModules([AppModule(), LandingModule(), AdmModule()]);

  setupCloudFirestoreMocks();

  setUp(() async {
    await Modular.isModuleReady<AppModule>();
    await Firebase.initializeApp();
  });

  test('NavigationBarController Injection', () {
    Modular.get<NavigationBarController>();
  });
}
