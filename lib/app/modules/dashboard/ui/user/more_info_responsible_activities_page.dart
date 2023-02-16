import 'package:flutter/material.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';
import 'package:smile_front/app/shared/themes/breakpoint.dart';

class MoreInfoResponsibleActivitiesPage extends StatelessWidget {
  const MoreInfoResponsibleActivitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
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
                Container(
                  width: MediaQuery.of(context).size.width < breakpointTablet
                      ? 339
                      : 484,
                  height: 50,
                  decoration: BoxDecoration(
                      color: AppColors.brandingOrange,
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        if (MediaQuery.of(context).size.width > 1020)
                          const SizedBox(width: 50),
                        Text('Lista de Inscritos',
                            style: AppTextStyles.bold.copyWith(
                                color: AppColors.white, fontSize: 30)),
                        if (MediaQuery.of(context).size.width > 1020)
                          Icon(
                            Icons.keyboard_arrow_up,
                            size: 50,
                            color: AppColors.white,
                          )
                      ]),
                ),
                if (MediaQuery.of(context).size.width > 720)
                  const SizedBox(
                    width: 20,
                  ),
                if (MediaQuery.of(context).size.width > 720)
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
                if (MediaQuery.of(context).size.width > 700)
                  const SizedBox(
                    width: 20,
                  ),
                Container(
                  width: MediaQuery.of(context).size.width < breakpointTablet
                      ? 339
                      : 484,
                  height: 50,
                  decoration: BoxDecoration(
                      color: AppColors.brandingOrange,
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        if (MediaQuery.of(context).size.width > 1020)
                          const SizedBox(width: 50),
                        Text('Gerar Token',
                            style: AppTextStyles.bold.copyWith(
                                color: AppColors.white, fontSize: 30)),
                        if (MediaQuery.of(context).size.width > 1020)
                          Icon(
                            Icons.keyboard_arrow_up,
                            size: 50,
                            color: AppColors.white,
                          )
                      ]),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
