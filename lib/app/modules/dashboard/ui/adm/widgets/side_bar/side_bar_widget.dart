import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/generated/l10n.dart';
import '../../../../../../shared/themes/app_text_styles.dart';
import '../../../../presenter/controllers/adm/adm_dashboard_controller.dart';
import '../../../shared/widgets/logout_button_widget.dart';
import '../../../shared/widgets/sidebar_button_widget.dart';

class SideBarWidget extends StatefulWidget {
  const SideBarWidget({Key? key}) : super(key: key);

  @override
  State<SideBarWidget> createState() => _SideBarWidgetState();
}

class _SideBarWidgetState
    extends ModularState<SideBarWidget, AdmDashboardController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 115,
      height: double.infinity,
      color: AppColors.brandingBlue,
      child: Column(children: [
        const SizedBox(height: 20),
        LogoutButtonWidget(
          backgroundColor: const Color.fromARGB(255, 46, 66, 138),
          buttonTittle: S.of(context).exitTitle,
          onPressed: () {
            controller.logout();
          },
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
        Stack(
          alignment: Alignment.center,
          children: [
            IconButton(
              onPressed: () {
                Modular.to.navigate('/adm/create-activity');
              },
              icon: const Icon(Icons.create_new_folder),
              color: AppColors.brandingOrange,
              iconSize: 78,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Text(
                S.of(context).activityCreateTitle,
                style: AppTextStyles.body
                    .copyWith(color: AppColors.white, fontSize: 15),
              ),
            )
          ],
        )
      ]),
    );
  }
}
