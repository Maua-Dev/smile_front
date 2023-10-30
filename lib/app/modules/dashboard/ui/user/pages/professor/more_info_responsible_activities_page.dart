import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/more_info_responsible_activities_controller.dart';
import 'package:smile_front/app/modules/dashboard/ui/user/widgets/responsible_activities_widgets/subscriber_list_widget.dart';
import 'package:smile_front/app/shared/domain/enum/delivery_enum.dart';

import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';
import 'package:smile_front/app/shared/themes/breakpoint.dart';
import 'package:smile_front/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/responsible_activities_widgets/confirmation_code_generate_widget.dart';

class MoreInfoResponsibleActivitiesPage extends StatefulWidget {
  const MoreInfoResponsibleActivitiesPage({super.key});

  @override
  State<MoreInfoResponsibleActivitiesPage> createState() =>
      _MoreInfoResponsibleActivitiesPageState();
}

class _MoreInfoResponsibleActivitiesPageState extends ModularState<
    MoreInfoResponsibleActivitiesPage,
    MoreInfoResponsibleActivitiesController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Observer(builder: (_) {
              if (controller.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Align(
                  alignment: Alignment.center,
                  child: Text(
                      '${controller.professorActivityWithEnrollments.activityCode} - ${controller.professorActivityWithEnrollments.title}',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.headline1.copyWith(
                          color: AppColors.brandingOrange,
                          fontSize: MediaQuery.of(context).size.width <
                                  breakpointTablet
                              ? 20
                              : 50)),
                );
              }
            }),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width < breakpointTablet
                      ? 78
                      : 183,
                  height: MediaQuery.of(context).size.width < breakpointTablet
                      ? 49
                      : 74,
                  decoration: BoxDecoration(
                    color: AppColors.brandingOrange,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(S.of(context).dateTitle,
                            style: AppTextStyles.headline1.copyWith(
                                color: AppColors.white,
                                fontSize: MediaQuery.of(context).size.width <
                                        breakpointTablet
                                    ? 12
                                    : 20)),
                        Observer(builder: (_) {
                          return Observer(builder: (_) {
                            if (controller.isLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return Text(
                                  DateFormat('dd/MM').format(controller
                                      .professorActivityWithEnrollments
                                      .startDate!),
                                  style: AppTextStyles.headline1.copyWith(
                                      color: AppColors.white,
                                      fontSize:
                                          MediaQuery.of(context).size.width <
                                                  breakpointTablet
                                              ? 20
                                              : 40));
                            }
                          });
                        })
                      ]),
                ),
                Container(
                  width: MediaQuery.of(context).size.width < breakpointTablet
                      ? 138
                      : 341,
                  height: MediaQuery.of(context).size.width < breakpointTablet
                      ? 49
                      : 74,
                  decoration: BoxDecoration(
                      color: AppColors.brandingOrange,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(S.of(context).scheduleTitle,
                            style: AppTextStyles.headline1.copyWith(
                                color: AppColors.white,
                                fontSize: MediaQuery.of(context).size.width <
                                        breakpointTablet
                                    ? 12
                                    : 20)),
                        Observer(builder: (_) {
                          if (controller.isLoading) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else {
                            return Text(
                                '${controller.initialTime} - ${controller.finalTime}',
                                style: AppTextStyles.headline1.copyWith(
                                    color: AppColors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.width <
                                                breakpointTablet
                                            ? 20
                                            : 40));
                          }
                        })
                      ]),
                ),
                Observer(builder: (_) {
                  return Container(
                    width: MediaQuery.of(context).size.width < breakpointTablet
                        ? 78
                        : 175,
                    height: controller.professorActivityWithEnrollments
                                .deliveryEnum ==
                            DeliveryEnum.hybrid
                        ? MediaQuery.of(context).size.width < breakpointTablet
                            ? 98
                            : 148
                        : MediaQuery.of(context).size.width < breakpointTablet
                            ? 49
                            : 74,
                    decoration: BoxDecoration(
                        color: AppColors.brandingOrange,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(S.of(context).localTitle,
                              style: AppTextStyles.headline1.copyWith(
                                  color: AppColors.white,
                                  fontSize: MediaQuery.of(context).size.width <
                                          breakpointTablet
                                      ? 12
                                      : 20)),
                          Observer(builder: (_) {
                            if (controller.isLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return controller.professorActivityWithEnrollments
                                          .deliveryEnum ==
                                      DeliveryEnum.online
                                  ? MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: GestureDetector(
                                        onTap: () => launchUrl(
                                          Uri.parse(controller
                                              .professorActivityWithEnrollments
                                              .link!),
                                          mode: LaunchMode.externalApplication,
                                        ),
                                        child: Text('Link',
                                            style: AppTextStyles.headline1
                                                .copyWith(
                                                    color: AppColors.white,
                                                    decoration: TextDecoration
                                                        .underline,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                    .size
                                                                    .width <
                                                                breakpointTablet
                                                            ? 20
                                                            : 40)),
                                      ),
                                    )
                                  : controller.professorActivityWithEnrollments.deliveryEnum ==
                                          DeliveryEnum.hybrid
                                      ? Column(
                                          children: [
                                            MouseRegion(
                                              cursor: SystemMouseCursors.click,
                                              child: GestureDetector(
                                                onTap: () => launchUrl(
                                                  Uri.parse(controller
                                                      .professorActivityWithEnrollments
                                                      .link!),
                                                  mode: LaunchMode
                                                      .externalApplication,
                                                ),
                                                child: Text('Link',
                                                    style: AppTextStyles.headline1.copyWith(
                                                        color: AppColors.white,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width <
                                                                breakpointTablet
                                                            ? 20
                                                            : 40)),
                                              ),
                                            ),
                                            Text(
                                                controller
                                                    .professorActivityWithEnrollments
                                                    .place!,
                                                style: AppTextStyles.headline1
                                                    .copyWith(
                                                        color: AppColors.white,
                                                        fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width <
                                                                breakpointTablet
                                                            ? 20
                                                            : 40))
                                          ],
                                        )
                                      : controller.professorActivityWithEnrollments.place !=
                                              null
                                          ? Text(controller.professorActivityWithEnrollments.place!,
                                              style: AppTextStyles.headline1.copyWith(
                                                  color: AppColors.white,
                                                  fontSize: MediaQuery.of(context).size.width <
                                                          breakpointTablet
                                                      ? 20
                                                      : 40))
                                          : Text("Indefinido",
                                              style: AppTextStyles.headline1.copyWith(
                                                  color: AppColors.white,
                                                  fontSize: MediaQuery.of(context).size.width <
                                                          breakpointTablet
                                                      ? 20
                                                      : 40));
                            }
                          })
                        ]),
                  );
                })
              ],
            ),
            const SizedBox(height: 60),
            Wrap(
              runSpacing: 40,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: [
                SizedBox(
                  width: 570,
                  child: Column(
                    children: [
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            controller.showSubscribedList();
                          },
                          child: Observer(builder: (_) {
                            return Container(
                              width: MediaQuery.of(context).size.width <
                                      breakpointTablet
                                  ? 339
                                  : 484,
                              height: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: controller.isSubscribedListVisible
                                          ? AppColors.brandingOrange
                                          : AppColors.white),
                                  color: controller.isSubscribedListVisible
                                      ? AppColors.white
                                      : AppColors.brandingOrange,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width <
                                              breakpointMobile
                                          ? 30
                                          : 50,
                                    ),
                                    Text(S.of(context).subscriberListTitle,
                                        style: AppTextStyles.headline1.copyWith(
                                            color: controller
                                                    .isSubscribedListVisible
                                                ? AppColors.brandingOrange
                                                : AppColors.white,
                                            fontSize: 30)),
                                    Icon(
                                      controller.isSubscribedListVisible
                                          ? Icons.keyboard_arrow_up
                                          : Icons.keyboard_arrow_down,
                                      size: MediaQuery.of(context).size.width <
                                              breakpointMobile
                                          ? 30
                                          : 50,
                                      color: controller.isSubscribedListVisible
                                          ? AppColors.brandingOrange
                                          : AppColors.white,
                                    )
                                  ]),
                            );
                          }),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Observer(
                          builder: (_) => Visibility(
                              visible: controller.isSubscribedListVisible,
                              child: SubscriberListWidget(
                                sendEmailToAll: controller.sendEmailToAll,
                                emailLogDevCommunity:
                                    controller.emailLogDevCommunity,
                                isButtonLoading: controller.isButtonLoading,
                                onChangedIsSwitched: (bool value, int index) {
                                  controller.toogleListSwitch(value, index);
                                },
                                professorList: controller.professorList,
                                enrollmentsList:
                                    controller.professorActivityWithEnrollments,
                                isSwitched: controller.isSwitched,
                                toggleSwitch: controller.toggleSwitch,
                                listViewItemCount: controller
                                    .professorActivityWithEnrollments
                                    .enrollments!
                                    .length,
                                isLoading: controller.isLoading,
                              ))),
                    ],
                  ),
                ),
                if (MediaQuery.of(context).size.width > 1350)
                  const SizedBox(
                    width: 40,
                  ),
                if (MediaQuery.of(context).size.width > 1350)
                  Column(
                    children: [
                      const SizedBox(height: 24),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 2,
                        child: VerticalDivider(
                          color: AppColors.brandingOrange,
                          thickness: 3,
                        ),
                      ),
                    ],
                  ),
                if (MediaQuery.of(context).size.width > 1350)
                  const SizedBox(
                    width: 40,
                  ),
                Observer(builder: (_) {
                  return SizedBox(
                    width: 570,
                    child: Column(
                      children: [
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              if (controller.isTokenVisible == false) {
                                controller.generateNewAtendanceCode();
                              } else {
                                controller.deleteOldAttendanceCode();
                              }
                              controller.showToken();
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width <
                                      breakpointTablet
                                  ? 339
                                  : 484,
                              height: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: controller.isTokenVisible
                                          ? AppColors.brandingOrange
                                          : AppColors.white),
                                  color: controller.isTokenVisible
                                      ? AppColors.white
                                      : AppColors.brandingOrange,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width <
                                              breakpointMobile
                                          ? 30
                                          : 50,
                                    ),
                                    Text(
                                        controller.isTokenVisible
                                            ? 'Apagar Token'
                                            : 'Gerar Token',
                                        style: AppTextStyles.headline1.copyWith(
                                            color: controller.isTokenVisible
                                                ? AppColors.brandingOrange
                                                : AppColors.white,
                                            fontSize: 30)),
                                    Icon(
                                      controller.isTokenVisible
                                          ? Icons.keyboard_arrow_up
                                          : Icons.keyboard_arrow_down,
                                      size: MediaQuery.of(context).size.width <
                                              breakpointMobile
                                          ? 30
                                          : 50,
                                      color: controller.isTokenVisible
                                          ? AppColors.brandingOrange
                                          : AppColors.white,
                                    )
                                  ]),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        controller.isTokenVisible && controller.token != null
                            ? TokenGenerateWidget(
                                confirmationCode: controller.token!)
                            : const SizedBox.shrink(),
                      ],
                    ),
                  );
                }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
