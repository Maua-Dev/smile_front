import 'package:flutter/material.dart';
import 'package:smile_front/app/modules/home/ui/pages/homeAppBar/widgets/action_textbutton_widget.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 50,
          backgroundColor: AppColors.brandingBlue,
          title: Image.asset(
            'assets/images/logo_smile.png',
            fit: BoxFit.cover,
          ),
          actions: [
            ActionTextButtonWidget(
              boxWidth: 70,
              title: 'HOME',
            ),
            ActionTextButtonWidget(
              boxWidth: 70,
              title: 'SOBRE',
            ),
            ActionTextButtonWidget(
              boxWidth: 100,
              title: 'ATIVIDADES',
            ),
            ActionTextButtonWidget(
              boxWidth: 110,
              title: 'CALENDÁRIO',
            ),
            ActionTextButtonWidget(
              boxWidth: 90,
              title: 'LOGIN',
              backgroundColor: AppColors.brandingOrange,
            )
          ]),
    );
  }
}
