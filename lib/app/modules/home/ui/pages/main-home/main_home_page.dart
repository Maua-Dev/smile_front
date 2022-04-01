import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/home/ui/pages/main-home/pages/first_home_page.dart';
import 'package:smile_front/app/modules/home/ui/pages/main-home/pages/next_home_page.dart';
import 'package:smile_front/app/modules/home/ui/pages/main-home/pages/widgets/circular_icon_widget.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';

import '../../../../../shared/utils/s3_assets_url.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends ModularState<MainHomePage, PageController> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  var imgList = [
    const FirstHomePage(),
    NextHomePage(
        imageUrl: '${previousEditionsBaseUrl}atividade_cultural.png',
        title: 'Atividade Cultural',
        description:
            'Um evento integrador entre as áreas de Administração, Design e Engenharia, que tem como objetivo apresentar novas tendências, tecnologias e conteúdos com a finalidade de incentivar o intercâmbio e a atualização de conhecimentos entre profissionais e  estudantes.'),
    NextHomePage(
        imageUrl: '${previousEditionsBaseUrl}hackathon.png',
        title: 'Hackathon',
        description:
            'Hackathons são eventos que reúnem estudantes, desenvolvedores de software, designers e outros profissionais, com o intuito de num período curto de tempo criarem soluções inovadoras para algum problema específico. Essa sendo uma excelente oportunidade de desenvolver o lado profissional, além de possibilitar a descoberta de novos talentos. Os eventos promovem uma grande interação entre os participantes e oferecem no final premiações para os vencedores.'),
    NextHomePage(
        imageUrl: '${previousEditionsBaseUrl}cafe_ex_aluno.png',
        title: 'Café com Ex-aluno',
        description:
            'A atividade tem como objetivo promover conversas informais entre alunos do Instituto Mauá de Tecnologia e egressos que ocupam posições de destaque em suas áreas de atuação. Os egressos mostrarão sua trajetória profissional, desafios, dificuldades e oportunidades da carreira. Venha participar!'),
    NextHomePage(
        imageUrl: '${previousEditionsBaseUrl}palestras.png',
        title: 'Palestras',
        description:
            'As Palestras de Alto Impacto da SMILE 2022 serão realizadas por profissionais altamente qualificados em suas respectivas áreas de atuação e com destaque na mídia atual. Os temas abordados pelos palestrantes estão associados a diferentes áreas, tais como, inovação, tecnologia, liderança, empreendedorismo e filosofia.  As palestras são gratuitas e ocorrerão em ambiente híbrido (presencial - sala H201 e online - via Zoom) com trasnmissão simultânea. Inscreva-se o quanto antes e garanta a sua vaga!'),
    NextHomePage(
        imageUrl: '${previousEditionsBaseUrl}competicao_academica.png',
        title: 'Competição acadêmica',
        description:
            'Os e-Sports, esportes eletrônicos, são competições de alto nível de jogos digitais que atraem um grande número de pessoas no Brasil e no mundo. Vai além de um simples jogo, sua infraestrutura é bastante complexa integrando diversos campos profissionais como Engenharia, Administração e Design. A equipe Mauá e-Sports compete no cenário universitário, venha prestigiar a competição acadêmica da Mauá que acontecerá em um ambiente divertido, colaborativo e tecnológico.'),
  ];

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: CarouselSlider(
            items: imgList,
            carouselController: _controller,
            options: CarouselOptions(
                height: height,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 15,
                height: 15,
                margin:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? AppColors.lightPurple
                            : AppColors.brandingPurple)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
