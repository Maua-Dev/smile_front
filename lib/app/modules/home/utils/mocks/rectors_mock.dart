import 'package:smile_front/app/modules/home/domain/entities/rectors.dart';

import '../../../../shared/utils/s3_assets_url.dart';

final mockRectors = [
  Rectors(
    image: '${rectorsBaseUrl}JoseCarlos.jpg',
    name: 'Prof. Dr. José Carlos de Souza Junior',
    role: 'Reitor do CEUN-IMT',
    text:
        'Acreditamos que a integração e colaboração de nossas diversas potencialidades, com a forte interação com a sociedade, são determinantes na transformação profissional, social e pessoal que defendemos. É nesse espírito que nasce a Semana Mauá de Inovação, Liderança e Empreendedorismo – SMILE. Aproveitem ao máximo o fruto do cuidadoso trabalho desenvolvido por nossos colegas que, com Inovação, Liderança e Empreendedorismo assumiram o desafio de nos oferecer essa oportunidade.',
  ),
  Rectors(
    image: '${rectorsBaseUrl}MarcelloNitz.jpg',
    name: 'Prof. Dr. Marcello Nitz da Costa',
    role: 'Pró-Reitor Acadêmico do CEUN-IMT',
    text:
        'Caros participantes,\nSejam bem-vindos à SMILE. A programação foi cuidadosamente preparada para que vocês se desenvolvam pessoal e profissionalmente. Haverá vasta oferta de palestras, visitas técnicas, cursos e muitas oportunidades de integração pessoal, de modo a ampliar a sua rede de relacionamentos. Aproveitem!',
  ),
];
