import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smile_front/app/modules/home/ui/pages/sponsors-home/sponsor_form_dialog.dart';
import 'package:smile_front/app/shared/utils/s3_assets_url.dart';
import 'package:smile_front/app/shared/widgets/buttons/forms_button_widget.dart';

import '../../../../../shared/themes/app_colors.dart';
import '../../../../../shared/themes/app_text_styles.dart';
import '../../../../../shared/widgets/text-header/text_header.dart';
import '../../../utils/text_utils.dart';

class SponsorsHomePage extends StatefulWidget {
  const SponsorsHomePage({Key? key}) : super(key: key);

  @override
  State<SponsorsHomePage> createState() => _SponsorsHomePageState();
}

class _SponsorsHomePageState extends State<SponsorsHomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        children: [
          TextHeader(
            title: 'Patrocinadores',
            leftPadding: 32,
            color: AppColors.brandingPurple,
            fontSize: MediaQuery.of(context).size.width < 530 ? 28 : null,
          ),
          const CompanySponsor(),
          Column(
            children: const [BeSponsor()],
          )
        ],
      ),
    );
  }
}

const listBenefits = [
  {
    'level': 4,
    'description': 'Video elaborado pelo patrocinador para divulgação no site.'
  },
  {
    'level': 4,
    'description':
        'Video teaser do patrocinador para divulgação na palestra de alto impacto.'
  },
  {'level': 4, 'description': 'Estande VIP na Feira de estágios.'},
  {'level': 4, 'description': 'Palestra ou curso a ser ministrado no evento.'},
  {
    'level': 3,
    'description':
        'Divulgação do logo do patrocinador no site e em e-mails com direcionamento ao site da empresa.'
  },
  {'level': 2, 'description': 'Divulgação do logo do patrocinador na sacola.'},
  {
    'level': 2,
    'description': 'Divulgação do patrocinador nas redes sociais do IMT.'
  },
  {
    'level': 2,
    'description':
        'Inserção do folder ou brinde do patrocinador na sacola do evento.'
  },
  {
    'level': 1,
    'description': 'Espaço para divulgação do estande na feira estágios.'
  },
];
const colorsPlan = <int, Color>{
  4: Color(0xFF00CDB4),
  3: Color(0xFFDFB759),
  2: Color(0xFFCECECE),
  1: Color(0xFFE0804A),
};
const planTextStyle = TextStyle(fontSize: 35, fontWeight: FontWeight.w700);
const plansWidgets = [
  PlanWidget(
      planTextStyle: planTextStyle,
      planName: 'DIAMANTE',
      level: 4,
      price: '10.000'),
  PlanWidget(
    planTextStyle: planTextStyle,
    planName: 'OURO',
    level: 3,
    price: '5.000',
  ),
  PlanWidget(
    planTextStyle: planTextStyle,
    planName: 'PRATA',
    level: 2,
    price: '3.000',
  ),
  PlanWidget(
    planTextStyle: planTextStyle,
    planName: 'BRONZE',
    level: 1,
    price: '1.000',
  )
];

class BeSponsor extends StatelessWidget {
  const BeSponsor({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: MediaQuery.of(context).size.width > 530
                    ? Container(
                        alignment: Alignment.center,
                        height: 2,
                        color: AppColors.brandingPurple,
                      )
                    : Container(),
              ),
              Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Seja Nosso Patrocinador',
                  style: TextStyle(
                      fontSize:
                          MediaQuery.of(context).size.width < 530 ? 28 : 35,
                      fontWeight: FontWeight.w900),
                ),
              )),
              Expanded(
                child: MediaQuery.of(context).size.width > 530
                    ? Container(
                        alignment: Alignment.center,
                        height: 2,
                        color: AppColors.brandingPurple,
                      )
                    : Container(),
              )
            ],
          ),
          const Text(
            'A SMILE traz uma oportunidade de parceria e integração entre o mercado de trabalho e o meio acadêmico. Venha ser Patrocinador do evento e conheça os benefícios e oportunidades que a SMILE oferece. Nessa edição, estão disponibilizadas 4 tipos de cotas de patrocínio: Diamante, Ouro, Prata e Bronze. Além disso, ao fechar o patrocínio com antecedência, haverá desconto progressivo nas cotas. As informações sobre os cotas e benefícios estão a seguir.',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(
            height: 24,
          ),
          Container(
            padding: const EdgeInsets.all(16),
            constraints: const BoxConstraints(maxWidth: 700),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.brandingPurple, width: 4),
                borderRadius: BorderRadius.circular(18)),
            child: Column(
              children: [
                const Text(
                  'DESCONTOS',
                  style: TextStyle(fontSize: 24),
                ),
                MediaQuery.of(context).size.width < 530
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: const [
                              Text('2022'),
                              SizedBox(
                                height: 8,
                              ),
                              CardDiscount(
                                month: 'Outubro',
                                discount: '50% Off',
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              CardDiscount(
                                month: 'Novembro',
                                discount: '40% Off',
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              CardDiscount(
                                month: 'Dezembro',
                                discount: '30% Off',
                              ),
                            ],
                          ),
                          Column(
                            children: const [
                              Text('2023'),
                              SizedBox(
                                height: 8,
                              ),
                              CardDiscount(
                                month: 'Janeiro',
                                discount: '10% Off',
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              CardDiscount(
                                month: 'Fevereiro',
                                discount: '0% Off',
                              )
                            ],
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: const [
                              Text('2022'),
                              SizedBox(
                                height: 8,
                              ),
                              CardDiscount(
                                month: 'Outubro',
                                discount: '50% Off',
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              CardDiscount(
                                month: 'Novembro',
                                discount: '40% Off',
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              CardDiscount(
                                month: 'Dezembro',
                                discount: '30% Off',
                              ),
                            ],
                          ),
                          Column(
                            children: const [
                              Text('2023'),
                              SizedBox(
                                height: 8,
                              ),
                              CardDiscount(
                                month: 'Janeiro',
                                discount: '10% Off',
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              CardDiscount(
                                month: 'Fevereiro',
                                discount: '0% Off',
                              )
                            ],
                          ),
                        ],
                      )
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          MediaQuery.of(context).size.width < 530
              ? ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => plansWidgets[index],
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 50,
                      ),
                  itemCount: plansWidgets.length)
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: plansWidgets,
                ),
          Container(
            // constraints: BoxConstraints(maxWidth: 700),
            padding: EdgeInsets.all(
                MediaQuery.of(context).size.width < 530 ? 24 : 32),
            child: MediaQuery.of(context).size.width < 530
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 300,
                        child: Text(
                          'Caso tenha interesse em patrocinar o evento, clique aqui para mais informações. ',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        constraints: BoxConstraints(
                            minWidth: double.infinity,
                            minHeight:
                                MediaQuery.of(context).size.height * 0.09),
                        child: FormsButtonWidget(
                          buttonTittle: 'INFORMAÇÕES SOBRE PATROCÍNIO',
                          backgroundColor: const Color(0xFFD36D49),
                          onPressed: () => showDialog(
                            context: context,
                            builder: (context) => const SponsorFormDialog(),
                          ),
                        ),
                      )
                    ],
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 300,
                        child: Text(
                          'Caso tenha interesse em patrocinar o evento, clique aqui para mais informações. ',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      FormsButtonWidget(
                        buttonTittle: 'INFORMAÇÕES SOBRE PATROCÍNIO',
                        backgroundColor: const Color(0xFFD36D49),
                        onPressed: () => showDialog(
                          context: context,
                          builder: (context) => const SponsorFormDialog(),
                        ),
                      )
                    ],
                  ),
          )
        ],
      ),
    );
  }
}

class CardDiscount extends StatelessWidget {
  const CardDiscount({
    Key? key,
    required this.month,
    required this.discount,
  }) : super(key: key);
  final String month;
  final String discount;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 250),
      padding: const EdgeInsets.all(8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: const Color(0xFFD36D49),
          border: Border.all(color: AppColors.brandingPurple, width: 2),
          borderRadius: BorderRadius.circular(8)),
      child: Text.rich(
        TextSpan(style: const TextStyle(color: Colors.white), children: [
          TextSpan(text: month),
          const WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: Icon(
                Icons.arrow_circle_right_rounded,
                color: Colors.white,
                size: 24,
              )),
          TextSpan(text: discount)
        ]),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class PlanWidget extends StatelessWidget {
  const PlanWidget(
      {Key? key,
      required this.planTextStyle,
      required this.planName,
      required this.level,
      required this.price})
      : super(key: key);
  final String planName;
  final TextStyle planTextStyle;
  final int level;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 300),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(color: colorsPlan[level]!, width: 2),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Container(
            color: colorsPlan[level]!.withOpacity(0.5),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(
                  width: 30,
                  image: CachedNetworkImageProvider(
                      '${s3AssetsBaseUrl}Estrela_${planName.toLowerCase()}.png'),
                ),
                Text(
                  planName,
                  textAlign: TextAlign.center,
                  style: planTextStyle.copyWith(
                    color: colorsPlan[level],
                  ),
                )
              ],
            ),
          ),
          ...listBenefits.map((e) => ListTile(
                leading: Icon(
                    (e['level'] as int) <= level
                        ? Icons.check_box_outlined
                        : Icons.check_box_outline_blank_outlined,
                    color: (e['level'] as int) <= level ? Colors.green : null),
                title: Text(
                  '${e['description']}',
                  style: const TextStyle(fontSize: 14),
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              color: colorsPlan[level],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(18),
            child: Text.rich(
              TextSpan(
                  text: 'R\$ ',
                  style: const TextStyle(color: Colors.green),
                  children: [
                    TextSpan(
                      text: price,
                      style: const TextStyle(color: Colors.black),
                    )
                  ]),
              style: const TextStyle(fontSize: 28),
            ),
          )
        ],
      ),
    );
  }
}

class CompanySponsor extends StatelessWidget {
  const CompanySponsor({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 900
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                            '${s3AssetsBaseUrl}full_logo_dev.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    devPresentation,
                    textAlign: TextAlign.justify,
                    style: AppTextStyles.body.copyWith(
                        color: Colors.black,
                        fontSize:
                            MediaQuery.of(context).size.width < 1200 ? 16 : 18),
                  ),
                ),
              ],
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(bottom: 16.0, left: 16, right: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                            '${s3AssetsBaseUrl}full_logo_dev.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(
                    devPresentation,
                    textAlign: TextAlign.justify,
                    style: AppTextStyles.body.copyWith(
                        color: Colors.black,
                        fontSize:
                            MediaQuery.of(context).size.width < 1200 ? 16 : 18),
                  ),
                ),
              ],
            ),
          );
  }
}
