import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/more_info_controller.dart';
import 'package:smile_front/app/shared/models/enrolls_activity_model.dart';
import 'dart:math' as math;
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../shared/entities/infra/enrollment_state_enum.dart';
import '../../../../shared/themes/app_text_styles.dart';
import '../../../../shared/utils/utils.dart';
import '../../../../shared/widgets/dialogs/action_confirmation_dialog_widget.dart';
import '../../../../shared/widgets/dialogs/custom_alert_dialog_widget.dart';
import '../../domain/infra/activity_enum.dart';
import 'widgets/register_button_widget.dart';

class MoreInfoPage extends StatefulWidget {
  final EnrollsActivityModel enrolledActivity;

  const MoreInfoPage({super.key, required this.enrolledActivity});

  @override
  State<MoreInfoPage> createState() => _MoreInfoPageState();
}

class _MoreInfoPageState
    extends ModularState<MoreInfoPage, MoreInfoController> {
  @override
  Widget build(BuildContext context) {
    var timeString = widget.enrolledActivity.startDate == null
        ? ''
        : DateFormat('HH:mm').format(widget.enrolledActivity.startDate!);
    var weekday = widget.enrolledActivity.startDate == null
        ? ''
        : DateFormat('EEEE')
            .format(widget.enrolledActivity.startDate!)
            .split('-')
            .first
            .capitalize();
    var finalTime = widget.enrolledActivity.startDate == null
        ? ''
        : Utils.getActivityFinalTime(widget.enrolledActivity.startDate!,
            widget.enrolledActivity.duration);
    return SafeArea(
      child: SingleChildScrollView(
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
                    widget.enrolledActivity.type!.name,
                    textAlign: TextAlign.justify,
                    style: AppTextStyles.buttonBold.copyWith(
                      fontSize: MediaQuery.of(context).size.width < 800
                          ? 18
                          : MediaQuery.of(context).size.width < 1000
                              ? 22
                              : 28,
                      color: AppColors.brandingBlue,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${widget.enrolledActivity.activityCode} - ${widget.enrolledActivity.title}',
                  textAlign: TextAlign.justify,
                  style: AppTextStyles.buttonBold.copyWith(
                      fontSize: MediaQuery.of(context).size.width < 800
                          ? 20
                          : MediaQuery.of(context).size.width < 1000
                              ? 24
                              : 28,
                      color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              /* Observer(builder: (_) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          widget.enrolledActivity.startDate == null
                              ? ''
                              : DateFormat('dd/MM').format(
                                  widget.enrolledActivity.startDate!),
                          style: AppTextStyles.buttonBold.copyWith(
                              fontSize: MediaQuery.of(context).size.width < 800
                                  ? 10
                                  : MediaQuery.of(context).size.width < 1000
                                      ? 14
                                      : 18,
                              color: AppColors.brandingBlue),
                        ),
                        Text(
                          weekday,
                          style: AppTextStyles.buttonBold.copyWith(
                              fontSize: MediaQuery.of(context).size.width < 800
                                  ? 14
                                  : MediaQuery.of(context).size.width < 1000
                                      ? 20
                                      : 24,
                              color: AppColors.brandingBlue),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Horário',
                          style: AppTextStyles.buttonBold.copyWith(
                              fontSize: MediaQuery.of(context).size.width < 800
                                  ? 10
                                  : MediaQuery.of(context).size.width < 1000
                                      ? 14
                                      : 18,
                              color: AppColors.brandingBlue),
                        ),
                        Text(
                          '$timeString - $finalTime',
                          style: AppTextStyles.buttonBold.copyWith(
                              fontSize: MediaQuery.of(context).size.width < 800
                                  ? 14
                                  : MediaQuery.of(context).size.width < 1000
                                      ? 20
                                      : 24,
                              color: AppColors.brandingBlue),
                        ),
                      ],
                    ),
                    if (widget.enrolledActivity.place != null)
                      Column(
                        children: [
                          Text(
                            'Local',
                            style: AppTextStyles.buttonBold.copyWith(
                                fontSize: MediaQuery.of(context).size.width <
                                        800
                                    ? 10
                                    : MediaQuery.of(context).size.width < 1000
                                        ? 14
                                        : 18,
                                color: AppColors.brandingBlue),
                          ),
                          Text(
                            widget.enrolledActivity.place!,
                            style: AppTextStyles.buttonBold.copyWith(
                                fontSize: MediaQuery.of(context).size.width <
                                        800
                                    ? 14
                                    : MediaQuery.of(context).size.width < 1000
                                        ? 20
                                        : 24,
                                color: AppColors.brandingBlue),
                          ),
                        ],
                      ),
                    if (widget.enrolledActivity.link != null)
                      Column(
                        children: [
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 4),
                                  child: Transform.rotate(
                                    angle: 135 * math.pi / 180,
                                    child: Icon(
                                      Icons.link,
                                      color: AppColors.brandingBlue,
                                      size: MediaQuery.of(context).size.width <
                                              800
                                          ? 14
                                          : MediaQuery.of(context).size.width <
                                                  1000
                                              ? 20
                                              : 24,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => launchUrl(
                                    Uri.parse(
                                        widget.enrolledActivity.link!),
                                    mode: LaunchMode.externalApplication,
                                  ),
                                  child: Text('Link',
                                      style: AppTextStyles.buttonBold.copyWith(
                                          decoration: TextDecoration.underline,
                                          fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width <
                                                  800
                                              ? 14
                                              : MediaQuery.of(context)
                                                          .size
                                                          .width <
                                                      1000
                                                  ? 20
                                                  : 24,
                                          color: AppColors.brandingBlue)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                  ],
                );
              }),
              const SizedBox(
                height: 16,
              ),
              Observer(builder: (_) {
                return !widget.enrolledActivity.acceptingNewEnrollments
                    ? Text(
                        'Inscrição para a atividade indisponível!',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.titleH1.copyWith(
                            color: AppColors.brandingBlue,
                            fontSize: MediaQuery.of(context).size.width < 800
                                ? 22
                                : MediaQuery.of(context).size.width < 1000
                                    ? 26
                                    : 30),
                      )
                    : Center(
                        child: RegisterButtonWidget(
                            isRegistered: widget.enrolledActivity.state,
                            isLoading: controller.isLoading,
                            onPressed: () {
                              if (!widget.enrolledActivity
                                      .acceptingNewEnrollments &&
                                  widget.enrolledActivity.state ==
                                      EnrollmentStateEnum.ENROLLED) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Observer(builder: (context) {
                                      return ActionConfirmationDialogWidget(
                                          isLoading: controller.isLoading,
                                          title:
                                              'Tem certeza que deseja se desinscrever?',
                                          content:
                                              'Cuidado: inscrições desta atividade encerradas, você não conseguirá se inscrever novamente!',
                                          onPressed: () {
                                            controller.unsubscribeUserActivity(
                                                widget.enrolledActivity
                                                    .activityCode);
                                            Modular.to.pop();
                                          });
                                    });
                                  },
                                );
                              } else {
                                if (widget
                                        .enrolledActivity.takenSlots >=
                                    widget
                                        .enrolledActivity.totalSlots) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const CustomAlertDialogWidget(
                                        title:
                                            'Parece que o número de vagas da atividade se esgotou :(',
                                      );
                                    },
                                  );
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Observer(builder: (context) {
                                        return ActionConfirmationDialogWidget(
                                            isLoading: controller.isLoading,
                                            title:
                                                'Tem certeza que deseja se inscrever?',
                                            content:
                                                'Se atente aos seus horários e atividades que você já se inscreveu!',
                                            onPressed: () {
                                              controller.subscribeUserActivity(
                                                  widget.enrolledActivity
                                                      .activityCode);
                                              Modular.to.pop();
                                            });
                                      });
                                    },
                                  );
                                }
                              }
                            })); */
              //}),
              const SizedBox(
                height: 16,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Descrição',
                    style: AppTextStyles.buttonBold.copyWith(
                        fontSize: MediaQuery.of(context).size.width < 800
                            ? 20
                            : MediaQuery.of(context).size.width < 1000
                                ? 24
                                : 28,
                        color: AppColors.brandingBlue)),
              ),
              const SizedBox(
                height: 8,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(widget.enrolledActivity.description,
                    textAlign: TextAlign.justify,
                    style: AppTextStyles.body.copyWith(
                        fontSize: MediaQuery.of(context).size.width < 800
                            ? 16
                            : MediaQuery.of(context).size.width < 1000
                                ? 18
                                : 22,
                        color: Colors.black)),
              ),
              const SizedBox(
                height: 16,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.enrolledActivity.speakers.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (widget.enrolledActivity.speakers[index].linkPhoto !=
                            null)
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.1,
                            height: MediaQuery.of(context).size.width * 0.1,
                            child: CircleAvatar(
                              radius: 102.0,
                              backgroundImage: CachedNetworkImageProvider(widget
                                  .enrolledActivity
                                  .speakers[index]
                                  .linkPhoto!), // for Network image
                            ),
                          ),
                        Flexible(
                          child: Column(
                            children: [
                              if (widget.enrolledActivity.speakers[index]
                                          .name !=
                                      null &&
                                  widget.enrolledActivity.speakers[index]
                                          .name !=
                                      '')
                                Text(
                                  widget.enrolledActivity.speakers[index].name!,
                                  textAlign: TextAlign.justify,
                                  style: AppTextStyles.buttonBold.copyWith(
                                      fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width <
                                              800
                                          ? 18
                                          : MediaQuery.of(context).size.width <
                                                  1000
                                              ? 22
                                              : 28,
                                      color: Colors.black),
                                ),
                              if (widget.enrolledActivity.speakers[index]
                                          .company !=
                                      null &&
                                  widget.enrolledActivity.speakers[index]
                                          .company !=
                                      '')
                                Text(
                                  'Empresa: ${widget.enrolledActivity.speakers[index].company}',
                                  textAlign: TextAlign.justify,
                                  style: AppTextStyles.buttonBold.copyWith(
                                      fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width <
                                              800
                                          ? 12
                                          : MediaQuery.of(context).size.width <
                                                  1000
                                              ? 14
                                              : 20,
                                      color: AppColors.brandingBlue),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    if (widget.enrolledActivity.speakers[index].bio != null &&
                        widget.enrolledActivity.speakers[index].bio != '')
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                            widget.enrolledActivity.speakers[index].bio!,
                            textAlign: TextAlign.justify,
                            style: AppTextStyles.body.copyWith(
                                fontSize: MediaQuery.of(context).size.width <
                                        800
                                    ? 16
                                    : MediaQuery.of(context).size.width < 1000
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
      ),
    );
  }
}
