import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smile_front/app/modules/dashboard/domain/entities/faq.dart';
import 'package:smile_front/app/modules/dashboard/domain/repositories/faq_repository_interface.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/get_faq_information.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/help_controller.dart';
import 'package:smile_front/app/shared/services/firebase-analytics/firebase_analytics_service.dart';

import '../../../../../../setup_firebase_mocks.dart';
import '../../../../auth/presenter/controllers/auth_controller_test.mocks.dart';
import 'help_controller_test.mocks.dart';

@GenerateMocks([FaqRepositoryInterface, GetAllFaqInformationInterface])
void main() {
  setupCloudFirestoreMocks();

  FirebaseAnalyticsService analytics = MockFirebaseAnalyticsService();
  GetAllFaqInformationInterface getAllFaqInformation =
      MockGetAllFaqInformationInterface();
  late HelpController controller;

  var mockFaqList = <Faq>[
    Faq(
        id: 0,
        question: 'Como realizo acesso ao Zoom para assistir a palestra?',
        response:
            'Ao clicar na atividade em que você se inscreveu haverá um campo "Link" sublinhado e clicável de "Zoom" que irá te redirecionar para a reunião.'),
    Faq(
        id: 1,
        question: 'Inseri meu e-mail errado. Como pedir alteração?',
        response: 'Envie um e-mail para dev@maua.br ou ligue para 4239-3169.'),
  ];

  setUpAll(() async {
    await Firebase.initializeApp();
    when(getAllFaqInformation()).thenAnswer((_) async => mockFaqList);
    controller = HelpController(
        getAllFaqInformation: getAllFaqInformation, analytics: analytics);
  });

  test('getFaqInformation && setFaqAction', () {
    controller.getFaqInformation();
    expect(controller.faq.isNotEmpty, true);
    expect(controller.faqAction.isNotEmpty, true);
  });

  test('swapOpen', () {
    controller.swapOpen(0);
    expect(controller.faqAction[0].isOpen, true);
  });
}
