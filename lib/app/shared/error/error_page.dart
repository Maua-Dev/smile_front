import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/app_module.dart';
import 'package:smile_front/app/modules/home/ui/pages/widgets/appbar_button_widget.dart';
import 'package:smile_front/app/modules/home/ui/pages/widgets/smile_loading_logo_widget.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/utils/s3_assets_url.dart';
import '../../modules/auth/presenter/controllers/auth_controller.dart';
import '../../modules/home/ui/pages/footer/footer.dart';
import '../themes/app_text_styles.dart';

class ErrorPage extends StatefulWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  State<ErrorPage> createState() => _ErrorPageState();

  void redirectLogin() async {
    await Modular.isModuleReady<AppModule>();
    var authController = Modular.get<AuthController>();
    if (authController.accessLevel == 'ADMIN') {
      Modular.to.navigate('/adm');
    } else {
      Modular.to.navigate('/user/home');
    }
  }

  void redirectHome() async {
    await Modular.isModuleReady<AppModule>();
    Modular.to.navigate('/home');
  }
}

class _ErrorPageState extends State<ErrorPage> {
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
    return Scaffold(
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
                  onPressed: () async {
                    widget.redirectHome();
                  },
                ),
              if (MediaQuery.of(context).size.width > 1024)
                AppbarButtonWidget(
                  title: 'ATIVIDADES',
                  paddingHorizontal:
                      MediaQuery.of(context).size.width < 1300 ? 8 : 16,
                  paddingVertical: 8,
                  onPressed: () async {
                    widget.redirectHome();
                  },
                ),
              if (MediaQuery.of(context).size.width > 1024)
                AppbarButtonWidget(
                  title: 'PATROCINADORES',
                  paddingHorizontal:
                      MediaQuery.of(context).size.width < 1300 ? 8 : 16,
                  paddingVertical: 8,
                  onPressed: () async {
                    widget.redirectHome();
                    awaitToLoad();
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
                      widget.redirectLogin();
                    },
                  ),
                )
            ]),
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
                          Padding(
                            padding: const EdgeInsets.only(top: 160.0),
                            child: Text('Página não encontrada...',
                                style: AppTextStyles.titleH1,
                                textAlign: TextAlign.center),
                          ),
                          Text(
                              'O link em que você clicou pode não estar funcioando, ou a página pode ter sido removida.',
                              style: AppTextStyles.body,
                              textAlign: TextAlign.center),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.width < 1024
                                        ? 4
                                        : 24),
                            child: SizedBox(
                              height: 184,
                              width: MediaQuery.of(context).size.width < 1024
                                  ? 400
                                  : 800,
                            ),
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
            }));
  }
}
