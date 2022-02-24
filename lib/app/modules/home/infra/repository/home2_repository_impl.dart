import 'package:smile_front/app/modules/home/domain/entities/speaker.dart';
import 'package:smile_front/app/modules/home/domain/repositories/home2_repository_interface.dart';

class Home2RepositoryImpl implements Home2RepositoryInterface {
  var speakers = [
    Speaker(
        name: 'Gabe Gabrielle',
        description:
            'Engenheiro II na URS Corporation; Ex-Diretor de Engenharia do Comando de Operações Especiais da Força Aérea dos EUA; Ex-engenheiro da NASA no Kennedy Space Center; Membro do "Speakers Bureau" da NASA por 12 anos; Embaixador do Laboratório de Propulsão a Jato da NASA.',
        date: '26/05',
        linkPhoto:
            'https://uploads.metropoles.com/wp-content/uploads/2017/05/30112122/Gabe-Gabrielle-avatar.jpg'),
    Speaker(
        name: 'Hector Guerrini Herrera',
        description:
            'Engenheiro II na URS Corporation; Ex-Diretor de Engenharia do Comando de Operações Especiais da Força Aérea dos EUA; Ex-engenheiro da NASA no Kennedy Space Center; Membro do "Speakers Bureau" da NASA por 12 anos; Embaixador do Laboratório de Propulsão a Jato da NASA.',
        date: '25/05',
        linkPhoto: 'https://avatars.githubusercontent.com/u/24724451?v=4'),
    Speaker(
        name: 'Gabe Gabrielle 3',
        description:
            'Engenheiro II na URS Corporation; Ex-Diretor de Engenharia do Comando de Operações Especiais da Força Aérea dos EUA; Ex-engenheiro da NASA no Kennedy Space Center; Membro do "Speakers Bureau" da NASA por 12 anos; Embaixador do Laboratório de Propulsão a Jato da NASA.',
        date: '27/05',
        linkPhoto:
            'https://uploads.metropoles.com/wp-content/uploads/2017/05/30112122/Gabe-Gabrielle-avatar.jpg'),
    Speaker(
        name: 'Gabe Gabrielle 4',
        description:
            'Engenheiro II na URS Corporation; Ex-Diretor de Engenharia do Comando de Operações Especiais da Força Aérea dos EUA; Ex-engenheiro da NASA no Kennedy Space Center; Membro do "Speakers Bureau" da NASA por 12 anos; Embaixador do Laboratório de Propulsão a Jato da NASA.',
        date: '28/05',
        linkPhoto:
            'https://uploads.metropoles.com/wp-content/uploads/2017/05/30112122/Gabe-Gabrielle-avatar.jpg'),
    Speaker(
        name: 'Gabe Gabrielle 5',
        description:
            'Engenheiro II na URS Corporation; Ex-Diretor de Engenharia do Comando de Operações Especiais da Força Aérea dos EUA; Ex-engenheiro da NASA no Kennedy Space Center; Membro do "Speakers Bureau" da NASA por 12 anos; Embaixador do Laboratório de Propulsão a Jato da NASA.',
        date: '29/05',
        linkPhoto:
            'https://uploads.metropoles.com/wp-content/uploads/2017/05/30112122/Gabe-Gabrielle-avatar.jpg'),
    Speaker(
        name: 'Gabe Gabrielle 6',
        description:
            'Engenheiro II na URS Corporation; Ex-Diretor de Engenharia do Comando de Operações Especiais da Força Aérea dos EUA; Ex-engenheiro da NASA no Kennedy Space Center; Membro do "Speakers Bureau" da NASA por 12 anos; Embaixador do Laboratório de Propulsão a Jato da NASA.',
        date: '30/05',
        linkPhoto:
            'https://uploads.metropoles.com/wp-content/uploads/2017/05/30112122/Gabe-Gabrielle-avatar.jpg'),
  ];

  @override
  Future<List<Speaker>> getSpeakers() async {
    return Future.value(speakers);
  }
}
