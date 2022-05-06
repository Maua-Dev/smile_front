import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/home/ui/pages/footer/footer.dart';
import 'package:smile_front/app/modules/home/ui/pages/speakers-home/speakers_home_page.dart';
import 'package:smile_front/app/modules/home/ui/pages/sponsors-home/sponsors_home_page.dart';
import 'package:smile_front/app/modules/home/ui/pages/widgets/appbar_button_widget.dart';
import 'package:smile_front/app/modules/home/ui/pages/widgets/video_player/video_player_widget.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';
import '../../../../app_module.dart';
import '../../../../shared/utils/s3_assets_url.dart';
import '../../../auth/presenter/controllers/auth_controller.dart';
import 'activities-home/activities_home_page.dart';
import 'main-home/main_home_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();

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

class _HomePageState extends State<HomePage> {
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawer: MediaQuery.of(context).size.width < 1024
            ? Drawer(
                backgroundColor: AppColors.brandingPurple,
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
                        scrollToHome();
                      },
                    ),
                    ListTile(
                      title: Text(
                        'ATIVIDADES',
                        style: AppTextStyles.buttonBold.copyWith(fontSize: 16),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        scrollToActivity();
                      },
                    ),
                    ListTile(
                      title: Text(
                        'PATROCINADORES',
                        style: AppTextStyles.buttonBold.copyWith(fontSize: 16),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        scrollToSponsors();
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
                          widget.redirect();
                        },
                      ),
                    ),
                  ],
                ),
              )
            : null,
        appBar: AppBar(
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
            ]),
        body: SafeArea(
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width < 2200
                  ? MediaQuery.of(context).size.width
                  : 2200,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(key: homeKey, child: const MainHomePage()),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.width < 1024
                            ? MediaQuery.of(context).size.height * 0.4
                            : MediaQuery.of(context).size.height * 0.5,
                        width: MediaQuery.of(context).size.width < 1024
                            ? MediaQuery.of(context).size.height * 0.6
                            : MediaQuery.of(context).size.width * 0.5,
                        child: const VideoPlayerWidget(),
                      ),
                    ),
                    const SpeakersHomePage(),
                    SizedBox(
                        key: activityKey, child: const ActivitiesHomePage()),
                    SizedBox(key: sponsorsKey, child: const SponsorsHomePage()),
                    const Footer(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
