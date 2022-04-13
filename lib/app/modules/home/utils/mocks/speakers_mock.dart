import '../../../../shared/utils/s3_assets_url.dart';
import '../../infra/models/home_speaker_model.dart';

var speakersMock = [
  HomeSpeakerModel(
      name: 'Nina Silva',
      bio:
          'Cursou administração na Universidade Federal Fluminense, teve seu primeiro contato com tecnologia no segundo ano da faculdade, em seu primeiro emprego. Foi convidada a integrar o time da empresa que trabalhava com o sistema ERP da SAP. A partir de então, aprofundou seus estudos, tirou a sua certiﬁcação e trilhou seu caminho dentro da tecnologia.',
      linkPhoto: '${speakersLogoUrl}nina_silva.png'),
  HomeSpeakerModel(
      name: 'Viviane Nunes',
      bio:
          'Viviane Nunes é empresária e diretora da VN Comunicação.  Especialista em relações institucionais, possui especialização em Eficiência Energética e em Gestão de Negócios em Petróleo, Gás e  Biocombustíveis. Em suas palestras são abordados assuntos voltados à estratégias, mulheres no mercado de trabalho e incentivo à formação profissional.',
      linkPhoto: '${speakersLogoUrl}viviane_nunes.png'),
  HomeSpeakerModel(
      name: 'Leila Ferreira',
      bio:
          'Leila Ferreira é graduada em Jornalismo e Letras, com mestrado em Comunicação pela Universidade de Londres, trabalhou como repórter na Rede Globo Minas e, durante dez anos, apresentou o programa “Leila Entrevista”, na Rede Minas e TV Alterosa/SBT, que produziu 13 histórias internacionais. Ela é autora dos livros “Viver não dói”, “A arte de ser leve”, “Mulheres – Por que será que elas…?” e “Leila Entrevista: Bastidores”.',
      linkPhoto: '${speakersLogoUrl}leila_ferreira.png'),
  HomeSpeakerModel(
      name: 'Bóris Fabris',
      bio:
          'Designer, Consultor de Design Automotivo, professor e palestrante com experiências de trabalho internacionais nos EUA, Índia, China, Europa e diversos outros países.',
      linkPhoto: '${speakersLogoUrl}boris_fabris.png'),
  HomeSpeakerModel(
      name: 'Marco Antonio Teixeira',
      bio:
          'Cientista Político, Professor e Pesquisador na área de Gestão e Políticas Públicas. Foi comentarista do programa CBNSP, da Rádio CBN, entre 2012 e 2021, onde tratou de questões ligadas aos problemas da cidade de São Paulo e suas políticas públicas. É um dos editores do Blog "Gestão, Política & Sociedade" abrigado no jornal O Estado de São Paulo.',
      linkPhoto: '${speakersLogoUrl}marco_antonio.png'),
  HomeSpeakerModel(
      name: 'Dr. William Schoenell',
      bio:
          'Se formou em Física pela Univerisade Federal de Santa Catarina, com Doutorado em Astronomia pela Universidade de Granada, trabalhou como Bolsista Técnico FAPESP para a construção de um telescópio robótico no Chile e atualmente trabalha como Especialista em Controle de Instrumentos no Observatório Gigante de Magalhães (GMT).',
      linkPhoto: '${speakersLogoUrl}william_schoenell.jpg'),
];
