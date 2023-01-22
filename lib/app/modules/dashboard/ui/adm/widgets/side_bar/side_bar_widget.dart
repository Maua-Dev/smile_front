import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
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
          backgroundColor: AppColors.brandingBlue,
          buttonTittle: 'Sair',
          onPressed: () {
            controller.logout();
          },
        ),
        const SizedBox(height: 50),
        SideBarButtonWidget(
          buttonText: 'Atividades',
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
          buttonText: 'Relatórios',
          buttonIcon: Icon(
            Icons.person_search,
            color: AppColors.white,
            size: 45,
          ),
          onPressedPath: "",
          buttonColor: AppColors.brandingBlue,
        ),
        const SizedBox(height: 20),
        Stack(
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
                'Criar Atividade',
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
