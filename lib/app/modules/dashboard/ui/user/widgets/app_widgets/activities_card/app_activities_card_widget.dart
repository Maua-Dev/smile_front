// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';

class AppActivitiesCard extends StatelessWidget {
  final String title;
  final String hour;
  final String finalTime;
  final String? location;
  final Function() onTap;

  const AppActivitiesCard({
    Key? key,
    required this.title,
    required this.hour,
    required this.onTap,
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
            width: 342,
            height: 76,
            child: Row(children: [
              Container(
                  width: 70,
                  height: 76,
                  decoration: BoxDecoration(
                      color: AppColors.brandingBlue,
                      borderRadius: BorderRadius.circular(15)),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(hour, style: AppTextStyles.bold),
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
                            width: 215,
                            height: 34,
                            child: Text(title,
                                maxLines: 2,
                                style: AppTextStyles.bold.copyWith(
                                    fontSize: 16,
                                    color: AppColors.brandingBlue)),
                          ),
                          Icon(Icons.star, color: AppColors.brandingOrange)
                        ]),
                    Row(children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Término: $finalTime',
                              style: AppTextStyles.bold
                                  .copyWith(fontSize: 12, color: Colors.black)),
                          Text('Local: $location',
                              style: AppTextStyles.bold
                                  .copyWith(fontSize: 12, color: Colors.black)),
                        ],
                      ),
                      const SizedBox(
                        width: 53,
                      ),
                      SizedBox(
                        width: 100,
                        height: 25,
                        child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      side: BorderSide(
                                          color: AppColors.brandingOrange))),
                              backgroundColor:
                                  MaterialStateProperty.all(AppColors.white),
                            ),
                            onPressed: () {},
                            child: Text('Inscrever-se',
                                style: AppTextStyles.bold.copyWith(
                                    fontSize: 12,
                                    color: AppColors.brandingOrange))),
                      )
                    ])
                  ],
                ),
              )
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
