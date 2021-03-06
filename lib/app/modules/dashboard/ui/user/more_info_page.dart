import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/more_info_controller.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../shared/themes/app_text_styles.dart';
import '../../../../shared/utils/utils.dart';
import '../../../../shared/widgets/dialogs/action_confirmation_dialog_widget.dart';
import '../../../../shared/widgets/dialogs/custom_alert_dialog_widget.dart';
import '../../domain/infra/activity_enum.dart';
import 'widgets/register_button_widget.dart';

class MoreInfoPage extends StatefulWidget {
  const MoreInfoPage({Key? key}) : super(key: key);

  @override
  State<MoreInfoPage> createState() => _MoreInfoPageState();
}

class _MoreInfoPageState
    extends ModularState<MoreInfoPage, MoreInfoController> {
  @override
  Widget build(BuildContext context) {
    var timeString = controller.activity.date == null
        ? ''
        : DateFormat('HH:mm').format(controller.activity.date!);
    var weekday = controller.activity.date == null
        ? ''
        : DateFormat('EEEE')
            .format(controller.activity.date!)
            .split('-')
            .first
            .capitalize();
    var finalTime =
        controller.activity.duration == null || controller.activity.date == null
            ? ''
            : Utils.getActivityFinalTime(
                controller.activity.date!, controller.activity.duration!);
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
                    controller.activity.type!.name,
                    textAlign: TextAlign.justify,
                    style: AppTextStyles.buttonBold.copyWith(
                      fontSize: MediaQuery.of(context).size.width < 800
                          ? 18
                          : MediaQuery.of(context).size.width < 1000
                              ? 22
                              : 28,
                      color: AppColors.brandingPurple,
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
                  '${controller.activity.activityCode} - ${controller.activity.title}',
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
              Observer(builder: (_) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          controller.activity.date == null
                              ? ''
                              : DateFormat('dd/MM')
                                  .format(controller.activity.date!),
                          style: AppTextStyles.buttonBold.copyWith(
                              fontSize: MediaQuery.of(context).size.width < 800
                                  ? 10
                                  : MediaQuery.of(context).size.width < 1000
                                      ? 14
                                      : 18,
                              color: AppColors.brandingPurple),
                        ),
                        Text(
                          weekday,
                          style: AppTextStyles.buttonBold.copyWith(
                              fontSize: MediaQuery.of(context).size.width < 800
                                  ? 14
                                  : MediaQuery.of(context).size.width < 1000
                                      ? 20
                                      : 24,
                              color: AppColors.brandingPurple),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Hor??rio',
                          style: AppTextStyles.buttonBold.copyWith(
                              fontSize: MediaQuery.of(context).size.width < 800
                                  ? 10
                                  : MediaQuery.of(context).size.width < 1000
                                      ? 14
                                      : 18,
                              color: AppColors.brandingPurple),
                        ),
                        Text(
                          '$timeString - $finalTime',
                          style: AppTextStyles.buttonBold.copyWith(
                              fontSize: MediaQuery.of(context).size.width < 800
                                  ? 14
                                  : MediaQuery.of(context).size.width < 1000
                                      ? 20
                                      : 24,
                              color: AppColors.brandingPurple),
                        ),
                      ],
                    ),
                    if (controller.activity.location != null)
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
                                color: AppColors.brandingPurple),
                          ),
                          Text(
                            controller.activity.location!,
                            style: AppTextStyles.buttonBold.copyWith(
                                fontSize: MediaQuery.of(context).size.width <
                                        800
                                    ? 14
                                    : MediaQuery.of(context).size.width < 1000
                                        ? 20
                                        : 24,
                                color: AppColors.brandingPurple),
                          ),
                        ],
                      ),
                    if (controller.activity.link != null &&
                        controller.isRegistered)
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
                                      color: AppColors.brandingPurple,
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
                                    Uri.parse(controller.activity.link!),
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
                                          color: AppColors.brandingPurple)),
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
                return !controller.activity.acceptSubscription &&
                        !controller.isRegistered
                    ? Text(
                        'Inscri????o para a atividade indispon??vel!',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.titleH1.copyWith(
                            color: AppColors.brandingPurple,
                            fontSize: MediaQuery.of(context).size.width < 800
                                ? 22
                                : MediaQuery.of(context).size.width < 1000
                                    ? 26
                                    : 30),
                      )
                    : Center(
                        child: RegisterButtonWidget(
                            isRegistered: controller.isRegistered,
                            isLoading: controller.isLoading,
                            onPressed: () {
                              if (!controller.activity.acceptSubscription &&
                                  controller.isRegistered) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Observer(builder: (context) {
                                      return ActionConfirmationDialogWidget(
                                          isLoading: controller.isLoading,
                                          title:
                                              'Tem certeza que deseja se desinscrever?',
                                          content:
                                              'Cuidado: inscri????es desta atividade encerradas, voc?? n??o conseguir?? se inscrever novamente!',
                                          onPressed: () {
                                            controller.unsubscribeActivity();
                                            Modular.to.pop();
                                          });
                                    });
                                  },
                                );
                              } else {
                                if (controller.isRegistered) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Observer(builder: (context) {
                                        return ActionConfirmationDialogWidget(
                                            isLoading: controller.isLoading,
                                            title:
                                                'Tem certeza que deseja se desinscrever?',
                                            content:
                                                'Voc?? perder?? sua vaga na atividade ao continuar!',
                                            onPressed: () {
                                              controller.unsubscribeActivity();
                                              Modular.to.pop();
                                            });
                                      });
                                    },
                                  );
                                } else if (controller.activity.enrolledUsers! >=
                                    controller.activity.totalParticipants!) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const CustomAlertDialogWidget(
                                        title:
                                            'Parece que o n??mero de vagas da atividade se esgotou :(',
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
                                                'Se atente aos seus hor??rios e atividades que voc?? j?? se inscreveu!',
                                            onPressed: () {
                                              if (controller
                                                  .checkIsOkForSubscribe()) {
                                                controller.subscribeActivity();
                                                Modular.to.pop();
                                              } else {
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return const CustomAlertDialogWidget(
                                                      title:
                                                          'Parece que voc?? j?? se inscreveu em uma atividade no mesmo hor??rio.',
                                                    );
                                                  },
                                                );
                                              }
                                            });
                                      });
                                    },
                                  );
                                }
                              }
                            }));
              }),
              const SizedBox(
                height: 16,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Descri????o',
                    style: AppTextStyles.buttonBold.copyWith(
                        fontSize: MediaQuery.of(context).size.width < 800
                            ? 20
                            : MediaQuery.of(context).size.width < 1000
                                ? 24
                                : 28,
                        color: AppColors.brandingPurple)),
              ),
              const SizedBox(
                height: 8,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(controller.activity.description,
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
                itemCount: controller.activity.speakers!.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (controller.activity.speakers![index].linkPhoto !=
                            null)
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.1,
                            height: MediaQuery.of(context).size.width * 0.1,
                            child: CircleAvatar(
                              radius: 102.0,
                              backgroundImage: CachedNetworkImageProvider(
                                  controller.activity.speakers![index]
                                      .linkPhoto!), // for Network image
                            ),
                          ),
                        Flexible(
                          child: Column(
                            children: [
                              if (controller.activity.speakers![index].name !=
                                      null &&
                                  controller.activity.speakers![index].name !=
                                      '')
                                Text(
                                  controller.activity.speakers![index].name!,
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
                              if (controller
                                          .activity.speakers![index].company !=
                                      null &&
                                  controller
                                          .activity.speakers![index].company !=
                                      '')
                                Text(
                                  'Empresa: ${controller.activity.speakers![index].company}',
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
                                      color: AppColors.brandingPurple),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    if (controller.activity.speakers![index].bio != null &&
                        controller.activity.speakers![index].bio != '')
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(controller.activity.speakers![index].bio!,
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
