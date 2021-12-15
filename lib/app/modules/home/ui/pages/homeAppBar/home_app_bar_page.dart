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
        title: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Image.asset(
            'assets/images/logo_smile.png',
            fit: BoxFit.cover,
            height: 40,
          ),
        ),
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
          const ActionTextButtonWidget(
            title: 'CALENDÁRIO',
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: ActionTextButtonWidget(
              title: 'LOGIN',
              widthSize: 160,
              backgroundColor: AppColors.brandingOrange,
            ),
          )
        ]);
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight ?? kToolbarHeight);
}
