import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smile_front/app/modules/home/ui/pages/sponsors-home/sponsor_form_dialog.dart';
import 'package:smile_front/app/modules/home/ui/pages/widgets/entities_carousel_widget.dart';
import 'package:smile_front/app/modules/home/ui/pages/widgets/header/h1_header_text_widget.dart';
import 'package:smile_front/app/modules/home/ui/pages/widgets/sponsors_widget.dart';
import 'package:smile_front/app/shared/utils/s3_assets_url.dart';
import 'package:smile_front/app/shared/widgets/buttons/forms_button_widget.dart';
import 'package:smile_front/generated/l10n.dart';
import '../../../../../shared/entities/screen_variables.dart';
import '../../../../../shared/themes/app_colors.dart';
import '../../../../../shared/utils/screen_helper.dart';

class SponsorsHomePage extends StatefulWidget {
  const SponsorsHomePage({Key? key}) : super(key: key);

  @override
  State<SponsorsHomePage> createState() => _SponsorsHomePageState();
}

class _SponsorsHomePageState extends State<SponsorsHomePage> {
  final entitiesKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        children: [
          SizedBox(key: entitiesKey, child: const EntitiesCarouselWidget()),
          const SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }
}

var listBenefits = [
  {'level': 4, 'description': S.current.benefitsSponsorSchema('one')},
  {'level': 4, 'description': S.current.benefitsSponsorSchema('two')},
  {'level': 4, 'description': S.current.benefitsSponsorSchema('three')},
  {'level': 4, 'description': S.current.benefitsSponsorSchema('four')},
  {'level': 3, 'description': S.current.benefitsSponsorSchema('five')},
  {'level': 2, 'description': S.current.benefitsSponsorSchema('six')},
  {'level': 2, 'description': S.current.benefitsSponsorSchema('seven')},
  {'level': 2, 'description': S.current.benefitsSponsorSchema('eight')},
  {'level': 1, 'description': S.current.benefitsSponsorSchema('nine')},
];
const colorsPlan = <int, Color>{
  4: Color(0xFF00CDB4),
  3: Color(0xFFDFB759),
  2: Color(0xFFCECECE),
  1: Color(0xFFE0804A),
};
const planTextStyle = TextStyle(fontSize: 35, fontWeight: FontWeight.w700);
var plansWidgets = [
  PlanWidget(
      planTextStyle: planTextStyle,
      planName: S.current.planSponsorSchema('diamond'),
      level: 4,
      price: S.current.planPriceSponsorSchema('diamond')),
  PlanWidget(
    planTextStyle: planTextStyle,
    planName: S.current.planSponsorSchema('gold'),
    level: 3,
    price: S.current.planPriceSponsorSchema('gold'),
  ),
  PlanWidget(
    planTextStyle: planTextStyle,
    planName: S.current.planSponsorSchema('silver'),
    level: 2,
    price: S.current.planPriceSponsorSchema('silver'),
  ),
  PlanWidget(
    planTextStyle: planTextStyle,
    planName: S.current.planSponsorSchema('bronze'),
    level: 1,
    price: S.current.planPriceSponsorSchema('bronze'),
  )
];

class BeSponsor extends StatelessWidget {
  const BeSponsor({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> openForms() async {
      var res = await showDialog<bool?>(
        context: context,
        builder: (context) => const SponsorFormDialog(),
      );
      if (res != null && res) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  content: Text(S.of(context).successSendingSponsorEmail),
                ));
      }
    }

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Screen.width(context) < cellphoneSize
              ? 16
              : Screen.width(context) < tabletSize
                  ? 32
                  : 64),
      child: Column(
        children: [
          H1HeaderTextWidget(
            title: S.of(context).beSponsorTitle,
          ),
          Text(
            S.of(context).beSponsorDescription,
            style: TextStyle(
                fontSize: Screen.width(context) < tabletSize ? 18 : 25),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(
            height: 24,
          ),
          MediaQuery.of(context).size.width < 530
              ? ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => plansWidgets[index],
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 50,
                      ),
                  itemCount: plansWidgets.length)
              : Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width < 1200
                        ? 0.9 * MediaQuery.of(context).size.width
                        : MediaQuery.of(context).size.width,
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing:
                          MediaQuery.of(context).size.width < 1200 ? 64 : 80,
                      runSpacing: 32,
                      children: plansWidgets,
                    ),
                  ),
                ),
          Container(
            padding: EdgeInsets.all(
                MediaQuery.of(context).size.width < 530 ? 18 : 32),
            child: MediaQuery.of(context).size.width < 710
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 300,
                        child: Text(
                          S.of(context).beSponsorMoreInfoDescription,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width < 500
                                ? 0.7 * MediaQuery.of(context).size.width
                                : MediaQuery.of(context).size.width * 0.6),
                        child: FormsButtonWidget(
                            buttonTittle: S.of(context).beSponsorMoreInfoTitle,
                            backgroundColor: const Color(0xFFD36D49),
                            onPressed: openForms),
                      )
                    ],
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 300,
                        child: Text(
                          S.of(context).beSponsorMoreInfoDescription,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      FormsButtonWidget(
                          buttonTittle: S.of(context).beSponsorMoreInfoTitle,
                          backgroundColor: const Color(0xFFD36D49),
                          onPressed: openForms)
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
          border: Border.all(color: AppColors.brandingBlue, width: 2),
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
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 48,
              runSpacing: 25,
              children: [
                SponsorsWidget(
                  link: mauaAzulLogoUrl,
                  color: Colors.white,
                  size: 0.8,
                ),
                SponsorsWidget(
                    link: devLogoUrl, color: Colors.white, size: 0.8),
              ],
            ),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 48,
              runSpacing: 25,
              children: [
                SponsorsWidget(
                    link: patrocinadorAlstomLogoUrl,
                    color: Colors.white,
                    size: 0.6),
                SponsorsWidget(
                    link: patrocinadorApplusLogoUrl,
                    color: Colors.white,
                    size: 0.6),
                SponsorsWidget(
                    link: patrocinadorBungeLogoUrl,
                    color: Colors.white,
                    size: 0.65),
              ],
            ),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 48,
              runSpacing: 25,
              children: [
                SponsorsWidget(
                    link: patrocinadorCSNLogoUrl,
                    color: Colors.white,
                    size: 0.6),
                SponsorsWidget(
                    link: patrocinadorGCPLogoUrl,
                    color: Colors.white,
                    size: 0.6),
                SponsorsWidget(
                    link: patrocinadorOsborneLogoUrl,
                    color: Colors.white,
                    size: 0.6),
              ],
            ),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 48,
              runSpacing: 25,
              children: [
                SponsorsWidget(
                    link: patrocinadorVendraminiLogoUrl,
                    color: Colors.white,
                    size: 0.4),
                SponsorsWidget(
                    link: patrocinadorAzulLogoUrl,
                    color: Colors.white,
                    size: 0.4),
                SponsorsWidget(
                    link: patrocinadorBritivicLogoUrl,
                    color: Colors.white,
                    size: 0.4),
              ],
            ),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 48,
              runSpacing: 25,
              children: [
                SponsorsWidget(
                    link: patrocinadorNubeLogoUrl,
                    color: Colors.white,
                    size: 0.4),
                SponsorsWidget(
                    link: patrocinadorGmLogoUrl,
                    color: Colors.white,
                    size: 0.4),
                SponsorsWidget(
                    link: patrocinadorCengageLogoUrl,
                    color: Colors.white,
                    size: 0.5),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
