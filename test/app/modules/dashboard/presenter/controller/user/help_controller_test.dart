import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smile_front/app/modules/dashboard/domain/entities/faq.dart';
import 'package:smile_front/app/modules/dashboard/domain/repositories/faq_repository_interface.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/get_faq_information.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/help_controller.dart';

import 'help_controller_test.mocks.dart';

@GenerateMocks([FaqRepositoryInterface, GetAllFaqInformationInterface])
void main() {
  GetAllFaqInformationInterface getAllFaqInformation =
      MockGetAllFaqInformationInterface();
  // ignore: unused_local_variable
  late HelpController controller;

  var mockFaqList = <Faq>[
    Faq(
        question: 'Como realizo acesso ao Zoom para assistir a palestra?',
        response:
            'Ao clicar na atividade em que você se inscreveu haverá um campo "Link" sublinhado e clicável de "Zoom" que irá te redirecionar para a reunião.'),
    Faq(
        question: 'Inseri meu e-mail errado. Como pedir alteração?',
        response:
            'Envie um e-mail para contato@devmaua.com ou ligue para 4239-3169.'),
  ];

  setUpAll(() async {
    when(getAllFaqInformation()).thenAnswer((_) async => mockFaqList);
    controller = HelpController(
      getAllFaqInformation: getAllFaqInformation,
    );
  });
}
