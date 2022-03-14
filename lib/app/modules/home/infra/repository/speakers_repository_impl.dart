import 'package:smile_front/app/modules/home/domain/repositories/speakers_repository_interface.dart';

import '../models/home_speaker_model.dart';

class SpeakersRepositoryImpl implements SpeakersRepositoryInterface {
  var speakers = [
    HomeSpeakerModel(
        name: 'Hector Guerrini Herrera',
        bio:
            'Engenheiro II na URS Corporation; Ex-Diretor de Engenharia do Comando de Operações Especiais da Força Aérea dos EUA; Ex-engenheiro da NASA no Kennedy Space Center; Membro do "Speakers Bureau" da NASA por 12 anos; Embaixador do Laboratório de Propulsão a Jato da NASA.',
        date: '25/05',
        linkPhoto: 'https://avatars.githubusercontent.com/u/24724451?v=4'),
    HomeSpeakerModel(
        name: 'Hector Guerrini Herrera',
        bio:
            'Engenheiro II na URS Corporation; Ex-Diretor de Engenharia do Comando de Operações Especiais da Força Aérea dos EUA; Ex-engenheiro da NASA no Kennedy Space Center; Membro do "Speakers Bureau" da NASA por 12 anos; Embaixador do Laboratório de Propulsão a Jato da NASA.',
        date: '25/05',
        linkPhoto: 'https://avatars.githubusercontent.com/u/24724451?v=4'),
    HomeSpeakerModel(
        name: 'Hector Guerrini Herrera',
        bio:
            'Engenheiro II na URS Corporation; Ex-Diretor de Engenharia do Comando de Operações Especiais da Força Aérea dos EUA; Ex-engenheiro da NASA no Kennedy Space Center; Membro do "Speakers Bureau" da NASA por 12 anos; Embaixador do Laboratório de Propulsão a Jato da NASA.',
        date: '25/05',
        linkPhoto: 'https://avatars.githubusercontent.com/u/24724451?v=4'),
    HomeSpeakerModel(
        name: 'Hector Guerrini Herrera',
        bio:
            'Engenheiro II na URS Corporation; Ex-Diretor de Engenharia do Comando de Operações Especiais da Força Aérea dos EUA; Ex-engenheiro da NASA no Kennedy Space Center; Membro do "Speakers Bureau" da NASA por 12 anos; Embaixador do Laboratório de Propulsão a Jato da NASA.',
        date: '25/05',
        linkPhoto: 'https://avatars.githubusercontent.com/u/24724451?v=4'),
    HomeSpeakerModel(
        name: 'Hector Guerrini Herrera',
        bio:
            'Engenheiro II na URS Corporation; Ex-Diretor de Engenharia do Comando de Operações Especiais da Força Aérea dos EUA; Ex-engenheiro da NASA no Kennedy Space Center; Membro do "Speakers Bureau" da NASA por 12 anos; Embaixador do Laboratório de Propulsão a Jato da NASA.',
        date: '25/05',
        linkPhoto: 'https://avatars.githubusercontent.com/u/24724451?v=4'),
    HomeSpeakerModel(
        name: 'Hector Guerrini Herrera',
        bio:
            'Engenheiro II na URS Corporation; Ex-Diretor de Engenharia do Comando de Operações Especiais da Força Aérea dos EUA; Ex-engenheiro da NASA no Kennedy Space Center; Membro do "Speakers Bureau" da NASA por 12 anos; Embaixador do Laboratório de Propulsão a Jato da NASA.',
        date: '25/05',
        linkPhoto: 'https://avatars.githubusercontent.com/u/24724451?v=4'),
  ];

  @override
  Future<List<HomeSpeakerModel>> getSpeakers() async {
    return Future.value(speakers);
  }
}
