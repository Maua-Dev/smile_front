import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smile_front/app/modules/dashboard/domain/entities/faq.dart';
import 'package:smile_front/app/modules/dashboard/infra/datasources/faq_datasource_interface.dart';
import 'package:smile_front/app/modules/dashboard/infra/repository/faq_repository_impl.dart';

import 'faq_repository_impl_test.mocks.dart';

@GenerateMocks([FaqDatasourceInterface])
void main() {
  late FaqRepositoryImpl repository;
  FaqDatasourceInterface datasource = MockFaqDatasourceInterface();

  var faqMock = <Faq>[
    Faq(
        id: 0,
        question: 'Como validar a presença nas minhas atividades?',
        response:
            'Será disponibilizado durante a atividade um Formulário para preenchimento do participante que validará as suas horas na atividade.'),
    Faq(
        id: 1,
        question: 'Em que local no site eu vejo as atividades da SMILE?',
        response:
            'Clicando no ícone central da barra de navegação você poderá visualizar todas as atividades do evento. Se você for estudante do IMT poderá também acessar pelo Open LMS da SMILE: https://imt.myopenlms.net/course/view.php?id=1353'),
  ];

  setUpAll(() {
    when(datasource.getAllFaq()).thenAnswer((_) async => faqMock);
    repository = FaqRepositoryImpl(datasource: datasource);
  });

  test('getAllFaq', () async {
    var list = await repository.getAllFaq();
    expect(list.isNotEmpty, true);
  });
}
