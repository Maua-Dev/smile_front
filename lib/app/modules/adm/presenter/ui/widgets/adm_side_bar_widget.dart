import 'package:flutter/material.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/generated/l10n.dart';
import '../../../../../shared/themes/app_text_styles.dart';
import '../../../../dashboard/ui/shared/widgets/logout_button_widget.dart';
import '../../../../dashboard/ui/shared/widgets/sidebar_button_widget.dart';

class AdmSideBarWidget extends StatelessWidget {
  const AdmSideBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 115,
      height: double.infinity,
      color: AppColors.brandingBlue,
      child: Column(children: [
        const SizedBox(
          height: 20,
        ),
        LogoutButtonWidget(
          backgroundColor: const Color.fromARGB(255, 46, 66, 138),
          buttonTittle: S.of(context).exitTitle,
          onPressed: () {},
        ),
        const SizedBox(height: 50),
        SideBarButtonWidget(
          buttonText: S.of(context).activitiesTitle,
          buttonIcon: Icon(
            Icons.view_list_outlined,
            color: AppColors.white,
            size: 45,
          ),
          onPressedPath: '/adm',
          buttonColor: AppColors.brandingOrange,
        ),
        const SizedBox(height: 12),
        SideBarButtonWidget(
          buttonText: S.of(context).admReportsTitle,
          buttonIcon: Icon(
            Icons.person_search,
            color: AppColors.white,
            size: 45,
          ),
          onPressedPath: "",
          buttonColor: const Color.fromARGB(255, 46, 66, 138),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
            onPressed: () {},
            child: Column(
              children: [
                Icon(
                  Icons.create_new_folder,
                  color: AppColors.brandingOrange,
                ),
                Text(
                  S.of(context).activityCreateTitle,
                  style: AppTextStyles.headline1
                      .copyWith(color: AppColors.white, fontSize: 15),
                ),
              ],
            ))
      ]),
    );
  }
}
