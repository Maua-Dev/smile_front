import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/more_info_responsible_activities_controller.dart';

import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';
import 'package:smile_front/app/shared/themes/breakpoint.dart';

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
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text('ECV707 - Engenharia de Produção',
                    style: AppTextStyles.bold.copyWith(
                        fontSize:
                            MediaQuery.of(context).size.width < breakpointTablet
                                ? 20
                                : 50)),
              ),
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
                          Text('Dia',
                              style: AppTextStyles.bold.copyWith(
                                  color: AppColors.white,
                                  fontSize: MediaQuery.of(context).size.width <
                                          breakpointTablet
                                      ? 12
                                      : 20)),
                          Text('20/04',
                              style: AppTextStyles.bold.copyWith(
                                  color: AppColors.white,
                                  fontSize: MediaQuery.of(context).size.width <
                                          breakpointTablet
                                      ? 20
                                      : 40))
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
                          Text('Horário',
                              style: AppTextStyles.bold.copyWith(
                                  color: AppColors.white,
                                  fontSize: MediaQuery.of(context).size.width <
                                          breakpointTablet
                                      ? 12
                                      : 20)),
                          Text('14:00 - 14:50',
                              style: AppTextStyles.bold.copyWith(
                                  color: AppColors.white,
                                  fontSize: MediaQuery.of(context).size.width <
                                          breakpointTablet
                                      ? 20
                                      : 40))
                        ]),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width < breakpointTablet
                        ? 78
                        : 175,
                    height: MediaQuery.of(context).size.width < breakpointTablet
                        ? 49
                        : 74,
                    decoration: BoxDecoration(
                        color: AppColors.brandingOrange,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Local',
                              style: AppTextStyles.bold.copyWith(
                                  color: AppColors.white,
                                  fontSize: MediaQuery.of(context).size.width <
                                          breakpointTablet
                                      ? 12
                                      : 20)),
                          Text('H244',
                              style: AppTextStyles.bold.copyWith(
                                  color: AppColors.white,
                                  fontSize: MediaQuery.of(context).size.width <
                                          breakpointTablet
                                      ? 20
                                      : 40))
                        ]),
                  ),
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
                              controller.toggleIconSelection();
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
                                        color: controller.isIconSelected
                                            ? AppColors.brandingOrange
                                            : AppColors.white),
                                    color: controller.isIconSelected
                                        ? AppColors.white
                                        : AppColors.brandingOrange,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width <
                                                    breakpointMobile
                                                ? 30
                                                : 50,
                                      ),
                                      Text('Lista de inscritos',
                                          style: AppTextStyles.bold.copyWith(
                                              color: controller.isIconSelected
                                                  ? AppColors.brandingOrange
                                                  : AppColors.white,
                                              fontSize: 30)),
                                      Icon(
                                        controller.isIconSelected
                                            ? Icons.keyboard_arrow_up
                                            : Icons.keyboard_arrow_down,
                                        size:
                                            MediaQuery.of(context).size.width <
                                                    breakpointMobile
                                                ? 30
                                                : 50,
                                        color: controller.isIconSelected
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
                                visible: controller.isVisible,
                                child: Container(
                                  width: MediaQuery.of(context).size.width <
                                          breakpointTablet
                                      ? 400
                                      : 570,
                                  height: 485,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          width: 4,
                                          color: AppColors.brandingOrange)),
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          SizedBox(
                                            width: 180,
                                            child: Row(
                                              children: [
                                                Text("Falta",
                                                    style: AppTextStyles.bold
                                                        .copyWith(
                                                            fontSize: 20,
                                                            color:
                                                                Colors.black)),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                Text("Presente",
                                                    style: AppTextStyles.bold
                                                        .copyWith(
                                                            fontSize: 20,
                                                            color:
                                                                Colors.black)),
                                              ],
                                            ),
                                          ),
                                          Text("Nomes",
                                              style: AppTextStyles.bold
                                                  .copyWith(
                                                      fontSize: 20,
                                                      color: Colors.black))
                                        ],
                                      ),
                                      SizedBox(
                                        width: 476,
                                        child: Divider(
                                          thickness: 4,
                                          color: AppColors.brandingOrange,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 570,
                                        height: 426,
                                        child: ListView(
                                          children: [
                                            Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Observer(
                                                      builder: (_) {
                                                        return Switch(
                                                          value: controller
                                                              .isSwitched,
                                                          onChanged: (value) {
                                                            controller
                                                                .toggleSwitch();
                                                          },
                                                          activeColor:
                                                              Colors.green,
                                                          inactiveThumbColor:
                                                              Colors.red,
                                                          inactiveTrackColor:
                                                              Colors
                                                                  .red
                                                                  .withOpacity(
                                                                      0.5),
                                                          activeTrackColor:
                                                              Colors.green
                                                                  .withOpacity(
                                                                      0.5),
                                                        );
                                                      },
                                                    ),
                                                    Text(
                                                      "Vitor Guirão Soller",
                                                      style: AppTextStyles.bold
                                                          .copyWith(
                                                              fontSize: 30,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 438,
                                                  child: Divider(
                                                    thickness: 2,
                                                    color: AppColors
                                                        .brandingOrange,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Observer(
                                                      builder: (_) {
                                                        return Switch(
                                                          value: controller
                                                              .isSwitched,
                                                          onChanged: (value) {
                                                            controller
                                                                .toggleSwitch();
                                                          },
                                                          activeColor:
                                                              Colors.green,
                                                          inactiveThumbColor:
                                                              Colors.red,
                                                          inactiveTrackColor:
                                                              Colors
                                                                  .red
                                                                  .withOpacity(
                                                                      0.5),
                                                          activeTrackColor:
                                                              Colors.green
                                                                  .withOpacity(
                                                                      0.5),
                                                        );
                                                      },
                                                    ),
                                                    Text(
                                                      "Vitor Guirão Soller",
                                                      style: AppTextStyles.bold
                                                          .copyWith(
                                                              fontSize: 30,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 438,
                                                  child: Divider(
                                                    thickness: 2,
                                                    color: AppColors
                                                        .brandingOrange,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Observer(
                                                      builder: (_) {
                                                        return Switch(
                                                          value: controller
                                                              .isSwitched,
                                                          onChanged: (value) {
                                                            controller
                                                                .toggleSwitch();
                                                          },
                                                          activeColor:
                                                              Colors.green,
                                                          inactiveThumbColor:
                                                              Colors.red,
                                                          inactiveTrackColor:
                                                              Colors
                                                                  .red
                                                                  .withOpacity(
                                                                      0.5),
                                                          activeTrackColor:
                                                              Colors.green
                                                                  .withOpacity(
                                                                      0.5),
                                                        );
                                                      },
                                                    ),
                                                    Text(
                                                      "Vitor Guirão Soller",
                                                      style: AppTextStyles.bold
                                                          .copyWith(
                                                              fontSize: 30,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 438,
                                                  child: Divider(
                                                    thickness: 2,
                                                    color: AppColors
                                                        .brandingOrange,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Observer(
                                                      builder: (_) {
                                                        return Switch(
                                                          value: controller
                                                              .isSwitched,
                                                          onChanged: (value) {
                                                            controller
                                                                .toggleSwitch();
                                                          },
                                                          activeColor:
                                                              Colors.green,
                                                          inactiveThumbColor:
                                                              Colors.red,
                                                          inactiveTrackColor:
                                                              Colors
                                                                  .red
                                                                  .withOpacity(
                                                                      0.5),
                                                          activeTrackColor:
                                                              Colors.green
                                                                  .withOpacity(
                                                                      0.5),
                                                        );
                                                      },
                                                    ),
                                                    Text(
                                                      "Vitor Guirão Soller",
                                                      style: AppTextStyles.bold
                                                          .copyWith(
                                                              fontSize: 30,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 438,
                                                  child: Divider(
                                                    thickness: 2,
                                                    color: AppColors
                                                        .brandingOrange,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Observer(
                                                      builder: (_) {
                                                        return Switch(
                                                          value: controller
                                                              .isSwitched,
                                                          onChanged: (value) {
                                                            controller
                                                                .toggleSwitch();
                                                          },
                                                          activeColor:
                                                              Colors.green,
                                                          inactiveThumbColor:
                                                              Colors.red,
                                                          inactiveTrackColor:
                                                              Colors
                                                                  .red
                                                                  .withOpacity(
                                                                      0.5),
                                                          activeTrackColor:
                                                              Colors.green
                                                                  .withOpacity(
                                                                      0.5),
                                                        );
                                                      },
                                                    ),
                                                    Text(
                                                      "Vitor Guirão Soller",
                                                      style: AppTextStyles.bold
                                                          .copyWith(
                                                              fontSize: 30,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 438,
                                                  child: Divider(
                                                    thickness: 2,
                                                    color: AppColors
                                                        .brandingOrange,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Observer(
                                                      builder: (_) {
                                                        return Switch(
                                                          value: controller
                                                              .isSwitched,
                                                          onChanged: (value) {
                                                            controller
                                                                .toggleSwitch();
                                                          },
                                                          activeColor:
                                                              Colors.green,
                                                          inactiveThumbColor:
                                                              Colors.red,
                                                          inactiveTrackColor:
                                                              Colors
                                                                  .red
                                                                  .withOpacity(
                                                                      0.5),
                                                          activeTrackColor:
                                                              Colors.green
                                                                  .withOpacity(
                                                                      0.5),
                                                        );
                                                      },
                                                    ),
                                                    Text(
                                                      "Vitor Guirão Soller",
                                                      style: AppTextStyles.bold
                                                          .copyWith(
                                                              fontSize: 30,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 438,
                                                  child: Divider(
                                                    thickness: 2,
                                                    color: AppColors
                                                        .brandingOrange,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Observer(
                                                      builder: (_) {
                                                        return Switch(
                                                          value: controller
                                                              .isSwitched,
                                                          onChanged: (value) {
                                                            controller
                                                                .toggleSwitch();
                                                          },
                                                          activeColor:
                                                              Colors.green,
                                                          inactiveThumbColor:
                                                              Colors.red,
                                                          inactiveTrackColor:
                                                              Colors
                                                                  .red
                                                                  .withOpacity(
                                                                      0.5),
                                                          activeTrackColor:
                                                              Colors.green
                                                                  .withOpacity(
                                                                      0.5),
                                                        );
                                                      },
                                                    ),
                                                    Text(
                                                      "Vitor Guirão Soller",
                                                      style: AppTextStyles.bold
                                                          .copyWith(
                                                              fontSize: 30,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 438,
                                                  child: Divider(
                                                    thickness: 2,
                                                    color: AppColors
                                                        .brandingOrange,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Observer(
                                                      builder: (_) {
                                                        return Switch(
                                                          value: controller
                                                              .isSwitched,
                                                          onChanged: (value) {
                                                            controller
                                                                .toggleSwitch();
                                                          },
                                                          activeColor:
                                                              Colors.green,
                                                          inactiveThumbColor:
                                                              Colors.red,
                                                          inactiveTrackColor:
                                                              Colors
                                                                  .red
                                                                  .withOpacity(
                                                                      0.5),
                                                          activeTrackColor:
                                                              Colors.green
                                                                  .withOpacity(
                                                                      0.5),
                                                        );
                                                      },
                                                    ),
                                                    Text(
                                                      "Vitor Guirão Soller",
                                                      style: AppTextStyles.bold
                                                          .copyWith(
                                                              fontSize: 30,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 438,
                                                  child: Divider(
                                                    thickness: 2,
                                                    color: AppColors
                                                        .brandingOrange,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Observer(
                                                      builder: (_) {
                                                        return Switch(
                                                          value: controller
                                                              .isSwitched,
                                                          onChanged: (value) {
                                                            controller
                                                                .toggleSwitch();
                                                          },
                                                          activeColor:
                                                              Colors.green,
                                                          inactiveThumbColor:
                                                              Colors.red,
                                                          inactiveTrackColor:
                                                              Colors
                                                                  .red
                                                                  .withOpacity(
                                                                      0.5),
                                                          activeTrackColor:
                                                              Colors.green
                                                                  .withOpacity(
                                                                      0.5),
                                                        );
                                                      },
                                                    ),
                                                    Text(
                                                      "Vitor Guirão Soller",
                                                      style: AppTextStyles.bold
                                                          .copyWith(
                                                              fontSize: 30,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 438,
                                                  child: Divider(
                                                    thickness: 2,
                                                    color: AppColors
                                                        .brandingOrange,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
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
                          height: MediaQuery.of(context).size.height / 1.5,
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
                  SizedBox(
                    width: 570,
                    child: Column(
                      children: [
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              controller.showSubscribedList();
                              controller.toggleIconSelection();
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
                                        color: controller.isIconSelected
                                            ? AppColors.brandingOrange
                                            : AppColors.white),
                                    color: controller.isIconSelected
                                        ? AppColors.white
                                        : AppColors.brandingOrange,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width <
                                                    breakpointMobile
                                                ? 30
                                                : 50,
                                      ),
                                      Text('Gerar Token',
                                          style: AppTextStyles.bold.copyWith(
                                              color: controller.isIconSelected
                                                  ? AppColors.brandingOrange
                                                  : AppColors.white,
                                              fontSize: 30)),
                                      Icon(
                                        controller.isIconSelected
                                            ? Icons.keyboard_arrow_up
                                            : Icons.keyboard_arrow_down,
                                        size:
                                            MediaQuery.of(context).size.width <
                                                    breakpointMobile
                                                ? 30
                                                : 50,
                                        color: controller.isIconSelected
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
                                visible: controller.isVisible,
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width <
                                          breakpointTablet
                                      ? 400
                                      : 570,
                                  height: 485,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Código de Validação",
                                          style: AppTextStyles.bold.copyWith(
                                            fontSize: 30,
                                            color: Colors.black,
                                          )),
                                      Container(
                                        width: 498,
                                        height: 98,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color:
                                                    AppColors.brandingOrange)),
                                      )
                                    ],
                                  ),
                                ))),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
