import 'package:flutter/material.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_web.dart';
import '../../../modules/home/ui/pages/widgets/appbar_button_widget.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_text_styles.dart';

class EndDrawerWidget extends StatelessWidget {
  final Function()? scrollToHome;
  final Function()? scrollToActivity;
  final Function()? scrollToSponsors;
  final Function()? redirect;
  const EndDrawerWidget(
      {super.key,
      this.scrollToHome,
      this.scrollToActivity,
      this.scrollToSponsors,
      this.redirect});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.brandingPurple,
      elevation: 40,
      child: ListView(
        controller: ScrollController(),
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            title: TextRenderer(
              child: Text(
                'HOME',
                style: AppTextStyles.buttonBold.copyWith(fontSize: 16),
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              scrollToHome!();
            },
          ),
          ListTile(
            title: TextRenderer(
              child: Text(
                'ATIVIDADES',
                style: AppTextStyles.buttonBold.copyWith(fontSize: 16),
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              scrollToActivity!();
            },
          ),
          ListTile(
            title: TextRenderer(
              child: Text(
                'PATROCINADORES',
                style: AppTextStyles.buttonBold.copyWith(fontSize: 16),
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              scrollToSponsors!();
            },
          ),
          ListTile(
            title: AppbarButtonWidget(
              title: 'LOGIN',
              textStyle: AppTextStyles.buttonBold
                  .copyWith(color: Colors.white, fontSize: 16),
              paddingHorizontal: 8,
              paddingVertical: 8,
              widthSize: 160,
              backgroundColor: AppColors.brandingOrange,
              onPressed: () async {
                redirect!();
              },
            ),
          ),
        ],
      ),
    );
  }
}
