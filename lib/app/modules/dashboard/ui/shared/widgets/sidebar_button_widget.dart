// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';

import '../../../../../shared/widgets/dialogs/custom_alert_dialog_widget.dart';

class SideBarButtonWidget extends StatelessWidget {
  final String buttonText;
  final String onPressedPath;
  final Icon buttonIcon;
  final Color buttonColor;

  const SideBarButtonWidget(
      {Key? key,
      required this.buttonText,
      required this.buttonIcon,
      required this.buttonColor,
      required this.onPressedPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90,
      height: 90,
      child: ElevatedButton(
        onPressed: onPressedPath == ''
            ? () {
                showDialog(
                  context: context,
                  builder: (context) => const CustomAlertDialogWidget(
                      title: 'Funcionalidade Indisponível',
                      content: 'Aguarde novas atualizações!'),
                );
              }
            : () {
                Modular.to.navigate(onPressedPath);
              },
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(20),
            backgroundColor: MaterialStateProperty.all(buttonColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            )),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          buttonIcon,
          Text(
            buttonText,
            style: AppTextStyles.body
                .copyWith(color: AppColors.white, fontSize: 12),
          )
        ]),
      ),
    );
  }
}
