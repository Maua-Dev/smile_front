import 'package:smile_front/app/modules/home/ui/pages/home2/models/speaker_model.dart';

import 'home2_repository_interface.dart';

class Home2Repository implements IHome2Repository {
  var speakers = [
    SpeakerModel(
        name: 'Gabe Gabrielle',
        description:
            'Engenheiro II na URS Corporation; Ex-Diretor de Engenharia do Comando de Operações Especiais da Força Aérea dos EUA; Ex-engenheiro da NASA no Kennedy Space Center; Membro do "Speakers Bureau" da NASA por 12 anos; Embaixador do Laboratório de Propulsão a Jato da NASA.',
        date: '25/05',
        linkPhoto: ''),
    SpeakerModel(
        name: 'Gabe Gabrielle 2',
        description:
            'Engenheiro II na URS Corporation; Ex-Diretor de Engenharia do Comando de Operações Especiais da Força Aérea dos EUA; Ex-engenheiro da NASA no Kennedy Space Center; Membro do "Speakers Bureau" da NASA por 12 anos; Embaixador do Laboratório de Propulsão a Jato da NASA.',
        date: '26/05',
        linkPhoto: ''),
    SpeakerModel(
        name: 'Gabe Gabrielle 3',
        description:
            'Engenheiro II na URS Corporation; Ex-Diretor de Engenharia do Comando de Operações Especiais da Força Aérea dos EUA; Ex-engenheiro da NASA no Kennedy Space Center; Membro do "Speakers Bureau" da NASA por 12 anos; Embaixador do Laboratório de Propulsão a Jato da NASA.',
        date: '27/05',
        linkPhoto: ''),
    SpeakerModel(
        name: 'Gabe Gabrielle 4',
        description:
            'Engenheiro II na URS Corporation; Ex-Diretor de Engenharia do Comando de Operações Especiais da Força Aérea dos EUA; Ex-engenheiro da NASA no Kennedy Space Center; Membro do "Speakers Bureau" da NASA por 12 anos; Embaixador do Laboratório de Propulsão a Jato da NASA.',
        date: '28/05',
        linkPhoto: ''),
    SpeakerModel(
        name: 'Gabe Gabrielle 5',
        description:
            'Engenheiro II na URS Corporation; Ex-Diretor de Engenharia do Comando de Operações Especiais da Força Aérea dos EUA; Ex-engenheiro da NASA no Kennedy Space Center; Membro do "Speakers Bureau" da NASA por 12 anos; Embaixador do Laboratório de Propulsão a Jato da NASA.',
        date: '29/05',
        linkPhoto: ''),
    SpeakerModel(
        name: 'Gabe Gabrielle 6',
        description:
            'Engenheiro II na URS Corporation; Ex-Diretor de Engenharia do Comando de Operações Especiais da Força Aérea dos EUA; Ex-engenheiro da NASA no Kennedy Space Center; Membro do "Speakers Bureau" da NASA por 12 anos; Embaixador do Laboratório de Propulsão a Jato da NASA.',
        date: '30/05',
        linkPhoto: ''),
  ];

  @override
  Future<List<SpeakerModel>> getSpeakers() {
    return Future.value(speakers);
  }
}
