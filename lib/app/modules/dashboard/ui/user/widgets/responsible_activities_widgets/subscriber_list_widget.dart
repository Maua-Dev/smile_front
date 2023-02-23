// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';

import '../../../../../../../generated/l10n.dart';
import '../../../../../../shared/themes/breakpoint.dart';

class SubscriberListWidget extends StatelessWidget {
  final bool isSwitched;
  final Function()? toggleSwitch;
  const SubscriberListWidget({
    Key? key,
    required this.isSwitched,
    required this.toggleSwitch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width < breakpointTablet ? 400 : 570,
      height: MediaQuery.of(context).size.width < breakpointTablet ? 300 : 430,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 4, color: AppColors.brandingOrange)),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 204,
                child: Row(
                  children: [
                    SizedBox(
                      width:
                          MediaQuery.of(context).size.width < breakpointTablet
                              ? 5
                              : 58,
                    ),
                    Text(S.of(context).absenceTitle,
                        style: AppTextStyles.bold
                            .copyWith(fontSize: 20, color: Colors.black)),
                    SizedBox(
                      width:
                          MediaQuery.of(context).size.width < breakpointTablet
                              ? 10
                              : 20,
                    ),
                    Text(S.of(context).presenceTitle,
                        style: AppTextStyles.bold
                            .copyWith(fontSize: 20, color: Colors.black)),
                  ],
                ),
              ),
              Row(
                children: [
                  Text(S.of(context).namesTitle,
                      style: AppTextStyles.bold
                          .copyWith(fontSize: 20, color: Colors.black)),
                  SizedBox(
                    width: MediaQuery.of(context).size.width < breakpointTablet
                        ? 110
                        : 180,
                  )
                ],
              )
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
            width: MediaQuery.of(context).size.width < breakpointTablet
                ? 400
                : 570,
            height: MediaQuery.of(context).size.width < breakpointTablet
                ? 242
                : 360,
            child: ListView(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Observer(
                          builder: (_) {
                            return Switch(
                              value: isSwitched,
                              onChanged: (value) {
                                toggleSwitch!();
                              },
                              activeColor: Colors.green,
                              inactiveThumbColor: Colors.red,
                              inactiveTrackColor: Colors.red.withOpacity(0.5),
                              activeTrackColor: Colors.green.withOpacity(0.5),
                            );
                          },
                        ),
                        Text(
                          "Vitor Guirão Soller",
                          style: AppTextStyles.bold
                              .copyWith(fontSize: 30, color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 438,
                      child: Divider(
                        thickness: 2,
                        color: AppColors.brandingOrange,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Observer(
                          builder: (_) {
                            return Switch(
                              value: isSwitched,
                              onChanged: (value) {
                                toggleSwitch!();
                              },
                              activeColor: Colors.green,
                              inactiveThumbColor: Colors.red,
                              inactiveTrackColor: Colors.red.withOpacity(0.5),
                              activeTrackColor: Colors.green.withOpacity(0.5),
                            );
                          },
                        ),
                        Text(
                          "Vitor Guirão Soller",
                          style: AppTextStyles.bold
                              .copyWith(fontSize: 30, color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 438,
                      child: Divider(
                        thickness: 2,
                        color: AppColors.brandingOrange,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Observer(
                          builder: (_) {
                            return Switch(
                              value: isSwitched,
                              onChanged: (value) {
                                toggleSwitch!();
                              },
                              activeColor: Colors.green,
                              inactiveThumbColor: Colors.red,
                              inactiveTrackColor: Colors.red.withOpacity(0.5),
                              activeTrackColor: Colors.green.withOpacity(0.5),
                            );
                          },
                        ),
                        Text(
                          "Vitor Guirão Soller",
                          style: AppTextStyles.bold
                              .copyWith(fontSize: 30, color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 438,
                      child: Divider(
                        thickness: 2,
                        color: AppColors.brandingOrange,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Observer(
                          builder: (_) {
                            return Switch(
                              value: isSwitched,
                              onChanged: (value) {
                                toggleSwitch!();
                              },
                              activeColor: Colors.green,
                              inactiveThumbColor: Colors.red,
                              inactiveTrackColor: Colors.red.withOpacity(0.5),
                              activeTrackColor: Colors.green.withOpacity(0.5),
                            );
                          },
                        ),
                        Text(
                          "Vitor Guirão Soller",
                          style: AppTextStyles.bold
                              .copyWith(fontSize: 30, color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 438,
                      child: Divider(
                        thickness: 2,
                        color: AppColors.brandingOrange,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Observer(
                          builder: (_) {
                            return Switch(
                              value: isSwitched,
                              onChanged: (value) {
                                toggleSwitch!();
                              },
                              activeColor: Colors.green,
                              inactiveThumbColor: Colors.red,
                              inactiveTrackColor: Colors.red.withOpacity(0.5),
                              activeTrackColor: Colors.green.withOpacity(0.5),
                            );
                          },
                        ),
                        Text(
                          "Vitor Guirão Soller",
                          style: AppTextStyles.bold
                              .copyWith(fontSize: 30, color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 438,
                      child: Divider(
                        thickness: 2,
                        color: AppColors.brandingOrange,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Observer(
                          builder: (_) {
                            return Switch(
                              value: isSwitched,
                              onChanged: (value) {
                                toggleSwitch!();
                              },
                              activeColor: Colors.green,
                              inactiveThumbColor: Colors.red,
                              inactiveTrackColor: Colors.red.withOpacity(0.5),
                              activeTrackColor: Colors.green.withOpacity(0.5),
                            );
                          },
                        ),
                        Text(
                          "Vitor Guirão Soller",
                          style: AppTextStyles.bold
                              .copyWith(fontSize: 30, color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 438,
                      child: Divider(
                        thickness: 2,
                        color: AppColors.brandingOrange,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Observer(
                          builder: (_) {
                            return Switch(
                              value: isSwitched,
                              onChanged: (value) {
                                toggleSwitch!();
                              },
                              activeColor: Colors.green,
                              inactiveThumbColor: Colors.red,
                              inactiveTrackColor: Colors.red.withOpacity(0.5),
                              activeTrackColor: Colors.green.withOpacity(0.5),
                            );
                          },
                        ),
                        Text(
                          "Vitor Guirão Soller",
                          style: AppTextStyles.bold
                              .copyWith(fontSize: 30, color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 438,
                      child: Divider(
                        thickness: 2,
                        color: AppColors.brandingOrange,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Observer(
                          builder: (_) {
                            return Switch(
                              value: isSwitched,
                              onChanged: (value) {
                                toggleSwitch!();
                              },
                              activeColor: Colors.green,
                              inactiveThumbColor: Colors.red,
                              inactiveTrackColor: Colors.red.withOpacity(0.5),
                              activeTrackColor: Colors.green.withOpacity(0.5),
                            );
                          },
                        ),
                        Text(
                          "Vitor Guirão Soller",
                          style: AppTextStyles.bold
                              .copyWith(fontSize: 30, color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 438,
                      child: Divider(
                        thickness: 2,
                        color: AppColors.brandingOrange,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Observer(
                          builder: (_) {
                            return Switch(
                              value: isSwitched,
                              onChanged: (value) {
                                toggleSwitch!();
                              },
                              activeColor: Colors.green,
                              inactiveThumbColor: Colors.red,
                              inactiveTrackColor: Colors.red.withOpacity(0.5),
                              activeTrackColor: Colors.green.withOpacity(0.5),
                            );
                          },
                        ),
                        Text(
                          "Vitor Guirão Soller",
                          style: AppTextStyles.bold
                              .copyWith(fontSize: 30, color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 438,
                      child: Divider(
                        thickness: 2,
                        color: AppColors.brandingOrange,
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
