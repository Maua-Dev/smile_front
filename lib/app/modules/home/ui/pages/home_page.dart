import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/home/ui/pages/footer/footer.dart';
import 'package:smile_front/app/modules/home/ui/pages/speakers-home/speakers_home_page.dart';
import 'package:smile_front/app/modules/home/ui/pages/sponsors-home/sponsors_home_page.dart';
import 'package:smile_front/app/modules/home/ui/pages/widgets/smile_loading_logo_widget.dart';
import 'package:smile_front/app/shared/widgets/app_bar/home_app_bar_widget.dart';
import 'package:smile_front/app/shared/widgets/drawer/end_drawer_widget.dart';
import 'package:smile_front/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../app_module.dart';
import '../../../../shared/entities/screen_variables.dart';
import '../../../../shared/themes/app_colors.dart';
import '../../../../shared/themes/app_text_styles.dart';
import '../../../../shared/utils/s3_assets_url.dart';
import '../../../../shared/utils/screen_helper.dart';
import '../../../auth/presenter/controllers/auth_controller.dart';
import 'activities-home/activities_home_page.dart';
import 'main-home/main_home_page.dart';
import 'widgets/header/h1_header_text_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
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

  void redirect() async {
    await Modular.isModuleReady<AppModule>();
    var authController = Modular.get<AuthController>();
    if (authController.role == 'ADMIN') {
      Modular.to.navigate('/adm');
    } else {
      Modular.to.navigate('/user/home');
    }
  }

  Future awaitToLoad() async {
    await Future.delayed(const Duration(milliseconds: 300));
  }

  Future showDialogWeb() async {
    (kIsWeb && MediaQuery.of(context).size.width < 1024 ||
            MediaQuery.of(context).size.height < 768)
        ? showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                alignment: Alignment.center,
                actionsAlignment: MainAxisAlignment.center,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                title: Text(
                  S.of(context).webDialogTitle,
                  textAlign: TextAlign.center,
                ),
                actionsOverflowAlignment: OverflowBarAlignment.center,
                actions: [
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () => launchUrl(
                          Uri.parse(
                              'https://apps.apple.com/br/app/smile-mau%C3%A1/id6448066992'),
                          mode: LaunchMode.externalApplication),
                      child: Container(
                        width: 200,
                        height: 70,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(downloadAppStore),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () => launchUrl(
                          Uri.parse(
                              'https://play.google.com/store/apps/details?id=com.br.smile.app'),
                          mode: LaunchMode.externalApplication),
                      child: Container(
                        width: 210,
                        height: 60,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                                CachedNetworkImageProvider(downloadPlayStore),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
          )
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: MediaQuery.of(context).size.width <= 1024
            ? EndDrawerWidget(
                scrollToActivity: scrollToActivity,
                scrollToHome: scrollToHome,
                scrollToSponsors: scrollToSponsors,
                redirect: redirect,
              )
            : null,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(56),
            child: HomeAppBarWidget(
              scrollToActivity: scrollToActivity,
              scrollToHome: scrollToHome,
              scrollToSponsors: scrollToSponsors,
              redirect: redirect,
            )),
        body: SafeArea(
          bottom: false,
          child: FutureBuilder(
              future: awaitToLoad(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    showDialogWeb();
                  });
                  return Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width < 2200
                          ? MediaQuery.of(context).size.width
                          : 2200,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 40,
                            ),
                            Text(
                              S.of(context).homeSubscription,
                              style: AppTextStyles.titleH1.copyWith(
                                  fontSize:
                                      (Screen.width(context) < cellphoneSize
                                          ? 24
                                          : MediaQuery.of(context).size.width <
                                                  tabletSize
                                              ? 32
                                              : 46),
                                  color: AppColors.brandingOrange),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(key: homeKey, child: const MainHomePage()),
                            const SpeakersHomePage(),
                            SizedBox(
                                key: activityKey,
                                child: const ActivitiesHomePage()),
                            const SponsorsHomePage(),
                            SizedBox(
                              key: sponsorsKey,
                              child: H1HeaderTextWidget(
                                title: S.of(context).sponsorsTitle,
                              ),
                            ),
                            const CompanySponsor(),
                            const SizedBox(
                              height: 32,
                            ),
                            const Footer(),
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  return Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      SmileLoadingLogoWidget(),
                      CircularProgressIndicator(),
                    ],
                  ));
                }
              }),
        ));
  }
}
