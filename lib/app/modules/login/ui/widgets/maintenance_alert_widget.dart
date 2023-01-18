import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:smile_front/generated/l10n.dart';

import '../../../../shared/themes/app_colors.dart';

class MainstenanceAlert extends StatelessWidget {
  const MainstenanceAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 400,
        width: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Icon(FontAwesome5.exclamation,
                  size: 80, color: AppColors.brandingOrange),
            ),
            Text(
              S.of(context).maintenanceTitle,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            Text(
              S.of(context).maintenanceDescription,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => Modular.to.navigate('/home'),
                child: Container(
                  color: AppColors.brandingOrange,
                  width: 500,
                  height: 50,
                  child: Center(
                      child: Text(
                    S.of(context).clickToGoBack,
                    style: TextStyle(color: AppColors.white, fontSize: 20),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
