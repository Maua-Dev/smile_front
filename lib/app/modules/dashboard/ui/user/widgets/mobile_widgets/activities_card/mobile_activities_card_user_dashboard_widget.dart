import 'package:flutter/material.dart';
import 'package:smile_front/app/shared/entities/screen_variables.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';
import 'package:smile_front/generated/l10n.dart';

class MobileActivitiesCardUserDashboard extends StatelessWidget {
  final String title;
  final String hour;
  final String finalTime;
  final String? location;
  final Function() onTap;
  final bool isLoading;
  const MobileActivitiesCardUserDashboard({
    Key? key,
    required this.title,
    required this.hour,
    required this.onTap,
    required this.isLoading,
    required this.finalTime,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(15),
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    spreadRadius: 0.5,
                    blurRadius: 3,
                    offset: const Offset(5, 5), // changes position of shadow
                  ),
                ]),
            width: MediaQuery.of(context).size.width < tabletSize ? 342 : 1165,
            height: MediaQuery.of(context).size.width < tabletSize ? 76 : 204,
            child: Row(children: [
              Container(
                  width:
                      MediaQuery.of(context).size.width < tabletSize ? 70 : 190,
                  height:
                      MediaQuery.of(context).size.width < tabletSize ? 76 : 204,
                  decoration: BoxDecoration(
                      color: AppColors.brandingBlue,
                      borderRadius: BorderRadius.circular(15)),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(hour,
                        style: AppTextStyles.bold.copyWith(
                            fontSize:
                                MediaQuery.of(context).size.width < tabletSize
                                    ? 20
                                    : 40)),
                  )),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width:
                                MediaQuery.of(context).size.width < tabletSize
                                    ? 215
                                    : 500,
                            height:
                                MediaQuery.of(context).size.width < tabletSize
                                    ? 34
                                    : 50,
                            child: Text(title,
                                maxLines: 2,
                                style: AppTextStyles.bold.copyWith(
                                    fontSize:
                                        MediaQuery.of(context).size.width <
                                                tabletSize
                                            ? 16
                                            : 30,
                                    color: AppColors.brandingBlue)),
                          ),
                          if (MediaQuery.of(context).size.width > tabletSize)
                            const SizedBox(width: 200),
                        ]),
                    Row(children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${S.of(context).termination}: $finalTime',
                              style: AppTextStyles.bold.copyWith(
                                  fontSize: MediaQuery.of(context).size.width <
                                          tabletSize
                                      ? 12
                                      : 24,
                                  color: Colors.black)),
                          Text('${S.of(context).local}: $location',
                              style: AppTextStyles.bold.copyWith(
                                  fontSize: MediaQuery.of(context).size.width <
                                          tabletSize
                                      ? 12
                                      : 24,
                                  color: Colors.black)),
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width < tabletSize
                            ? 53
                            : 368,
                      ),
                    ])
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios_sharp,
                  size:
                      MediaQuery.of(context).size.width < tabletSize ? 20 : 40)
            ]),
          ),
          const SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }
}
