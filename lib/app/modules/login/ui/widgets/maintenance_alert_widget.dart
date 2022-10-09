import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_web.dart';

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
            const TextRenderer(
              child: Text(
                "O serviço de login esta em manutenção",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
            const TextRenderer(
              child: Text(
                "Agradecemos a paciência",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
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
                    child: TextRenderer(
                        child: Text(
                      "Clique aqui para voltar",
                      style: TextStyle(color: AppColors.white, fontSize: 20),
                    )),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
