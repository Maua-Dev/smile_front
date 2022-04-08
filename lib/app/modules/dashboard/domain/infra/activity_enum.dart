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
        return 'Palestras de alto impacto';
      case ActivityEnum.VISITAS_TECNICAS:
        return 'Visitas técnicas';
      case ActivityEnum.COMPETICOES_ACADEMICAS:
        return 'Competições acadêmicas';
      case ActivityEnum.HACKATHON:
        return 'Hackathon';
      case ActivityEnum.FEIRA_ESTAGIOS:
        return 'Feira de estágios';
      case ActivityEnum.CAFE_EX_ALUNOS:
        return 'Café com ex-aluno(a)';
      case ActivityEnum.ACADEMIA_DE_PROFESSORES:
        return 'Academia de professores';
      case ActivityEnum.ATIVIDADE_CULTURAL:
        return 'Atividade cultural';
      case ActivityEnum.GCSP:
        return 'GCSP';
      case ActivityEnum.ATIVIDADE_ESPORTIVA:
        return 'Atividade esportiva';
    }
  }

  String get description {
    switch (this) {
      case ActivityEnum.CURSOS:
        return 'Os cursos oferecem conteúdo de alta qualidade, ministrados por profissionais renomados e atuantes no mercado. Os cursos oferecem capacitação e atualização dos participantes por meio de conhecimentos teóricos/práticos nas diversas áreas da Administração, Ciência da Computação, Design, Engenharia e Sistemas de Informação.';
      case ActivityEnum.PALESTRAS:
        return 'As palestras contarão com a participação de empresas de diversos setores, trazendo profissionais e pesquisadores do Brasil e de outros países, de elevado reconhecimento no mercado, falando sobre os Desafios da Humanidade. As palestras são gratuitas e ocorrerão de forma presencial ou mediadas por tecnologia. Inscreva-se o quanto antes para assistir aos conteúdos técnicos e transversais ligados entre as áreas de Administração, Design, Engenharia, Ciência da Computação e Sistemas de Informação.';
      case ActivityEnum.PALESTRAS_ALTO_IMPACTO:
        return 'As Palestras de Alto Impacto da SMILE 2022 serão realizadas por profissionais altamente qualificados em suas respectivas áreas de atuação e com destaque na mídia atual. Os temas abordados pelos palestrantes estão associados a diferentes áreas, tais como, inovação, tecnologia, liderança, empreendedorismo e filosofia.  As palestras são gratuitas e ocorrerão em ambiente híbrido (presencial - sala H201 e online - via Zoom) com trasnmissão simultânea. Inscreva-se o quanto antes e garanta a sua vaga!';
      case ActivityEnum.VISITAS_TECNICAS:
        return 'A busca pela conexão entre os mundo acadêmico e o mercado de trabalho ainda é um grande desafio institucional. Estreitar a relação é o caminho necessário para trazer o conhecimento acadêmico para as empresas, o que gera benefícios para ambas às partes e de ser almejado pelos estudantes/professores. Assim, os conhecimentos adquiridos pelos estudantes no ambiente escolar agregam experiências, valores pessoais e profissionais. Isso traz motivação para exercer sua profissão no futuro fazendo com que o estudante se inspire cada vez mais na carreira escolhida. Portanto a visita técnica é um recurso metodológico que facilita o processo de ensino/aprendizagem.';
      case ActivityEnum.COMPETICOES_ACADEMICAS:
        return 'Os e-Sports, esportes eletrônicos, são competições de alto nível de jogos digitais que atraem um grande número de pessoas no Brasil e no mundo. Vai além de um simples jogo, sua infraestrutura é bastante complexa integrando diversos campos profissionais como Engenharia, Administração e Design. A equipe Mauá e-Sports compete no cenário universitário, venha prestigiar a competição acadêmica da Mauá que acontecerá em um ambiente divertido, colaborativo e tecnológico.';
      case ActivityEnum.HACKATHON:
        return 'Hackathons são eventos que reúnem estudantes, desenvolvedores de software, designers e outros profissionais, com o intuito de num período curto de tempo criarem soluções inovadoras para algum problema específico. Essa sendo uma excelente oportunidade de desenvolver o lado profissional, além de possibilitar a descoberta de novos talentos. Os eventos promovem uma grande interação entre os participantes e oferecem no final premiações para os vencedores.';
      case ActivityEnum.FEIRA_ESTAGIOS:
        return 'Representantes de renomadas empresas irão apresentar Programas de Estágios e Trainee, além de trazer dicas de processos seletivos, entrevistas, dicas de carreira e responder às dúvidas dos participantes. Serão 10 empresas distribuídas entre os dias 17 e 18 de Maio. Empresas confirmadas: Santander, Accenture, Braskem, Scania, Cisco do Brasil, Nestlé, Ambev, Globo,Thyssenkrupp e Novartis. Condução – Anfitrião - Academia de Talentos';
      case ActivityEnum.CAFE_EX_ALUNOS:
        return 'A atividade tem como objetivo promover conversas informais entre alunos do Instituto Mauá de Tecnologia e egressos que ocupam posições de destaque em suas áreas de atuação. Os egressos mostrarão sua trajetória profissional, desafios, dificuldades e oportunidades da carreira. Venha participar!';
      case ActivityEnum.ACADEMIA_DE_PROFESSORES:
        return 'A Academia dos Professores visa contribuir para a formação de um professor que seja colaborador na construção do Projeto Pedagógico Institucional do CEUN-IMT e alinhado com o Modelo Mauá de Ensino, tendo como referência métodos e estratégias de ensino que promovam um aprendizado efetivo dos Conhecimentos, Habilidades e Atitudes importantes para a formação de um profissional empreendedor, versátil e com forte base técnica e conceitual. Na SMILE 2022 a Academia de Professores tem como foco a formação continuada, disseminação de estratégias e ferramentas de ensino para professores do IMT e professores do Ensino Médio.';
      case ActivityEnum.ATIVIDADE_CULTURAL:
        return 'Em 20 de maio de 2022, das 15h às 19h, no auditório H201, haverá um Show de Talentos com votação e premiação aos participantes! Toda a comunidade Mauá é bem-vinda! Alunos, professores e funcionários estão convidados a compartilhar seus talentos. Você faz parte de uma banda? Canta? Toca algum instrumento? Gosta de poesia, literatura? Faz teatro? Dança? Vem compatilhar seu talento com a gente! Será uma tarde de apresentações, integração e muita alegria no campus. O auditório estará equipado e sonorizado, técnicos de som estarão presentes e toda a estrutura necessária estará lá para você se apresentar. Para se inscrever e se apresentar, preencha o "forms" e compareça. Para assistir o show e prestigiar os colegas, só vem! Em caso de dúvida, mande um e-mail para a professora Juliana Cordeiro (juliana.rc@maua.br). Esperamos vocês!';
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
