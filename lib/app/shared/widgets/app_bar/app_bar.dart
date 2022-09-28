import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/app_module.dart';
import 'package:smile_front/app/modules/home/ui/pages/widgets/appbar_button_widget.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';
import 'package:smile_front/app/shared/utils/s3_assets_url.dart';

import '../../../modules/auth/presenter/controllers/auth_controller.dart';
import '../../themes/app_colors.dart';

class AppBarDesign extends StatefulWidget {
  const AppBarDesign({super.key});

  @override
  State<AppBarDesign> createState() => _AppBarDesignState();

  void redirect() async {
    await Modular.isModuleReady<AppModule>();
    var authController = Modular.get<AuthController>();
    if (authController.accessLevel == 'ADMIN') {
      Modular.to.navigate('/adm');
    } else {
      Modular.to.navigate('/user/home');
    }
  }
}

class _AppBarDesignState extends State<AppBarDesign> {
  final homeKey = GlobalKey();
  final activityKey = GlobalKey();
  final sponsorsKey = GlobalKey();

  Future scrollToHome() async {
    final context = homeKey.currentContext;
    await Scrollable.ensureVisible(context!,
        duration: const Duration(milliseconds: 1500));
  }

  Future scrollToActivity() async {
    final context = activityKey.currentContext;
    await Scrollable.ensureVisible(context!,
        duration: const Duration(milliseconds: 1500));
  }

  Future scrollToSponsors() async {
    final context = sponsorsKey.currentContext;
    await Scrollable.ensureVisible(context!,
        duration: const Duration(milliseconds: 1500));
  }

  Future awaitToLoad() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 40,
        backgroundColor: AppColors.brandingPurple,
        centerTitle: false,
        leadingWidth: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 32.0),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        alignment: Alignment.centerLeft,
                        image: CachedNetworkImageProvider(
                          smileeeLogoUrl,
                        ))),
              ),
            ),
          ),
        ),
        actions: [
          if (MediaQuery.of(context).size.width > 1024)
            AppbarButtonWidget(
              title: 'HOME',
              paddingHorizontal:
                  MediaQuery.of(context).size.width < 1300 ? 8 : 16,
              paddingVertical: 8,
              onPressed: () {
                scrollToHome();
              },
            ),
          if (MediaQuery.of(context).size.width > 1024)
            AppbarButtonWidget(
              title: 'ATIVIDADES',
              paddingHorizontal:
                  MediaQuery.of(context).size.width < 1300 ? 8 : 16,
              paddingVertical: 8,
              onPressed: () {
                scrollToActivity();
              },
            ),
          if (MediaQuery.of(context).size.width > 1024)
            AppbarButtonWidget(
              title: 'PATROCINADORES',
              paddingHorizontal:
                  MediaQuery.of(context).size.width < 1300 ? 8 : 16,
              paddingVertical: 8,
              onPressed: () {
                scrollToSponsors();
              },
            ),
          if (MediaQuery.of(context).size.width > 1024)
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: AppbarButtonWidget(
                title: 'LOGIN',
                textStyle: AppTextStyles.buttonBold.copyWith(
                    color: Colors.white,
                    fontSize:
                        MediaQuery.of(context).size.width < 1300 ? 20 : 24),
                paddingHorizontal:
                    MediaQuery.of(context).size.width < 1300 ? 8 : 16,
                paddingVertical: 8,
                widthSize: 160,
                backgroundColor: AppColors.brandingOrange,
                onPressed: () async {
                  widget.redirect();
                },
              ),
            )
        ]);
  }
}
