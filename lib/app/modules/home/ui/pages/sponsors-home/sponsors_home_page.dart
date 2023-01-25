import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smile_front/app/modules/home/domain/infra/maua_entities_enum.dart';
import 'package:smile_front/app/modules/home/ui/pages/sponsors-home/sponsor_form_dialog.dart';
import 'package:smile_front/app/modules/home/ui/pages/widgets/entities_logo_widget.dart';
import 'package:smile_front/app/modules/home/ui/pages/widgets/sponsors_widget.dart';
import 'package:smile_front/app/shared/utils/s3_assets_url.dart';
import 'package:smile_front/app/shared/widgets/buttons/forms_button_widget.dart';
import 'package:smile_front/generated/l10n.dart';
import '../../../../../shared/themes/app_colors.dart';
import '../../../../../shared/utils/screen_helper.dart';
import '../../../../../shared/widgets/text-header/text_header.dart';

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
            title: S.of(context).sponsorsTitle,
            leftPadding: Screen.width(context) > 530 ? 32 : 24,
            color: AppColors.brandingBlue,
            fontSize: MediaQuery.of(context).size.width < 900
                ? MediaQuery.of(context).size.width < 530
                    ? 24
                    : 32
                : 48,
          ),
          const CompanySponsor(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: TextHeader(
              title: S.of(context).mauaEntititesTitle,
              leftPadding: Screen.width(context) > 530 ? 32 : 24,
              color: AppColors.brandingOrange,
              fontSize: MediaQuery.of(context).size.width < 530
                  ? 22
                  : MediaQuery.of(context).size.width < 900
                      ? 32
                      : 48,
            ),
          ),
          const EntitiesStack(),
          Column(
            children: const [BeSponsor()],
          )
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
        // ignore: use_build_context_synchronously
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  content: Text(S.of(context).successSendingSponsorEmail),
                ));
      }
    }

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
                        color: AppColors.brandingBlue,
                      )
                    : Container(),
              ),
              Center(
                  child: Padding(
                padding: MediaQuery.of(context).size.width > 530
                    ? const EdgeInsets.all(8.0)
                    : const EdgeInsets.all(0.0),
                child: Text(
                  S.of(context).beSponsorTitle,
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
                        color: AppColors.brandingBlue,
                      )
                    : Container(),
              )
            ],
          ),
          Text(
            S.of(context).beSponsorDescription,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(
            height: 24,
          ),
          Container(
            padding: const EdgeInsets.all(16),
            constraints: const BoxConstraints(maxWidth: 700),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.brandingBlue, width: 4),
                borderRadius: BorderRadius.circular(18)),
            child: Column(
              children: [
                Text(
                  S.of(context).beSponsorDiscount.toUpperCase(),
                  style: const TextStyle(fontSize: 24),
                ),
                MediaQuery.of(context).size.width < 530
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Text(S.of(context).year2023),
                              const SizedBox(
                                height: 8,
                              ),
                              CardDiscount(
                                month: S.of(context).monthJanuary,
                                discount: S.of(context).discount20,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              CardDiscount(
                                month: S.of(context).monthFebruary,
                                discount: S.of(context).discount10,
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
                            children: [
                              Text(S.of(context).year2023),
                              const SizedBox(
                                height: 8,
                              ),
                              CardDiscount(
                                month: S.of(context).monthJanuary,
                                discount: S.of(context).discount20,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              CardDiscount(
                                month: S.of(context).monthFebruary,
                                discount: S.of(context).discount10,
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
            // constraints: BoxConstraints(maxWidth: 700),
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
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16),
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 48,
          runSpacing: 16,
          children: [
            SponsorsWidget(link: mauaAzulLogoUrl, color: Colors.white),
            SponsorsWidget(link: devLogoUrl, color: Colors.white),
            SponsorsWidget(link: patrocinadorGCPLogoUrl, color: Colors.white),
            SponsorsWidget(link: patrocinadorNubeLogoUrl, color: Colors.white),
            SponsorsWidget(
                link: patrocinadorVendraminiLogoUrl, color: Colors.white),
            SponsorsWidget(link: patrocinadorCSNLogoUrl, color: Colors.white),
            SponsorsWidget(
                link: patrocinadorApplusLogoUrl, color: Colors.white),
            SponsorsWidget(
                link: patrocinadorOsborneLogoUrl, color: Colors.white),
            SponsorsWidget(
                link: patrocinadorAlstomLogoUrl, color: Colors.white),
          ],
        ));
  }
}

class EntitiesStack extends StatelessWidget {
  const EntitiesStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomCenter, children: [
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width < 500
            ? MediaQuery.of(context).size.height * 0.15
            : MediaQuery.of(context).size.width < 1000
                ? MediaQuery.of(context).size.height * 0.25
                : MediaQuery.of(context).size.height * 0.60,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.contain,
                image: CachedNetworkImageProvider(
                  entitiesBackground,
                ))),
      ),
      Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.width < 500
                ? MediaQuery.of(context).size.height / 10
                : MediaQuery.of(context).size.width < 1000
                    ? MediaQuery.of(context).size.height / 6
                    : MediaQuery.of(context).size.height / 4),
        child: Wrap(
            alignment: WrapAlignment.center,
            children: MauaEntitiesEnum.values
                .map((e) => EntitiesWidget(
                      entity: e,
                    ))
                .toList()),
      ),
    ]);
  }
}
