import 'package:flutter/material.dart';

import '../../../../shared/themes/app_colors.dart';
import '../../../../shared/themes/app_text_styles.dart';

class SwitchToggleWidget extends StatefulWidget {
  const SwitchToggleWidget(
      {super.key, required this.tipo, required this.onChanged});

  final String tipo;
  final Function(bool?)? onChanged;

  @override
  State<SwitchToggleWidget> createState() =>
      // ignore: no_logic_in_create_state
      _SwitchToggleWidgetState(tipo: tipo, onChanged: onChanged);
}

class _SwitchToggleWidgetState extends State<SwitchToggleWidget> {
  _SwitchToggleWidgetState({required this.tipo, required this.onChanged});
  final String tipo;
  final Function(bool?)? onChanged;
  late bool isSwitched = false;

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
    } else {
      setState(() {
        isSwitched = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        width: MediaQuery.of(context).size.width < 650
            ? MediaQuery.of(context).size.width * 0.85
            : 600,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.gray,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: RichText(
                  text: TextSpan(
                      text: 'Quero receber notificações por ',
                      style: AppTextStyles.body.copyWith(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      children: [
                    TextSpan(
                        text: tipo.toUpperCase(),
                        style: AppTextStyles.body.copyWith(
                          color: AppColors.brandingOrange,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ))
                  ])),
            ),
            Switch(
                splashRadius: 8,
                activeTrackColor: AppColors.brandingOrange,
                activeColor: Colors.white,
                value: isSwitched,
                onChanged: (value) {
                  toggleSwitch(value);
                  onChanged;
                })
          ],
        ));
  }
}
