import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/home/ui/pages/footer/footer.dart';
import 'package:smile_front/app/modules/home/ui/pages/speakers-home/speakers_home_page.dart';
import 'package:smile_front/app/modules/home/ui/pages/sponsors-home/sponsors_home_page.dart';
import 'package:smile_front/app/modules/home/ui/pages/widgets/smile_loading_logo_widget.dart';
import 'package:smile_front/app/shared/widgets/app_bar/home_app_bar_widget.dart';
import 'package:smile_front/app/shared/widgets/drawer/end_drawer_widget.dart';
import '../../../../app_module.dart';
import '../../../auth/presenter/controllers/auth_controller.dart';
import 'activities-home/activities_home_page.dart';
import 'main-home/main_home_page.dart';

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
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          endDrawer: MediaQuery.of(context).size.width < 1024
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
          body: FutureBuilder(
              future: awaitToLoad(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width < 2200
                          ? MediaQuery.of(context).size.width
                          : 2200,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(key: homeKey, child: const MainHomePage()),
                            const SpeakersHomePage(),
                            SizedBox(
                                key: activityKey,
                                child: const ActivitiesHomePage()),
                            SizedBox(
                                key: sponsorsKey,
                                child: const SponsorsHomePage()),
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
              })),
    );
  }
}
