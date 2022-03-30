import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/shared/entities/card_activity.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/utils/capitalize.dart';
import 'package:smile_front/app/shared/widgets/dialogs/nothing_to_see_dialog_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../shared/themes/app_text_styles.dart';
import '../../utils/final_time_calculation.dart';
import '../widgets/register_button_widget.dart';

class MoreInfoPage extends StatefulWidget {
  final CardActivity activity;
  final bool isRegistered;

  const MoreInfoPage(
      {Key? key, required this.activity, required this.isRegistered})
      : super(key: key);

  @override
  State<MoreInfoPage> createState() => _MoreInfoPageState();
}

class _MoreInfoPageState extends State<MoreInfoPage> {
  @override
  Widget build(BuildContext context) {
    var timeString = widget.activity.date == null
        ? ''
        : DateFormat('HH:mm').format(widget.activity.date!);
    var weekday = widget.activity.date == null
        ? ''
        : DateFormat('EEEE')
            .format(widget.activity.date!)
            .split('-')
            .first
            .capitalize();
    var finalTime =
        widget.activity.duration == null || widget.activity.date == null
            ? ''
            : getActivityFinalTime(
                widget.activity.date!, widget.activity.duration!);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.05,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: AppColors.lilac),
              child: Center(
                child: Text(
                  widget.activity.type!.name.toUpperCase(),
                  textAlign: TextAlign.justify,
                  style: AppTextStyles.buttonBold.copyWith(
                      fontSize:
                          MediaQuery.of(context).size.width < 1000 ? 22 : 28,
                      color: AppColors.brandingPurple),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.activity.title,
                style: AppTextStyles.buttonBold.copyWith(
                    fontSize:
                        MediaQuery.of(context).size.width < 1000 ? 22 : 28,
                    color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      widget.activity.date == null
                          ? ''
                          : DateFormat('dd/MM').format(widget.activity.date!),
                      style: AppTextStyles.buttonBold.copyWith(
                          fontSize: MediaQuery.of(context).size.width < 1000
                              ? 14
                              : 18,
                          color: AppColors.brandingPurple),
                    ),
                    Text(
                      weekday,
                      style: AppTextStyles.buttonBold.copyWith(
                          fontSize: MediaQuery.of(context).size.width < 1000
                              ? 20
                              : 24,
                          color: AppColors.brandingPurple),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Horário',
                      style: AppTextStyles.buttonBold.copyWith(
                          fontSize: MediaQuery.of(context).size.width < 1000
                              ? 14
                              : 18,
                          color: AppColors.brandingPurple),
                    ),
                    Text(
                      '$timeString - $finalTime',
                      style: AppTextStyles.buttonBold.copyWith(
                          fontSize: MediaQuery.of(context).size.width < 1000
                              ? 20
                              : 24,
                          color: AppColors.brandingPurple),
                    ),
                  ],
                ),
                if (widget.activity.location != null)
                  Column(
                    children: [
                      Text(
                        'Local',
                        style: AppTextStyles.buttonBold.copyWith(
                            fontSize: MediaQuery.of(context).size.width < 1000
                                ? 14
                                : 18,
                            color: AppColors.brandingPurple),
                      ),
                      Text(
                        widget.activity.location!,
                        style: AppTextStyles.buttonBold.copyWith(
                            fontSize: MediaQuery.of(context).size.width < 1000
                                ? 20
                                : 24,
                            color: AppColors.brandingPurple),
                      ),
                    ],
                  ),
                if (widget.activity.link != null && widget.isRegistered)
                  Column(
                    children: [
                      Text(
                        'Zoom',
                        style: AppTextStyles.buttonBold.copyWith(
                            fontSize: MediaQuery.of(context).size.width < 1000
                                ? 14
                                : 18,
                            color: AppColors.brandingPurple),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: Transform.rotate(
                              angle: 135 * math.pi / 180,
                              child: Icon(
                                Icons.link,
                                color: AppColors.brandingPurple,
                                size: MediaQuery.of(context).size.width < 1000
                                    ? 20
                                    : 24,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => launch(widget.activity.link!),
                            child: Text('Link',
                                style: AppTextStyles.buttonBold.copyWith(
                                    fontSize:
                                        MediaQuery.of(context).size.width < 1000
                                            ? 20
                                            : 24,
                                    color: AppColors.brandingPurple)),
                          ),
                        ],
                      ),
                    ],
                  ),
              ],
            ),
            if (widget.isRegistered)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Código',
                          style: AppTextStyles.buttonBold.copyWith(
                              fontSize: MediaQuery.of(context).size.width < 1000
                                  ? 14
                                  : 18,
                              color: AppColors.brandingPurple),
                        ),
                        Text(
                          '9999999999',
                          style: AppTextStyles.buttonBold.copyWith(
                              fontSize: MediaQuery.of(context).size.width < 1000
                                  ? 20
                                  : 24,
                              color: AppColors.brandingPurple),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                      children: [
                        Text(
                          'Senha',
                          style: AppTextStyles.buttonBold.copyWith(
                              fontSize: MediaQuery.of(context).size.width < 1000
                                  ? 14
                                  : 18,
                              color: AppColors.brandingPurple),
                        ),
                        Text(
                          '9999999999',
                          style: AppTextStyles.buttonBold.copyWith(
                              fontSize: MediaQuery.of(context).size.width < 1000
                                  ? 20
                                  : 24,
                              color: AppColors.brandingPurple),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            const SizedBox(
              height: 16,
            ),
            Center(
              child: RegisterButtonWidget(
                isRegistered: widget.isRegistered,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return NothingToSeeDialogWidget(
                          onPressed: () {
                            Modular.to.pop();
                          },
                          title: 'Inscrições ainda não liberadas.',
                          content: 'Aguarde novas informações!',
                        );
                      });
                },
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Descrição',
                  style: AppTextStyles.buttonBold.copyWith(
                      fontSize:
                          MediaQuery.of(context).size.width < 1000 ? 24 : 28,
                      color: AppColors.brandingPurple)),
            ),
            const SizedBox(
              height: 8,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(widget.activity.description,
                  textAlign: TextAlign.justify,
                  style: AppTextStyles.body.copyWith(
                      fontSize:
                          MediaQuery.of(context).size.width < 1000 ? 18 : 22,
                      color: Colors.black)),
            ),
            const SizedBox(
              height: 16,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.activity.speakers!.length,
              itemBuilder: (context, index) => Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (widget.activity.speakers![index].linkPhoto != null)
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.1,
                          height: MediaQuery.of(context).size.width * 0.1,
                          child: CircleAvatar(
                            radius: 102.0,
                            backgroundImage: NetworkImage(widget
                                .activity
                                .speakers![index]
                                .linkPhoto!), // for Network image
                          ),
                        ),
                      Column(
                        children: [
                          Text(
                            widget.activity.speakers![index].name,
                            textAlign: TextAlign.justify,
                            style: AppTextStyles.buttonBold.copyWith(
                                fontSize:
                                    MediaQuery.of(context).size.width < 1000
                                        ? 22
                                        : 28,
                                color: Colors.black),
                          ),
                          Text(
                            'Empresa: ${widget.activity.speakers![index].company}',
                            textAlign: TextAlign.justify,
                            style: AppTextStyles.buttonBold.copyWith(
                                fontSize:
                                    MediaQuery.of(context).size.width < 1000
                                        ? 14
                                        : 20,
                                color: AppColors.brandingPurple),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(widget.activity.speakers![index].bio,
                        textAlign: TextAlign.justify,
                        style: AppTextStyles.body.copyWith(
                            fontSize: MediaQuery.of(context).size.width < 1000
                                ? 18
                                : 22,
                            color: Colors.black)),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
