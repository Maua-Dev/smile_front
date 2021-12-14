import 'package:flutter/material.dart';
import 'package:smile_front/app/modules/home/ui/pages/homeAppBar/widgets/action_textbutton_widget.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double? toolbarHeight;
  const HomeAppBar({Key? key, this.toolbarHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: AppColors.brandingBlue,
        title: const Text('smile'),
        // Image.asset(
        //   'assets/images/logo_smile.png',
        //   fit: BoxFit.cover,
        // ),
        actions: [
          const ActionTextButtonWidget(
            title: 'HOME',
          ),
          const ActionTextButtonWidget(
            title: 'SOBRE',
          ),
          const ActionTextButtonWidget(
            title: 'ATIVIDADES',
          ),
          ActionTextButtonWidget(
            title: 'CALENDÁRIO',
            backgroundColor: AppColors.brandingBlue,
          ),
          ActionTextButtonWidget(
            title: 'LOGIN',
            backgroundColor: AppColors.brandingOrange,
          )
        ]);
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight ?? kToolbarHeight);
}
