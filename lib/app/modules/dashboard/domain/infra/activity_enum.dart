// ignore_for_file: constant_identifier_names

import 'package:enum_to_string/enum_to_string.dart';

import '../../../../shared/utils/s3_assets_url.dart';

enum ActivityEnum {
  CURSOS,
  PALESTRAS,
  PALESTRAS_ALTO_IMPACTO,
  VISITAS_TECNICAS,
  COMPETICOES_ACADEMICAS,
  HACKATHON,
  FEIRA_ESTAGIOS,
  CAFE_EX_ALUNOS,
  ACADEMIA_DE_PROFESSORES,
  ATIVIDADE_CULTURAL,
  GCSP,
  ATIVIDADE_ESPORTIVA
}

extension ActivityEnumExtension on ActivityEnum {
  String get name {
    switch (this) {
      case ActivityEnum.CURSOS:
        return 'Cursos';
      case ActivityEnum.PALESTRAS:
        return 'Palestras';
      case ActivityEnum.PALESTRAS_ALTO_IMPACTO:
        return 'Palestras de Alto Impacto';
      case ActivityEnum.VISITAS_TECNICAS:
        return 'Visitas Técnicas';
      case ActivityEnum.COMPETICOES_ACADEMICAS:
        return 'Competições Acadêmicas';
      case ActivityEnum.HACKATHON:
        return 'Hackathon';
      case ActivityEnum.FEIRA_ESTAGIOS:
        return 'Feira de Estágios';
      case ActivityEnum.CAFE_EX_ALUNOS:
        return 'Café com Ex-aluno(a)';
      case ActivityEnum.ACADEMIA_DE_PROFESSORES:
        return 'Academia de Professores';
      case ActivityEnum.ATIVIDADE_CULTURAL:
        return 'Atividade Cultural';
      case ActivityEnum.GCSP:
        return 'GCSP';
      case ActivityEnum.ATIVIDADE_ESPORTIVA:
        return 'Atividade Esportiva';
    }
  }

  String get description {
    switch (this) {
      case ActivityEnum.CURSOS:
        return 'Os cursos oferecem conteúdo de alta qualidade, ministrados por profissionais renomados e atuantes no mercado. Os cursos oferecem capacitação e atualização dos participantes por meio de conhecimentos teóricos/práticos nas diversas áreas da Administração, Ciência da Computação, Design, Engenharia e Sistemas de Informação.';
      case ActivityEnum.PALESTRAS:
        return 'As palestras são gratuitas e contarão com a participação de profissionais de empresas líderes no mercado, falando sobre os Desafios da Humanidade.';
      case ActivityEnum.PALESTRAS_ALTO_IMPACTO:
        return 'As palestras de alto impacto serão realizadas por profissionais altamente qualificados em suas respectivas áreas de atuação e com destaque na mídia atual. Inscreva-se o quanto antes e garanta a sua vaga!';
      case ActivityEnum.VISITAS_TECNICAS:
        return 'Em busca pela conexão entre o mundo acadêmico e o mercado de trabalho, durante a SMILE serão oferecidas visitas técnicas nas empresas.';
      case ActivityEnum.COMPETICOES_ACADEMICAS:
        return 'Durante a Smile, os participantes poderão se divertir com as atividades de Competição Acadêmica: Campeonato de League Of Legend (on-line) e GameDev Mauá - Game Jam (presencial).';
      case ActivityEnum.HACKATHON:
        return 'Hackathons são eventos que reúnem estudantes, desenvolvedores de software, designers e outros profissionais, com o intuito de num período curto de tempo criarem soluções inovadoras para algum problema específico. Essa sendo uma excelente oportunidade de desenvolver o lado profissional, além de possibilitar a descoberta de novos talentos. Os eventos promovem uma grande interação entre os participantes e oferecem no final premiações para os vencedores.';
      case ActivityEnum.FEIRA_ESTAGIOS:
        return 'Representantes de renomadas empresas irão apresentar Programas de Estágios e Trainee, além de trazer dicas de processos seletivos, entrevistas, dicas de carreira e responder às dúvidas dos participantes.';
      case ActivityEnum.CAFE_EX_ALUNOS:
        return 'A atividade tem como objetivo promover conversas informais entre estudantes do IMT e egressos que ocupam posições de destaque em suas áreas de atuação. Venha participar!';
      case ActivityEnum.ACADEMIA_DE_PROFESSORES:
        return 'A Academia de Professores tem como foco a formação continuada, disseminação de estratégias e ferramentas de ensino para professores do IMT e professores do Ensino Médio.';
      case ActivityEnum.ATIVIDADE_CULTURAL:
        return 'Você faz parte de uma banda? Canta? Toca algum instrumento? Gosta de poesia, literatura? Faz teatro? Dança? Venha compatilhar seu talento com a gente! Será uma tarde de apresentações, integração e muita alegria no campus.';
      case ActivityEnum.GCSP:
        return 'O GCSP - Grand Challenges Scholars Program é um programa que oferece aos alunos de graduação a oportunidade de trabalhar com grandes desafios da humanidade, sendo mentorados por professores.';
      case ActivityEnum.ATIVIDADE_ESPORTIVA:
        return 'Os participantes conhecerão duas atividades interessantes: spikeball e flag football. Além disso, também serão oferecidas diversas atividades, tais como, ginástica funcional, meditação energizante e pilates! Todos os participantes poderão interagir com o(a) palestrante e professores(as)! Acompanhe e participe!';
    }
  }

  String get linkPhoto {
    switch (this) {
      case ActivityEnum.CURSOS:
        return '${previousEditionsBaseUrl}cursos.png';
      case ActivityEnum.PALESTRAS:
        return '${previousEditionsBaseUrl}palestras.png';
      case ActivityEnum.PALESTRAS_ALTO_IMPACTO:
        return '${previousEditionsBaseUrl}palestra_alto_impacto.png';
      case ActivityEnum.VISITAS_TECNICAS:
        return '${previousEditionsBaseUrl}visitas_tecnicas.png';
      case ActivityEnum.COMPETICOES_ACADEMICAS:
        return '${previousEditionsBaseUrl}competicao_academica.png';
      case ActivityEnum.HACKATHON:
        return '${previousEditionsBaseUrl}hackathon.png';
      case ActivityEnum.FEIRA_ESTAGIOS:
        return '${previousEditionsBaseUrl}feira_estagios.png';
      case ActivityEnum.CAFE_EX_ALUNOS:
        return '${previousEditionsBaseUrl}cafe_ex_aluno.png';
      case ActivityEnum.ACADEMIA_DE_PROFESSORES:
        return '${previousEditionsBaseUrl}academia_professores.png';
      case ActivityEnum.ATIVIDADE_CULTURAL:
        return '${previousEditionsBaseUrl}atividade_cultural.png';
      case ActivityEnum.GCSP:
        return '${previousEditionsBaseUrl}gcsp.png';
      case ActivityEnum.ATIVIDADE_ESPORTIVA:
        return '${previousEditionsBaseUrl}atividade_esportiva.png';
    }
  }

  static ActivityEnum stringToEnumMap(String toMap) {
    ActivityEnum type = ActivityEnum.values.firstWhere((type) =>
        EnumToString.convertToString(type).toUpperCase() ==
        toMap.toUpperCase());
    return type;
  }

  static String enumToStringMap(ActivityEnum type) {
    return EnumToString.convertToString(type);
  }
}
