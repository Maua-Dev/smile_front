import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';
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
      backgroundColor: AppColors.brandingBlue,
      elevation: 40,
      child: ListView(
        controller: ScrollController(),
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            title: Text(
              'HOME',
              style: AppTextStyles.buttonBold.copyWith(fontSize: 16),
            ),
            onTap: () {
              Navigator.pop(context);
              scrollToHome!();
            },
          ),
          ListTile(
            title: Text(
              S.of(context).activitiesTitle,
              style: AppTextStyles.buttonBold.copyWith(fontSize: 16),
            ),
            onTap: () {
              Navigator.pop(context);
              scrollToActivity!();
            },
          ),
          ListTile(
            title: Text(
              S.of(context).sponsorsTitle.toUpperCase(),
              style: AppTextStyles.buttonBold.copyWith(fontSize: 16),
            ),
            onTap: () {
              Navigator.pop(context);
              scrollToSponsors!();
            },
          ),
          ListTile(
            title: AppbarButtonWidget(
              title: S.of(context).loginTitle.toUpperCase(),
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
